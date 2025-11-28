# Patroni HA PostgreSQL for XNAT

This document describes how to run XNAT with a highly-available PostgreSQL cluster using Patroni.

## Overview

Patroni provides automatic failover for PostgreSQL. If the primary database fails, a replica is automatically promoted to primary with minimal downtime.

### Architecture

```
                    ┌─────────────────┐
                    │    HAProxy      │ :5432 → primary
                    │   :7000 stats   │ :5433 → replicas
                    └────────┬────────┘
                             │
            ┌────────────────┴────────────────┐
            │                                 │
     ┌──────▼──────┐                  ┌───────▼─────┐
     │   Primary   │◄────────────────►│   Replica   │
     │  (Patroni)  │ streaming repl   │  (Patroni)  │
     │   :5432     │                  │   :5432     │
     └──────┬──────┘                  └──────┬──────┘
            │                                │
            └────────────┬───────────────────┘
                         │
                  ┌──────▼──────┐
                  │    etcd     │
                  │  (leader    │
                  │  election)  │
                  │   :2379     │
                  └─────────────┘
```

### Components

| Component | Purpose | Ports |
|-----------|---------|-------|
| **etcd** | Distributed consensus for leader election | 2379 (client), 2380 (peer) |
| **patroni-primary** | PostgreSQL node (initially primary) | 5432, 8008 (API) |
| **patroni-replica** | PostgreSQL node (initially replica) | 5432, 8008 (API) |
| **patroni-haproxy** | Load balancer - routes to current primary | 5432 (PG), 7000 (stats) |

## Docker Compose Setup

### Quick Start

```bash
# Switch to Patroni HA mode
./scripts/switch-db-mode.sh patroni

# Check status
./scripts/switch-db-mode.sh status

# Switch back to simple mode
./scripts/switch-db-mode.sh simple
```

### Manual Start

```bash
# 1. Use Patroni environment
cp .env.patroni .env

# 2. Start with Patroni overlay
docker-compose -f docker-compose.yml -f docker-compose.patroni.yml up -d

# 3. Wait ~30 seconds for cluster to initialize

# 4. Verify cluster
docker exec patroni-primary patronictl list
```

### Files

| File | Purpose |
|------|---------|
| `docker-compose.patroni.yml` | Docker Compose override for Patroni |
| `.env.patroni` | Environment with HAProxy database URL |
| `patroni/patroni-primary.yml` | Patroni config for primary |
| `patroni/patroni-replica.yml` | Patroni config for replica |
| `patroni/haproxy.cfg` | HAProxy routing config |

### Data Directories

| Directory | Purpose |
|-----------|---------|
| `patroni-data/etcd/` | etcd consensus data |
| `patroni-data/primary/` | PostgreSQL data (primary) |
| `patroni-data/replica/` | PostgreSQL data (replica) |

## Kubernetes Setup

### Deploy Patroni on K8s

```bash
# Apply the Patroni HA manifest
kubectl apply -f k8s/postgres-patroni-ha.yaml

# Wait for pods
kubectl -n xnat get pods -w

# Check cluster status
kubectl -n xnat exec patroni-0 -- patronictl list
```

### Files

| File | Purpose |
|------|---------|
| `k8s/postgres-patroni-ha.yaml` | Complete Patroni setup including etcd, StatefulSets, RBAC |

### K8s Components

- **etcd StatefulSet** (3 replicas) - Leader election
- **patroni StatefulSet** (3 replicas) - PostgreSQL nodes
- **ServiceAccount + RBAC** - Patroni needs K8s API access
- **Services**:
  - `patroni` (headless) - StatefulSet DNS
  - `patroni-primary` - Routes to current primary
  - `patroni-replica` - Routes to replicas

## Demo: Automatic Failover

### Using the Script

```bash
./scripts/switch-db-mode.sh failover
```

### Manual Demo

```bash
# 1. Check current cluster status
docker exec patroni-primary patronictl list

# Output:
# + Cluster: xnat (12345678) -------+
# | Member  | Host | Role    | State   |
# +---------+------+---------+---------+
# | primary | ...  | Leader  | running |
# | replica | ...  | Replica | running |
# +---------+------+---------+---------+

# 2. Kill the primary
docker stop patroni-primary

# 3. Wait 10-15 seconds for failover
sleep 15

# 4. Check status - replica is now leader!
docker exec patroni-replica patronictl list

# Output:
# + Cluster: xnat (12345678) -------+
# | Member  | Host | Role    | State   |
# +---------+------+---------+---------+
# | replica | ...  | Leader  | running |
# +---------+------+---------+---------+

# 5. Restart old primary (becomes replica)
docker start patroni-primary
sleep 10

# 6. Final status - both nodes running
docker exec patroni-replica patronictl list

# Output:
# + Cluster: xnat (12345678) -------+
# | Member  | Host | Role    | State   |
# +---------+------+---------+---------+
# | replica | ...  | Leader  | running |
# | primary | ...  | Replica | running |
# +---------+------+---------+---------+
```

### What Happens During Failover

1. **Detection** (~10s): etcd notices primary is unresponsive
2. **Election** (~5s): Patroni elects new leader
3. **Promotion**: Replica promotes itself to primary
4. **HAProxy Update**: Routes traffic to new primary
5. **XNAT Impact**: Brief connection errors, then automatic reconnect

## Migration: Simple → Patroni

If you have existing data in simple PostgreSQL:

```bash
./scripts/switch-db-mode.sh migrate
```

This will:
1. Stop all services
2. Dump data from `xnat-db`
3. Start Patroni cluster
4. Restore data to Patroni primary

### Manual Migration

```bash
# 1. Dump from simple PostgreSQL
docker exec xnat-db pg_dump -U xnat -d xnat > xnat_backup.sql

# 2. Switch to Patroni mode
./scripts/switch-db-mode.sh patroni

# 3. Wait for cluster to initialize
sleep 30

# 4. Restore to Patroni
docker exec -i patroni-primary psql -U xnat -d xnat < xnat_backup.sql
```

## Monitoring

### HAProxy Stats

Open http://localhost:7000 for HAProxy statistics:
- Shows which backend is primary
- Connection counts
- Health check status

### Patroni API

```bash
# Primary status
curl http://localhost:8008/primary

# Replica status
curl http://localhost:8008/replica

# Cluster info
curl http://localhost:8008/cluster
```

### PostgreSQL Replication

```bash
# On primary - show connected replicas
docker exec patroni-primary psql -U postgres -c \
  "SELECT client_addr, state, sent_lsn, write_lsn FROM pg_stat_replication;"

# On replica - confirm recovery mode
docker exec patroni-replica psql -U postgres -c \
  "SELECT pg_is_in_recovery();"
```

## Connection Strings

### For XNAT (recommended)

Use HAProxy for automatic failover:

```
jdbc:postgresql://patroni-haproxy:5432/xnat
```

### Direct Connections (testing only)

```
# Primary
jdbc:postgresql://patroni-primary:5432/xnat

# Replica (read-only)
jdbc:postgresql://patroni-replica:5432/xnat
```

## Troubleshooting

### Cluster Not Forming

```bash
# Check etcd
docker logs patroni-etcd

# Check Patroni logs
docker logs patroni-primary
docker logs patroni-replica

# Common issues:
# - etcd not ready (wait longer)
# - Network issues between containers
# - Incorrect hostnames in config
```

### HAProxy Not Routing

```bash
# Test Patroni API from HAProxy
docker exec patroni-haproxy curl -s http://patroni-primary:8008/primary
docker exec patroni-haproxy curl -s http://patroni-replica:8008/replica

# Check HAProxy logs
docker logs patroni-haproxy
```

### Split Brain Prevention

Patroni uses etcd for consensus. If etcd quorum is lost:
- No new leader can be elected
- Existing primary continues (if reachable)
- This prevents split-brain scenarios

### Reset Everything (destroys data!)

```bash
docker-compose -f docker-compose.yml -f docker-compose.patroni.yml down -v
rm -rf patroni-data/
./scripts/switch-db-mode.sh patroni
```

## Configuration Reference

### Patroni Settings

Key settings in `patroni/patroni-primary.yml`:

```yaml
bootstrap:
  dcs:
    ttl: 30                        # Leader TTL (seconds)
    loop_wait: 10                  # Check interval
    retry_timeout: 10              # Retry on failure
    maximum_lag_on_failover: 1048576  # Max replication lag (bytes)
```

### PostgreSQL Settings

```yaml
postgresql:
  parameters:
    max_connections: 200
    shared_buffers: 256MB
    wal_level: replica
    max_wal_senders: 10
    max_replication_slots: 10
```

### HAProxy Settings

Key settings in `patroni/haproxy.cfg`:

```
# Health check interval
default-server inter 3s fall 3 rise 2

# Action when backend marked down
on-marked-down shutdown-sessions
```

## Comparison: Simple vs Patroni

| Aspect | Simple | Patroni |
|--------|--------|---------|
| **Nodes** | 1 | 2+ |
| **Failover** | Manual | Automatic |
| **Downtime on failure** | Until manual recovery | ~15-30 seconds |
| **Complexity** | Low | Medium |
| **Resource usage** | Lower | Higher |
| **Use case** | Dev/test | Production |

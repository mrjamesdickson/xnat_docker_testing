# Patroni HA PostgreSQL for XNAT

This directory contains configuration for running PostgreSQL in High Availability mode using Patroni.

## Architecture

```
                        ┌─────────────────┐
                        │    HAProxy      │ :5432 (primary)
                        │   :7000 (stats) │ :5433 (replicas)
                        └────────┬────────┘
                                 │
                ┌────────────────┴────────────────┐
                │                                 │
         ┌──────▼──────┐                  ┌───────▼─────┐
         │   Primary   │◄────────────────►│   Replica   │
         │  (Patroni)  │ streaming repl   │  (Patroni)  │
         └──────┬──────┘                  └──────┬──────┘
                │                                │
                └────────────┬───────────────────┘
                             │
                      ┌──────▼──────┐
                      │    etcd     │
                      │  (leader    │
                      │  election)  │
                      └─────────────┘
```

## Components

| Component | Purpose | Port |
|-----------|---------|------|
| `patroni-etcd` | Distributed consensus for leader election | 2379, 2380 |
| `patroni-primary` | PostgreSQL node (initially primary) | 5432, 8008 |
| `patroni-replica` | PostgreSQL node (initially replica) | 5432, 8008 |
| `patroni-haproxy` | Load balancer - routes to current primary | 5432, 7000 |

## Quick Start

### Start Patroni HA Mode

```bash
# From xnat_docker_testing directory
./scripts/switch-db-mode.sh patroni
```

### Start Simple Mode (default)

```bash
./scripts/switch-db-mode.sh simple
```

### Check Status

```bash
./scripts/switch-db-mode.sh status
```

## Manual Commands

### Start Patroni without script

```bash
# Use .env.patroni for database URL
cp .env.patroni .env

# Start all services with Patroni
docker-compose -f docker-compose.yml -f docker-compose.patroni.yml up -d
```

### Check Cluster Status

```bash
# Via patronictl
docker exec patroni-primary patronictl list

# Via HAProxy stats
open http://localhost:7000
```

### View Replication Status

```bash
# On primary
docker exec patroni-primary psql -U postgres -c "SELECT * FROM pg_stat_replication;"

# On replica
docker exec patroni-replica psql -U postgres -c "SELECT pg_is_in_recovery();"
```

## Demo: Failover

Demonstrate automatic failover when the primary fails:

```bash
./scripts/switch-db-mode.sh failover
```

Or manually:

```bash
# 1. Check current status
docker exec patroni-primary patronictl list

# 2. Kill the primary
docker stop patroni-primary

# 3. Wait 10-15 seconds, then check status
docker exec patroni-replica patronictl list
# Replica should now be primary!

# 4. Restart old primary (becomes replica)
docker start patroni-primary

# 5. Check final status
docker exec patroni-primary patronictl list
```

## Configuration Files

| File | Purpose |
|------|---------|
| `patroni-primary.yml` | Patroni config for primary node |
| `patroni-replica.yml` | Patroni config for replica node |
| `haproxy.cfg` | HAProxy config for routing to primary |

## Data Directories

| Directory | Purpose |
|-----------|---------|
| `patroni-data/etcd/` | etcd consensus data |
| `patroni-data/primary/` | PostgreSQL data for primary |
| `patroni-data/replica/` | PostgreSQL data for replica |

## Migrating from Simple to Patroni

If you have existing data in simple PostgreSQL mode:

```bash
./scripts/switch-db-mode.sh migrate
```

This will:
1. Dump data from `xnat-db`
2. Start Patroni cluster
3. Restore data to Patroni primary

## Connection Strings

### For XNAT (via HAProxy)

```
jdbc:postgresql://patroni-haproxy:5432/xnat
```

### Direct to Primary (not recommended for apps)

```
jdbc:postgresql://patroni-primary:5432/xnat
```

### Direct to Replica (read-only)

```
jdbc:postgresql://patroni-replica:5432/xnat
```

## Troubleshooting

### Cluster not forming

```bash
# Check etcd
docker logs patroni-etcd

# Check Patroni logs
docker logs patroni-primary
docker logs patroni-replica
```

### HAProxy not routing

```bash
# Check HAProxy can reach Patroni
docker exec patroni-haproxy curl -s http://patroni-primary:8008/primary
docker exec patroni-haproxy curl -s http://patroni-replica:8008/replica
```

### Reset cluster (destroys data!)

```bash
docker-compose -f docker-compose.yml -f docker-compose.patroni.yml down -v
rm -rf patroni-data/
./scripts/switch-db-mode.sh patroni
```

# XNAT Docker Testing - Podman Setup

This document describes how to run the XNAT Docker testing environment using Podman instead of Docker/Colima.

## Why Podman?

| Feature | Podman | Colima/Docker |
|---------|--------|---------------|
| Architecture | Daemonless, native | VM-based |
| Permissions | Better rootless support | Frequent UID/GID issues |
| Resource usage | Lighter | Heavier (full VM) |
| File permissions | Handles mounted volumes better | Common permission errors |
| Docker compatibility | Drop-in replacement | Native Docker |

## Prerequisites

- Podman installed at `/opt/podman/bin/podman`
- Add to PATH or use full path

## Initial Setup

### 1. Initialize Podman Machine (first time only)

```bash
/opt/podman/bin/podman machine init --cpus 4 --memory 8192 --disk-size 100
```

### 2. Set Rootful Mode (required for port 80)

```bash
/opt/podman/bin/podman machine set --rootful
```

### 3. Start Podman Machine

```bash
/opt/podman/bin/podman machine start
```

Podman will forward the Docker socket to `/var/run/docker.sock`, so `docker-compose` works directly.

## Running XNAT

### Start Containers

```bash
cd /Users/james/projects/xnat_docker_testing
docker-compose up -d
```

### Check Status

```bash
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

### View Logs

```bash
docker logs xnat-web
docker logs -f xnat-web  # Follow logs
```

### Stop Containers

```bash
docker-compose down
```

## Switching from Colima

If you were using Colima:

```bash
# Stop Colima
colima stop

# Start Podman
/opt/podman/bin/podman machine start

# docker-compose will now use Podman
docker-compose up -d
```

## Troubleshooting

### "link is not supported" Error

Podman doesn't support the deprecated `links` directive. Remove any `links:` sections from `docker-compose.yml`. Use `depends_on` and networking instead (containers on the same network can already communicate by name).

### Buildkit Container Conflicts

If you see buildkit container name conflicts during parallel builds:

```bash
docker rm -f buildx_buildkit_default
docker-compose build xnat-web  # Build one service first
docker-compose up -d
```

### Machine Not Running

```bash
/opt/podman/bin/podman machine start
```

### Check Machine Status

```bash
/opt/podman/bin/podman machine list
```

## Container Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                       xnat-nginx (port 80)                   │
│                     Load balancer / reverse proxy            │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        ▼                     ▼                     ▼
┌───────────────┐    ┌───────────────┐    ┌───────────────┐
│   xnat-web    │    │  xnat-web-2   │    │  xnat-web-3   │
│   (Tomcat)    │    │   (Tomcat)    │    │   (Tomcat)    │
└───────────────┘    └───────────────┘    └───────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              ▼
                     ┌───────────────┐
                     │    xnat-db    │
                     │  (PostgreSQL) │
                     └───────────────┘
                              │
                              ▼
                     ┌───────────────┐
                     │ xnat-activemq │
                     │   (ActiveMQ)  │
                     └───────────────┘
```

## Ports

| Service | Port | Description |
|---------|------|-------------|
| xnat-nginx | 80 | XNAT web interface |
| xnat-activemq | 8161 | ActiveMQ admin console |
| xnat-activemq | 61616 | ActiveMQ broker |
| xnat-activemq | 61613 | STOMP protocol |

## Accessing XNAT

After containers start (allow ~90 seconds for XNAT to initialize):

- **XNAT**: http://localhost/
- **ActiveMQ Console**: http://localhost:8161/

## Data Persistence

Data is stored in mounted volumes:
- `postgres-data/` - PostgreSQL database
- `xnat-data/` - XNAT archive, cache, etc.
- `activemq-data/` - ActiveMQ data

## Plugin Deployment (CRITICAL for Cluster)

**IMPORTANT:** When deploying plugins to a cluster environment, **ALL web containers must be restarted**, not just one. This is because all nodes share the same `xnat/plugins` and `xnat/webapp` volumes. If only one node is restarted, the other nodes will have stale file references and return 500 errors.

### Deploying Plugins

Use the provided deployment script which handles cluster restarts automatically:

```bash
cd /Users/james/projects/xnat_docker_testing

# Deploy all plugins from xnat_*_plugin directories
./deploy_all_plugins.sh
```

### Manual Deployment

If deploying manually, **restart ALL web nodes and nginx**:

```bash
# 1. Copy plugin JAR to plugins directory
cp /path/to/plugin.jar ./xnat/plugins/

# 2. Restart ALL web containers (not just xnat-web!)
docker-compose restart xnat-web xnat-web-2 xnat-web-3 xnat-web-4 xnat-web-5

# 3. Wait for startup (90 seconds minimum)
sleep 90

# 4. Restart nginx to refresh DNS (container IPs change after restart)
docker-compose restart xnat-nginx

# 5. Verify all nodes are healthy
for node in xnat-web xnat-web-2 xnat-web-3 xnat-web-4 xnat-web-5; do
  echo -n "$node: "
  docker exec xnat-nginx curl -s -o /dev/null -w '%{http_code}' http://$node:8080/
  echo ""
done
# All nodes should return 302
```

**Note:** The nginx restart is required because Docker/Podman assigns new IP addresses to containers when they restart. Nginx caches DNS lookups at startup, so without restarting nginx, it will try to connect to the old IPs and get "Host unreachable" errors.

### Troubleshooting Plugin Deployment

**Symptom:** Some nodes return 500, others return 302

**Cause:** Only some nodes were restarted after plugin deployment

**Solution:** Restart all web containers:
```bash
docker-compose restart xnat-web xnat-web-2 xnat-web-3 xnat-web-4 xnat-web-5
```

**Symptom:** All nodes return 500 after restart

**Cause:** Plugin has an error preventing XNAT from starting

**Solution:** Check logs for errors:
```bash
docker logs xnat-web 2>&1 | tail -50
docker exec xnat-web tail -100 /data/xnat/home/logs/spring.log
```

**Symptom:** External access returns 502 Bad Gateway, but nodes work internally

**Cause:** Nginx has stale DNS cache (container IPs changed after restart)

**Solution:** Restart nginx:
```bash
docker-compose restart xnat-nginx
```

### Verifying Cluster Health

```bash
# Check all nodes from inside nginx
for node in xnat-web xnat-web-2 xnat-web-3 xnat-web-4 xnat-web-5; do
  echo -n "$node: "
  docker exec xnat-nginx curl -s -o /dev/null -w '%{http_code}' http://$node:8080/
  echo ""
done

# Expected output (all should be 302):
# xnat-web: 302
# xnat-web-2: 302
# xnat-web-3: 302
# xnat-web-4: 302
# xnat-web-5: 302
```

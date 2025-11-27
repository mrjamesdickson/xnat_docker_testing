# Docker Compose: Patroni-based Local PostgreSQL HA for XNAT

This directory contains:

- `docker-compose.patroni-only.yml`  
  Standalone Patroni/HAProxy stack for local HA Postgres.

- `docker-compose.xnat-with-patroni.yml`  
  Example combined stack: Patroni HA + XNAT web + nginx on the same network.

- `patroni-primary.yml`, `patroni-replica1.yml`  
  Patroni configs for primary and replica nodes.

- `haproxy.cfg`  
  HAProxy routing to the current Patroni primary.

## 1. Patroni-only cluster

```bash
docker network create xnat-ha || true
docker compose -f docker-compose.patroni-only.yml up -d
```

Postgres HA endpoint:

- Host (from other containers): `patroni-haproxy`
- Port: `5432`
- DB: `xnat`
- User: `xnat`
- Password: `xnat`

From your host:

- Host: `localhost`
- Port: `15432` (mapped to haproxy:5432)
- Superuser: `postgres / supersecret`

## 2. XNAT + Patroni combined stack

`docker-compose.xnat-with-patroni.yml` shows how to:

- Run Patroni + HAProxy
- Run `xnat-web` (Tomcat) against the HA DB
- Run `nginx` as the HTTP front-end

Bring it up:

```bash
docker compose -f docker-compose.xnat-with-patroni.yml up -d
```

Access XNAT via:

- http://localhost/  (nginx → xnat-web:8080)

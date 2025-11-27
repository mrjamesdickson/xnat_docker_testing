# XNAT HA Bundle (Docker Compose + Kubernetes)

This archive contains:

- **docker-compose/**  
  Local HA PostgreSQL via Patroni + example XNAT + nginx stack.

- **k8s/**  
  Example Kubernetes manifests for XNAT using an HA PostgreSQL cluster
  managed by CloudNativePG (or a similar operator).

Use this as a starting point to integrate a highly-available Postgres backend
into both your local/docker and Kubernetes-based XNAT deployments.

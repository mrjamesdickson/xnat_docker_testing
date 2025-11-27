# Kubernetes XNAT HA Failover Demo Harness

This script helps you *demo* a live XNAT on Kubernetes surviving:

1. **Webapp failover** – one XNAT pod is killed, Service + Deployment recover
2. **DB failover** – HA Postgres primary pod is killed, operator promotes a replica

## Prereqs

- Namespace: `xnat-demo`
- XNAT Deployment: `xnat-web` (label `app=xnat-web`)
- Ingress/Service exposing XNAT externally (e.g., `xnat.local`)
- HA Postgres via CloudNativePG:
  - Cluster: `xnat-db`
  - Read-write Service: `xnat-db-rw`
- Your XNAT deployment is configured to use that RW Service:
  - `XNAT_DB_HOST=xnat-db-rw`
  - `XNAT_DB_PORT=5432`

## Usage

1. Apply the manifests (example from bundle):

   ```bash
   kubectl create namespace xnat-demo
   kubectl apply -n xnat-demo -f xnat-db-credentials-secret.yaml
   kubectl apply -n xnat-demo -f cloudnativepg-cluster.yaml
   kubectl apply -n xnat-demo -f xnat-web-deployment.yaml
   kubectl apply -n xnat-demo -f xnat-ingress.yaml
   ```

2. Ensure Ingress points somewhere you can reach, e.g.:

   - `http://xnat.local/` with `/etc/hosts` entry
   - or NodePort/port-forward URL if you prefer

3. Run the demo:

   ```bash
   chmod +x k8s_demo_failover_xnat.sh
   FRONTEND_URL=http://xnat.local/ ./k8s_demo_failover_xnat.sh
   ```

4. While it runs:

   - Open `FRONTEND_URL` in your browser
   - Watch the terminal print HTTP status codes
   - It will:
     - Scale `xnat-web` to 2 replicas
     - Delete one web pod (webapp failover)
     - Delete the DB primary pod (DB failover)
   - The HTTP loop should mostly keep returning 200/302, showing resilience

You can tweak environment variables:

- `NAMESPACE` – default `xnat-demo`
- `XNAT_DEPLOYMENT` – default `xnat-web`
- `DB_CLUSTER_NAME` – default `xnat-db`
- `OK_CODES_REGEX` – which HTTP codes count as "up" (default `200|302`)

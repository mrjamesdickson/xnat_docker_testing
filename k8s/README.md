# XNAT Kubernetes Deployment

This directory contains Kubernetes manifests for deploying XNAT with horizontal pod autoscaling.

## Prerequisites

- Kubernetes cluster (minikube, Docker Desktop, or cloud provider)
- kubectl configured
- metrics-server installed (required for HPA)
- NFS or cloud storage for shared volumes

## Quick Start

```bash
# Create namespace
kubectl apply -f namespace.yaml

# Deploy secrets and configmap
kubectl apply -f secrets.yaml
kubectl apply -f configmap.yaml

# Deploy persistent volumes (adjust for your storage)
kubectl apply -f pv-archive.yaml
kubectl apply -f pv-plugins.yaml

# Deploy PostgreSQL
kubectl apply -f postgres-statefulset.yaml
kubectl wait --for=condition=ready pod -l app=xnat-db -n xnat --timeout=120s

# Deploy ActiveMQ
kubectl apply -f activemq-statefulset.yaml

# Deploy XNAT
kubectl apply -f xnat-deployment.yaml
kubectl wait --for=condition=ready pod -l app=xnat-web -n xnat --timeout=300s

# Deploy HPA and Ingress
kubectl apply -f hpa.yaml
kubectl apply -f ingress.yaml
```

## Files

| File | Description |
|------|-------------|
| `namespace.yaml` | XNAT namespace |
| `configmap.yaml` | XNAT configuration (xnat-conf.properties) |
| `secrets.yaml` | Database and ActiveMQ credentials |
| `postgres-statefulset.yaml` | PostgreSQL with persistent storage |
| `activemq-statefulset.yaml` | ActiveMQ message broker |
| `xnat-deployment.yaml` | XNAT web application |
| `hpa.yaml` | Horizontal Pod Autoscaler |
| `ingress.yaml` | Ingress with sticky sessions |
| `pv-archive.yaml` | Persistent volume for archive |
| `pv-plugins.yaml` | Persistent volume for plugins |

## Configuration

### Node Identity

Each XNAT pod automatically gets a unique node ID from its pod name via the Kubernetes downward API:

```yaml
env:
- name: POD_NAME
  valueFrom:
    fieldRef:
      fieldPath: metadata.name
- name: CATALINA_OPTS
  value: "-Dsysadmin.node.id=$(POD_NAME)"
```

### Scaling

The HPA scales XNAT pods based on CPU and memory utilization:

- Min replicas: 2
- Max replicas: 10
- Target CPU: 70%
- Target Memory: 80%

### Storage

Shared volumes (archive, plugins) require ReadWriteMany access mode:

- **Cloud providers**: Use managed NFS (AWS EFS, GCP Filestore, Azure Files)
- **On-premise**: Use NFS server or Ceph

Per-pod volumes (logs, cache) use emptyDir for ephemeral storage.

## Monitoring

```bash
# Check pod status
kubectl get pods -n xnat

# Check HPA status
kubectl get hpa -n xnat

# Watch scaling events
kubectl get events -n xnat --field-selector reason=SuccessfulRescale -w

# View logs
kubectl logs -l app=xnat-web -n xnat --tail=100 -f
```

## Troubleshooting

### Pods not starting

```bash
kubectl describe pod -l app=xnat-web -n xnat
kubectl logs -l app=xnat-web -n xnat --previous
```

### Database connection issues

```bash
kubectl exec -it xnat-db-0 -n xnat -- psql -U xnat -c "SELECT 1"
```

### HPA not scaling

```bash
# Check if metrics-server is running
kubectl get deployment metrics-server -n kube-system

# Check resource metrics
kubectl top pods -n xnat
```

## High Availability

For HA PostgreSQL, see `../docs/xnat_ha_bundle/k8s/` for CloudNativePG examples.

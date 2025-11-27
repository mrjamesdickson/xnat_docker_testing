# XNAT Kubernetes Migration Plan with Horizontal Pod Autoscaler

This document outlines the plan to convert the current Docker Compose XNAT cluster to Kubernetes with auto-scaling capabilities.

## Current Architecture (Docker Compose)

```
                    ┌─────────────┐
                    │   nginx     │ :80
                    │ (lb/sticky) │
                    └──────┬──────┘
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
┌───────────────┐  ┌───────────────┐  ┌───────────────┐
│   xnat-web    │  │  xnat-web-2   │  │  xnat-web-3   │  ... (5 nodes)
│  (node-01)    │  │  (node-02)    │  │  (node-03)    │
└───────┬───────┘  └───────┬───────┘  └───────┬───────┘
        │                  │                  │
        └──────────────────┼──────────────────┘
                           │
                    ┌──────┴──────┐
                    │             │
              ┌─────┴─────┐ ┌─────┴─────┐
              │ PostgreSQL│ │ ActiveMQ  │
              │  (shared) │ │  (shared) │
              └───────────┘ └───────────┘
```

**Current Components:**
- 5 XNAT web nodes (manually scaled)
- 1 PostgreSQL database (200 max connections)
- 1 ActiveMQ broker
- 1 nginx load balancer (ip_hash sticky sessions)
- Shared volumes: archive, build, plugins
- Per-node volumes: logs, cache

---

## Target Architecture (Kubernetes)

```
                    ┌─────────────────┐
                    │  Ingress (nginx)│
                    │  + sticky sess  │
                    └────────┬────────┘
                             │
                    ┌────────┴────────┐
                    │    Service      │
                    │  (ClusterIP)    │
                    └────────┬────────┘
                             │
        ┌────────────────────┼────────────────────┐
        │                    │                    │
        ▼                    ▼                    ▼
┌───────────────┐    ┌───────────────┐    ┌───────────────┐
│  XNAT Pod 1   │    │  XNAT Pod 2   │    │  XNAT Pod N   │
│  (Deployment) │    │  (Deployment) │    │   (HPA)       │
└───────┬───────┘    └───────┬───────┘    └───────┬───────┘
        │                    │                    │
        └────────────────────┼────────────────────┘
                             │
        ┌────────────────────┼────────────────────┐
        │                    │                    │
  ┌─────┴─────┐       ┌──────┴──────┐      ┌──────┴──────┐
  │PostgreSQL │       │  ActiveMQ   │      │     NFS     │
  │(StatefulSet)│     │(StatefulSet)│      │ (archive,   │
  │           │       │             │      │  plugins)   │
  └───────────┘       └─────────────┘      └─────────────┘
```

---

## Phase 1: Prerequisites

### 1.1 Kubernetes Cluster Setup

**Local Development (choose one):**
```bash
# Option A: minikube
brew install minikube
minikube start --cpus 4 --memory 16384 --disk-size 50g

# Option B: Docker Desktop Kubernetes
# Enable in Docker Desktop → Settings → Kubernetes → Enable

# Option C: kind (Kubernetes in Docker)
brew install kind
kind create cluster --config kind-config.yaml
```

### 1.2 Required Tools

```bash
# Install kubectl
brew install kubectl

# Install Helm (for charts)
brew install helm

# Install metrics-server (required for HPA)
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

### 1.3 Container Registry

Build and push XNAT image to a registry:
```bash
# Tag and push to Docker Hub or private registry
docker tag xnat_docker_testing-xnat-web:latest your-registry/xnat-web:1.9.2.1
docker push your-registry/xnat-web:1.9.2.1
```

---

## Phase 2: Kubernetes Manifests

### 2.1 Namespace

```yaml
# namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: xnat
```

### 2.2 ConfigMap

```yaml
# configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: xnat-config
  namespace: xnat
data:
  xnat-conf.properties: |
    datasource.driver=org.postgresql.Driver
    datasource.url=jdbc:postgresql://xnat-db-service:5432/xnat
    datasource.username=xnat
    hibernate.dialect=org.hibernate.dialect.PostgreSQL9Dialect
    hibernate.hbm2ddl.auto=update
    hibernate.show_sql=false
    hibernate.cache.use_second_level_cache=true
    hibernate.cache.use_query_cache=true
    spring.http.multipart.max-file-size=1073741824
    spring.http.multipart.max-request-size=1073741824
```

### 2.3 Secrets

```yaml
# secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: xnat-secrets
  namespace: xnat
type: Opaque
stringData:
  datasource-password: "xnat"
  postgres-password: "postgres"
  activemq-password: "admin"
```

### 2.4 Persistent Volumes (NFS or cloud storage)

```yaml
# pv-archive.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: xnat-archive-pv
spec:
  capacity:
    storage: 100Gi
  accessModes:
    - ReadWriteMany  # Required for multi-pod access
  nfs:
    server: nfs-server.local
    path: /exports/xnat/archive
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: xnat-archive-pvc
  namespace: xnat
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 100Gi
```

### 2.5 PostgreSQL StatefulSet

```yaml
# postgres-statefulset.yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: xnat-db
  namespace: xnat
spec:
  serviceName: xnat-db-service
  replicas: 1
  selector:
    matchLabels:
      app: xnat-db
  template:
    metadata:
      labels:
        app: xnat-db
    spec:
      containers:
      - name: postgres
        image: postgres:16.9-alpine
        args:
          - "-c"
          - "shared_preload_libraries=pg_stat_statements"
          - "-c"
          - "pg_stat_statements.track=all"
          - "-c"
          - "max_connections=200"
        env:
        - name: POSTGRES_DB
          value: xnat
        - name: POSTGRES_USER
          value: xnat
        - name: POSTGRES_PASSWORD
          valueFrom:
            secretKeyRef:
              name: xnat-secrets
              key: datasource-password
        ports:
        - containerPort: 5432
        volumeMounts:
        - name: postgres-data
          mountPath: /var/lib/postgresql/data
        resources:
          requests:
            memory: "1Gi"
            cpu: "500m"
          limits:
            memory: "4Gi"
            cpu: "2000m"
  volumeClaimTemplates:
  - metadata:
      name: postgres-data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 20Gi
---
apiVersion: v1
kind: Service
metadata:
  name: xnat-db-service
  namespace: xnat
spec:
  selector:
    app: xnat-db
  ports:
  - port: 5432
    targetPort: 5432
  clusterIP: None  # Headless service for StatefulSet
```

### 2.6 ActiveMQ StatefulSet

```yaml
# activemq-statefulset.yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: xnat-activemq
  namespace: xnat
spec:
  serviceName: xnat-activemq-service
  replicas: 1
  selector:
    matchLabels:
      app: xnat-activemq
  template:
    metadata:
      labels:
        app: xnat-activemq
    spec:
      containers:
      - name: activemq
        image: apache/activemq-classic:5.18.6
        env:
        - name: ACTIVEMQ_OPTS
          value: "-Xms256m -Xmx512m"
        ports:
        - containerPort: 61616
          name: openwire
        - containerPort: 8161
          name: web
        volumeMounts:
        - name: activemq-data
          mountPath: /var/activemq/data
        resources:
          requests:
            memory: "512Mi"
            cpu: "250m"
          limits:
            memory: "1Gi"
            cpu: "1000m"
  volumeClaimTemplates:
  - metadata:
      name: activemq-data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 5Gi
---
apiVersion: v1
kind: Service
metadata:
  name: xnat-activemq-service
  namespace: xnat
spec:
  selector:
    app: xnat-activemq
  ports:
  - port: 61616
    targetPort: 61616
    name: openwire
  - port: 8161
    targetPort: 8161
    name: web
```

### 2.7 XNAT Deployment

```yaml
# xnat-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: xnat-web
  namespace: xnat
spec:
  replicas: 2  # Initial replicas, HPA will manage this
  selector:
    matchLabels:
      app: xnat-web
  template:
    metadata:
      labels:
        app: xnat-web
    spec:
      initContainers:
      - name: wait-for-db
        image: postgres:16.9-alpine
        command: ['sh', '-c', 'until pg_isready -h xnat-db-service -p 5432; do echo waiting for database; sleep 2; done;']
      containers:
      - name: xnat
        image: your-registry/xnat-web:1.9.2.1
        env:
        - name: CATALINA_OPTS
          value: "-Xms2g -Xmx4g -Dxnat.home=/data/xnat/home -Dsysadmin.node.id=$(POD_NAME)"
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: XNAT_HOME
          value: "/data/xnat/home"
        - name: XNAT_JMS_ENABLED
          value: "true"
        - name: XNAT_JMS_BROKER_URL
          value: "tcp://xnat-activemq-service:61616"
        - name: XNAT_JMS_USERNAME
          value: "admin"
        - name: XNAT_JMS_PASSWORD
          valueFrom:
            secretKeyRef:
              name: xnat-secrets
              key: activemq-password
        ports:
        - containerPort: 8080
        volumeMounts:
        - name: xnat-config
          mountPath: /data/xnat/home/config/xnat-conf.properties
          subPath: xnat-conf.properties
        - name: xnat-archive
          mountPath: /data/xnat/archive
        - name: xnat-build
          mountPath: /data/xnat/build
        - name: xnat-plugins
          mountPath: /data/xnat/home/plugins
        - name: xnat-logs
          mountPath: /data/xnat/home/logs
        - name: xnat-cache
          mountPath: /data/xnat/cache
        resources:
          requests:
            memory: "2Gi"
            cpu: "500m"
          limits:
            memory: "6Gi"
            cpu: "2000m"
        readinessProbe:
          httpGet:
            path: /
            port: 8080
          initialDelaySeconds: 120
          periodSeconds: 10
          timeoutSeconds: 5
        livenessProbe:
          httpGet:
            path: /
            port: 8080
          initialDelaySeconds: 180
          periodSeconds: 30
          timeoutSeconds: 10
      volumes:
      - name: xnat-config
        configMap:
          name: xnat-config
      - name: xnat-archive
        persistentVolumeClaim:
          claimName: xnat-archive-pvc
      - name: xnat-build
        persistentVolumeClaim:
          claimName: xnat-build-pvc
      - name: xnat-plugins
        persistentVolumeClaim:
          claimName: xnat-plugins-pvc
      - name: xnat-logs
        emptyDir: {}  # Per-pod ephemeral storage
      - name: xnat-cache
        emptyDir: {}  # Per-pod ephemeral storage
---
apiVersion: v1
kind: Service
metadata:
  name: xnat-web-service
  namespace: xnat
spec:
  selector:
    app: xnat-web
  ports:
  - port: 80
    targetPort: 8080
  type: ClusterIP
```

### 2.8 Horizontal Pod Autoscaler (HPA)

```yaml
# hpa.yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: xnat-web-hpa
  namespace: xnat
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: xnat-web
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 300  # Wait 5 min before scaling down
      policies:
      - type: Pods
        value: 1
        periodSeconds: 60  # Remove max 1 pod per minute
    scaleUp:
      stabilizationWindowSeconds: 0  # Scale up immediately
      policies:
      - type: Pods
        value: 2
        periodSeconds: 60  # Add max 2 pods per minute
      - type: Percent
        value: 100
        periodSeconds: 60
```

### 2.9 Ingress with Sticky Sessions

```yaml
# ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: xnat-ingress
  namespace: xnat
  annotations:
    nginx.ingress.kubernetes.io/affinity: "cookie"
    nginx.ingress.kubernetes.io/affinity-mode: "persistent"
    nginx.ingress.kubernetes.io/session-cookie-name: "XNAT_STICKY"
    nginx.ingress.kubernetes.io/session-cookie-expires: "172800"
    nginx.ingress.kubernetes.io/session-cookie-max-age: "172800"
    nginx.ingress.kubernetes.io/proxy-body-size: "0"  # Unlimited upload size
    nginx.ingress.kubernetes.io/proxy-read-timeout: "300"
    nginx.ingress.kubernetes.io/proxy-send-timeout: "300"
spec:
  ingressClassName: nginx
  rules:
  - host: xnat.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: xnat-web-service
            port:
              number: 80
```

---

## Phase 3: Deployment Steps

### 3.1 Deploy Infrastructure

```bash
# Create namespace
kubectl apply -f namespace.yaml

# Deploy secrets and configmap
kubectl apply -f secrets.yaml
kubectl apply -f configmap.yaml

# Deploy persistent volumes
kubectl apply -f pv-archive.yaml
kubectl apply -f pv-build.yaml
kubectl apply -f pv-plugins.yaml

# Deploy PostgreSQL
kubectl apply -f postgres-statefulset.yaml

# Wait for PostgreSQL to be ready
kubectl wait --for=condition=ready pod -l app=xnat-db -n xnat --timeout=120s

# Deploy ActiveMQ
kubectl apply -f activemq-statefulset.yaml
```

### 3.2 Deploy XNAT

```bash
# Deploy XNAT
kubectl apply -f xnat-deployment.yaml

# Wait for at least one pod to be ready
kubectl wait --for=condition=ready pod -l app=xnat-web -n xnat --timeout=300s

# Deploy HPA
kubectl apply -f hpa.yaml

# Deploy Ingress
kubectl apply -f ingress.yaml
```

### 3.3 Verify Deployment

```bash
# Check all pods
kubectl get pods -n xnat

# Check HPA status
kubectl get hpa -n xnat

# Watch HPA scaling
kubectl get hpa xnat-web-hpa -n xnat -w

# Check ingress
kubectl get ingress -n xnat

# View logs
kubectl logs -l app=xnat-web -n xnat --tail=100 -f
```

---

## Phase 4: Monitoring & Operations

### 4.1 View HPA Status

```bash
# Current HPA status
kubectl describe hpa xnat-web-hpa -n xnat

# Watch scaling events
kubectl get events -n xnat --field-selector reason=SuccessfulRescale -w
```

### 4.2 Manual Scaling (if needed)

```bash
# Temporarily disable HPA and scale manually
kubectl scale deployment xnat-web -n xnat --replicas=5

# Re-enable HPA
kubectl apply -f hpa.yaml
```

### 4.3 Resource Monitoring

```bash
# Install Prometheus + Grafana (optional)
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring --create-namespace
```

---

## Key Differences from Docker Compose

| Aspect | Docker Compose | Kubernetes |
|--------|---------------|------------|
| Scaling | Manual (edit YAML, restart) | Automatic (HPA based on CPU/memory) |
| Load Balancing | nginx with ip_hash | Ingress with cookie affinity |
| Service Discovery | Docker DNS | Kubernetes Services |
| Storage | Local volumes | PersistentVolumes (NFS, cloud) |
| Health Checks | None | Readiness/Liveness probes |
| Rolling Updates | Manual | Automatic with zero downtime |
| Resource Limits | None enforced | Enforced by kubelet |
| Node Identity | System property | Pod name (auto-assigned) |

---

## Cost & Resource Considerations

### Minimum Resources for 5-node cluster:
- **XNAT pods**: 5 × (2GB RAM, 0.5 CPU) = 10GB RAM, 2.5 CPU
- **PostgreSQL**: 4GB RAM, 2 CPU
- **ActiveMQ**: 1GB RAM, 1 CPU
- **Total**: ~16GB RAM, 6 CPU

### Cloud Provider Estimates (monthly):
- **AWS EKS**: ~$150-300 (t3.large nodes)
- **GKE**: ~$120-250 (e2-standard-4 nodes)
- **Azure AKS**: ~$140-280 (Standard_D4s_v3 nodes)

### Storage:
- Archive PV: 100GB+ (depends on data)
- PostgreSQL PV: 20GB
- ActiveMQ PV: 5GB

---

## Migration Checklist

- [ ] Set up Kubernetes cluster (local or cloud)
- [ ] Install metrics-server for HPA
- [ ] Build and push XNAT Docker image to registry
- [ ] Set up NFS or cloud storage for shared volumes
- [ ] Create Kubernetes manifests
- [ ] Migrate PostgreSQL data
- [ ] Deploy and test with 2 replicas
- [ ] Enable HPA
- [ ] Configure Ingress with sticky sessions
- [ ] Test auto-scaling under load
- [ ] Set up monitoring (Prometheus/Grafana)
- [ ] Document runbooks for operations

---

## References

- [Kubernetes HPA Documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
- [NGINX Ingress Sticky Sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/)
- [XNAT Documentation](https://wiki.xnat.org/)
- [Distributed Events Plugin](https://wiki.xnat.org/xnat-tools/distributed-events-plugin)

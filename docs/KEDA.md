## KEDA

KEDA is a Kubernetes-based Event Driven Autoscaler.  
With KEDA, you can drive the scaling of any container in  
Kubernetes based on the number of events needing to be processed.  

KEDA is a single-purpose and lightweight component that can be added into any Kubernetes cluster.  KEDA works alongside standard Kubernetes components like the Horizontal Pod Autoscaler and can   extend functionality without overwriting or duplication. With KEDA, you can explicitly map the apps
you want to use event-driven scale, with other apps continuing to function. This makes KEDA a   flexible and safe option to run alongside any number of any other Kubernetes applications or frameworks.  


## Install prometheus using helm

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

## Prometheus with disable extras

```bash
helm install prometheus-server prometheus-community/prometheus \
  --set alertmanager.enabled=false \
  --set prometheus-pushgateway.enabled=false \
  --set prometheus-node-exporter.enabled=false \
  --set kube-state-metrics.enabled=false \
  --set server.persistentVolume.enabled=false  # Optional: Set true if you want data persistence
```

__server-only.yaml__
```yaml
alertmanager:
  enabled: false
prometheus-pushgateway:
  enabled: false
prometheus-node-exporter:
  enabled: false
kube-state-metrics:
  enabled: false

server:
  enabled: true
  persistentVolume:
    enabled: false # Change to true for production
```

```bash
helm install prometheus-server prometheus-community/prometheus -f server-only.yaml
```


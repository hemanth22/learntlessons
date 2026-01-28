## What is Cilium ?

Cilium is an open source project to provide networking, security, and observability for   
cloud native environments such as Kubernetes clusters and other container orchestration platforms.  


## Documentation for Cilium Installation

[install-the-cilium-cli](https://docs.cilium.io/en/stable/gettingstarted/k8s-install-default/#install-the-cilium-cli )


```bash
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
CLI_ARCH=amd64
if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
rm -v cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
```

## Cilium command to install to kubernetes cluster

```bash
cilium install --version 1.18.6
```


## Cilium command to check status in the kubernetes cluster

```bash
cilium status --wait
```

## Documentation of Cilium command demo

[Cilium DEMO](https://docs.cilium.io/en/stable/gettingstarted/demo/)

```bash
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/1.18.6/examples/minikube/http-sw-app.yaml
```

## Cilium command to send traffice

```bash
kubectl exec xwing -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
kubectl exec tiefighter -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
```


## Command to create L3 L4 network policy

```bash
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/1.18.6/examples/minikube/sw_l3_l4_policy.yaml
```

## Command to verify after apply network policy

```bash
kubectl exec tiefighter -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
kubectl exec xwing -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
```

## Command to verify and debug cilium network policy

```bash
kubectl get cnp
kubectl describe cnp rule1
```

## Command to create L3, L4, L7 network Policy

```bash
kubectl apply -f https://raw.githubusercontent.com/cilium/cilium/1.18.6/examples/minikube/sw_l3_l4_l7_policy.yaml
```

## Command to verify after apply L3, L4, L7 network policy


```bash
kubectl exec tiefighter -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
kubectl exec tiefighter -- curl -s -XPUT deathstar.default.svc.cluster.local/v1/exhaust-port
kubectl exec xwing -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
```

## Documentation for Hubble Step

[Hubble Setup](https://docs.cilium.io/en/stable/observability/hubble/setup/)  
[Hubble Setup 1](https://docs.cilium.io/en/stable/observability/hubble/setup/#hubble-setup)  

## Command to enable hubble

```bash
cilium hubble enable
```

## Command to verify hubble status with cilium command

```bash
cilium status
```

## Command to install hubble client

```bash
HUBBLE_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/hubble/master/stable.txt)
HUBBLE_ARCH=amd64
if [ "$(uname -m)" = "aarch64" ]; then HUBBLE_ARCH=arm64; fi
curl -L --fail --remote-name-all https://github.com/cilium/hubble/releases/download/$HUBBLE_VERSION/hubble-linux-${HUBBLE_ARCH}.tar.gz{,.sha256sum}
sha256sum --check hubble-linux-${HUBBLE_ARCH}.tar.gz.sha256sum
sudo tar xzvfC hubble-linux-${HUBBLE_ARCH}.tar.gz /usr/local/bin
rm -v hubble-linux-${HUBBLE_ARCH}.tar.gz{,.sha256sum}
```

## Command to network port forward using hubble API command

```bash
cilium hubble port-forward&
```

## Command to verify status using hubbe command

```bash
hubble status
```

## Command to check network using hubble command

```bash
hubble observe
```

## Command to generate traffic

```bash
kubectl exec tiefighter -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
kubectl exec tiefighter -- curl -s -XPUT deathstar.default.svc.cluster.local/v1/exhaust-port
kubectl exec xwing -- curl -s -XPOST deathstar.default.svc.cluster.local/v1/request-landing
```

## Command to verify the network traffice

```bash
hubble observe --pod deathstar --protocol http
hubble observe --pod deathstar --verdict DROPPED
```

## Document for cilium hubble ui

[hubble ui](https://docs.cilium.io/en/stable/observability/hubble/hubble-ui/#hubble-ui)  

## Command to enable hubble

```bash
cilium hubble enable --ui
```

## Command to expose hubble ui port

```bash
cilium hubble ui --open-browser=false
```

## Command to delete demo test and cilium network policy

```bash
kubectl delete -f https://raw.githubusercontent.com/cilium/cilium/1.18.6/examples/minikube/http-sw-app.yaml
kubectl delete cnp rule1
```
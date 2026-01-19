## ArgoCD link

https://argoproj.github.io/cd/

## ArgoCD Installtion 

https://argo-cd.readthedocs.io/en/stable/

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
__Output__
```
namespace/argocd created
customresourcedefinition.apiextensions.k8s.io/applications.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/applicationsets.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/appprojects.argoproj.io created
serviceaccount/argocd-application-controller created
serviceaccount/argocd-applicationset-controller created
serviceaccount/argocd-dex-server created
serviceaccount/argocd-notifications-controller created
serviceaccount/argocd-redis created
serviceaccount/argocd-repo-server created
serviceaccount/argocd-server created
role.rbac.authorization.k8s.io/argocd-application-controller created
role.rbac.authorization.k8s.io/argocd-applicationset-controller created
role.rbac.authorization.k8s.io/argocd-dex-server created
role.rbac.authorization.k8s.io/argocd-notifications-controller created
role.rbac.authorization.k8s.io/argocd-redis created
role.rbac.authorization.k8s.io/argocd-server created
clusterrole.rbac.authorization.k8s.io/argocd-application-controller created
clusterrole.rbac.authorization.k8s.io/argocd-applicationset-controller created
clusterrole.rbac.authorization.k8s.io/argocd-server created
rolebinding.rbac.authorization.k8s.io/argocd-application-controller created
rolebinding.rbac.authorization.k8s.io/argocd-applicationset-controller created
rolebinding.rbac.authorization.k8s.io/argocd-dex-server created
rolebinding.rbac.authorization.k8s.io/argocd-notifications-controller created
rolebinding.rbac.authorization.k8s.io/argocd-redis created
rolebinding.rbac.authorization.k8s.io/argocd-server created
clusterrolebinding.rbac.authorization.k8s.io/argocd-application-controller created
clusterrolebinding.rbac.authorization.k8s.io/argocd-applicationset-controller created
clusterrolebinding.rbac.authorization.k8s.io/argocd-server created
configmap/argocd-cm created
configmap/argocd-cmd-params-cm created
configmap/argocd-gpg-keys-cm created
configmap/argocd-notifications-cm created
configmap/argocd-rbac-cm created
configmap/argocd-ssh-known-hosts-cm created
configmap/argocd-tls-certs-cm created
secret/argocd-notifications-secret created
secret/argocd-secret created
service/argocd-applicationset-controller created
service/argocd-dex-server created
service/argocd-metrics created
service/argocd-notifications-controller-metrics created
service/argocd-redis created
service/argocd-repo-server created
service/argocd-server created
service/argocd-server-metrics created
deployment.apps/argocd-applicationset-controller created
deployment.apps/argocd-dex-server created
deployment.apps/argocd-notifications-controller created
deployment.apps/argocd-redis created
deployment.apps/argocd-repo-server created
deployment.apps/argocd-server created
statefulset.apps/argocd-application-controller created
networkpolicy.networking.k8s.io/argocd-application-controller-network-policy created
networkpolicy.networking.k8s.io/argocd-applicationset-controller-network-policy created
networkpolicy.networking.k8s.io/argocd-dex-server-network-policy created
networkpolicy.networking.k8s.io/argocd-notifications-controller-network-policy created
networkpolicy.networking.k8s.io/argocd-redis-network-policy created
networkpolicy.networking.k8s.io/argocd-repo-server-network-policy created
networkpolicy.networking.k8s.io/argocd-server-network-policy created
```

## Verify installation 

```bash
[root@kubecentos ~]# kubectl get all -n argocd
NAME                                                   READY   STATUS    RESTARTS   AGE
pod/argocd-application-controller-0                    1/1     Running   0          2m15s
pod/argocd-applicationset-controller-944684d77-2stct   1/1     Running   0          2m16s
pod/argocd-dex-server-6944b95798-slh8n                 1/1     Running   0          2m16s
pod/argocd-notifications-controller-7f5b87f55b-j2hs7   1/1     Running   0          2m16s
pod/argocd-redis-c98d5794d-997ct                       1/1     Running   0          2m16s
pod/argocd-repo-server-7f86545bc4-dfwjx                1/1     Running   0          2m16s
pod/argocd-server-685f5fb66f-5hkgb                     1/1     Running   0          2m16s

NAME                                              TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
service/argocd-applicationset-controller          ClusterIP   10.103.118.223   <none>        7000/TCP,8080/TCP            2m16s
service/argocd-dex-server                         ClusterIP   10.98.164.25     <none>        5556/TCP,5557/TCP,5558/TCP   2m16s
service/argocd-metrics                            ClusterIP   10.109.133.191   <none>        8082/TCP                     2m16s
service/argocd-notifications-controller-metrics   ClusterIP   10.103.154.101   <none>        9001/TCP                     2m16s
service/argocd-redis                              ClusterIP   10.110.62.86     <none>        6379/TCP                     2m16s
service/argocd-repo-server                        ClusterIP   10.100.201.202   <none>        8081/TCP,8084/TCP            2m16s
service/argocd-server                             ClusterIP   10.109.156.6     <none>        80/TCP,443/TCP               2m16s
service/argocd-server-metrics                     ClusterIP   10.99.146.106    <none>        8083/TCP                     2m16s

NAME                                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/argocd-applicationset-controller   1/1     1            1           2m16s
deployment.apps/argocd-dex-server                  1/1     1            1           2m16s
deployment.apps/argocd-notifications-controller    1/1     1            1           2m16s
deployment.apps/argocd-redis                       1/1     1            1           2m16s
deployment.apps/argocd-repo-server                 1/1     1            1           2m16s
deployment.apps/argocd-server                      1/1     1            1           2m16s

NAME                                                         DESIRED   CURRENT   READY   AGE
replicaset.apps/argocd-applicationset-controller-944684d77   1         1         1       2m16s
replicaset.apps/argocd-dex-server-6944b95798                 1         1         1       2m16s
replicaset.apps/argocd-notifications-controller-7f5b87f55b   1         1         1       2m16s
replicaset.apps/argocd-redis-c98d5794d                       1         1         1       2m16s
replicaset.apps/argocd-repo-server-7f86545bc4                1         1         1       2m16s
replicaset.apps/argocd-server-685f5fb66f                     1         1         1       2m16s

NAME                                             READY   AGE
statefulset.apps/argocd-application-controller   1/1     2m16s
```

## Metallb Installation

https://metallb.io/installation/


```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.3/config/manifests/metallb-native.yaml
```
__Output__
```
[root@kubecentos ~]# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.3/config/manifests/metallb-native.yaml
namespace/metallb-system created
customresourcedefinition.apiextensions.k8s.io/bfdprofiles.metallb.io created
customresourcedefinition.apiextensions.k8s.io/bgpadvertisements.metallb.io created
customresourcedefinition.apiextensions.k8s.io/bgppeers.metallb.io created
customresourcedefinition.apiextensions.k8s.io/communities.metallb.io created
customresourcedefinition.apiextensions.k8s.io/configurationstates.metallb.io created
customresourcedefinition.apiextensions.k8s.io/ipaddresspools.metallb.io created
customresourcedefinition.apiextensions.k8s.io/l2advertisements.metallb.io created
customresourcedefinition.apiextensions.k8s.io/servicebgpstatuses.metallb.io created
customresourcedefinition.apiextensions.k8s.io/servicel2statuses.metallb.io created
serviceaccount/controller created
serviceaccount/speaker created
role.rbac.authorization.k8s.io/controller created
role.rbac.authorization.k8s.io/pod-lister created
clusterrole.rbac.authorization.k8s.io/metallb-system:controller created
clusterrole.rbac.authorization.k8s.io/metallb-system:speaker created
rolebinding.rbac.authorization.k8s.io/controller created
rolebinding.rbac.authorization.k8s.io/pod-lister created
clusterrolebinding.rbac.authorization.k8s.io/metallb-system:controller created
clusterrolebinding.rbac.authorization.k8s.io/metallb-system:speaker created
configmap/metallb-excludel2 created
secret/metallb-webhook-cert created
service/metallb-webhook-service created
deployment.apps/controller created
daemonset.apps/speaker created
validatingwebhookconfiguration.admissionregistration.k8s.io/metallb-webhook-configuration created
```

## MetalLB Configuraiton

https://metallb.io/configuration/_advanced_ipaddresspool_configuration/
https://metallb.io/configuration/_advanced_l2_configuration/

```yaml
[root@kubecentos ~]# cat 02_metallb-config.yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: first-pool
  namespace: metallb-system
spec:
  addresses:
  - 193.16.16.100-193.16.16.120
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: metallb-l2adv
  namespace: metallb-system
```

```bash
[root@kubecentos ~]# kubectl create -f 02_metallb-config.yaml
ipaddresspool.metallb.io/first-pool created
l2advertisement.metallb.io/metallb-l2adv created
```

## By default, the Argo CD API server is not exposed with an external IP. To access the API server, choose one of the following techniques to expose the Argo CD API server

### Change the argocd-server service type to LoadBalancer

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

### After a short wait, your cloud provider will assign an external IP address to the service. You can retrieve this IP with

```bash
kubectl get svc argocd-server -n argocd -o=jsonpath='{.status.loadBalancer.ingress[0].ip}'
```


## Getting admin password

```bash
kubectl get secret -n argocd
kubectl get secret/argocd-initial-admin-secret -n argocd -o yaml
```

## Decode base64 encryption password

```powershell
[Text.Encoding]::Utf8.GetString([Convert]::FromBase64String('encryptedbase64'))
```

```bash
kubectl get secret/argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d
```

```bash
echo "SGVsbG8gV29ybGQ=" | base64 --decode

or

echo "SGVsbG8gV29ybGQ=" | base64 -d

or

base64 --decode encoded.txt

or

echo "SGVsbG8gV29ybGQ=" | openssl base64 -d
```

## Example argocd project

https://github.com/hemanth22/argocd-demo

## Example helm repo

https://charts.helm.sh/stable

## Example Kustomization

https://github.com/hemanth22/argocd-demo


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

## helm installation document

https://helm.sh/docs/intro/install

## helm installation in rockylinux

```bash
dnf install helm
```

## Example helm repo

https://charts.helm.sh/stable

## Helm commands usage

```bash
helm search hub wordpress
```

## Helm command to add charts

```bash
[root@kubecentos ~]# helm repo add brigade https://brigadecore.github.io/charts
"brigade" has been added to your repositories
```

## Helm command to search in repo

```bash
[root@kubecentos ~]# helm search repo kash
NAME            CHART VERSION   APP VERSION     DESCRIPTION
brigade/kashti  0.7.0           v0.4.0          A Helm chart for Kubernetes

[root@kubecentos ~]# helm repo list
NAME    URL
brigade https://brigadecore.github.io/charts
```

## Helm chart installation flow

```bash
Helm installs resources in the following order:

Namespace
NetworkPolicy
ResourceQuota
LimitRange
PodSecurityPolicy
PodDisruptionBudget
ServiceAccount
Secret
SecretList
ConfigMap
StorageClass
PersistentVolume
PersistentVolumeClaim
CustomResourceDefinition
ClusterRole
ClusterRoleList
ClusterRoleBinding
ClusterRoleBindingList
Role
RoleList
RoleBinding
RoleBindingList
Service
DaemonSet
Pod
ReplicationController
ReplicaSet
Deployment
HorizontalPodAutoscaler
StatefulSet
Job
CronJob
Ingress
APIService
MutatingWebhookConfiguration
ValidatingWebhookConfiguration
```
## Installing helm chart stable repository this is not required for argocd
```bash
[root@kubecentos ~]# helm repo add stable https://charts.helm.sh/stable
"stable" has been added to your repositories
[root@kubecentos ~]# helm repo list
NAME    URL
brigade https://brigadecore.github.io/charts
stable  https://charts.helm.sh/stable
```

## Repo url

https://artifacthub.io/
https://artifacthub.io/packages/helm/bitnami/nginx?modal=install


## Command to see custom resource definition installed in kubernetes

```bash
[root@kubecentos ~]# kubectl get crds
NAME                                         CREATED AT
applications.argoproj.io                     2026-01-19T02:44:21Z
applicationsets.argoproj.io                  2026-01-19T02:44:21Z
appprojects.argoproj.io                      2026-01-19T02:44:21Z
bfdprofiles.metallb.io                       2026-01-19T03:01:48Z
bgpadvertisements.metallb.io                 2026-01-19T03:01:48Z
bgppeers.metallb.io                          2026-01-19T03:01:48Z
ciliumcidrgroups.cilium.io                   2026-01-18T09:45:39Z
ciliumclusterwidenetworkpolicies.cilium.io   2026-01-18T09:45:38Z
ciliumendpoints.cilium.io                    2026-01-18T09:45:36Z
ciliumidentities.cilium.io                   2026-01-18T09:45:34Z
ciliuml2announcementpolicies.cilium.io       2026-01-18T09:45:41Z
ciliumloadbalancerippools.cilium.io          2026-01-18T09:45:40Z
ciliumnetworkpolicies.cilium.io              2026-01-18T09:45:37Z
ciliumnodeconfigs.cilium.io                  2026-01-18T09:45:42Z
ciliumnodes.cilium.io                        2026-01-18T09:45:33Z
ciliumpodippools.cilium.io                   2026-01-18T09:45:35Z
communities.metallb.io                       2026-01-19T03:01:48Z
configurationstates.metallb.io               2026-01-19T03:01:48Z
ipaddresspools.metallb.io                    2026-01-19T03:01:48Z
l2advertisements.metallb.io                  2026-01-19T03:01:48Z
servicebgpstatuses.metallb.io                2026-01-19T03:01:48Z
servicel2statuses.metallb.io                 2026-01-19T03:01:48Z
[root@kubecentos ~]#
```

## Comand to app repo for argocd

```bash
[root@kubecentos ~]# kubectl get crds | grep argo
applications.argoproj.io                     2026-01-19T02:44:21Z
applicationsets.argoproj.io                  2026-01-19T02:44:21Z
appprojects.argoproj.io                      2026-01-19T02:44:21Z
[root@kubecentos ~]# kubectl get appprojects
No resources found in default namespace.
[root@kubecentos ~]# kubectl get appprojects -n argocd
NAME      AGE
default   25h
```

## Command to get application list in argocd namespace

```bash
[root@kubecentos ~]# kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-5869d7778c-qwj92   1/1     Running   0          40s

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP        42h
service/nginx        NodePort    10.108.251.124   <none>        80:30080/TCP   40s

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   1/1     1            1           40s

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-5869d7778c   1         1         1       40s
[root@kubecentos ~]# kubectl get applications -n argocd
NAME         SYNC STATUS   HEALTH STATUS
argocddemo   Synced        Healthy
[root@kubecentos ~]#
```

## Command to get argocd application description

```bash
[root@kubecentos ~]# kubectl describe applications/argocddemo -n argocd
Name:         argocddemo
Namespace:    argocd
Labels:       <none>
Annotations:  <none>
API Version:  argoproj.io/v1alpha1
Kind:         Application
Metadata:
  Creation Timestamp:  2026-01-20T04:08:36Z
  Generation:          10
  Resource Version:    35022
  UID:                 7d740d4c-8acb-4429-989d-a1945663c841
Spec:
  Destination:
    Namespace:  default
    Server:     https://kubernetes.default.svc
  Project:      default
  Source:
    Path:             yamls
    Repo URL:         https://github.com/hemanth22/argocd-demo.git
    Target Revision:  HEAD
Status:
  Controller Namespace:  argocd
  Health:
    Last Transition Time:  2026-01-20T04:08:49Z
    Status:                Healthy
  History:
    Deploy Started At:  2026-01-20T04:08:45Z
    Deployed At:        2026-01-20T04:08:46Z
    Id:                 0
    Initiated By:
      Username:  admin
    Revision:    2eec1b70dbb086567d3c90a6c027a225fd37a3d9
    Source:
      Path:             yamls
      Repo URL:         https://github.com/hemanth22/argocd-demo.git
      Target Revision:  HEAD
  Operation State:
    Finished At:  2026-01-20T04:08:46Z
    Message:      successfully synced (all tasks run)
    Operation:
      Initiated By:
        Username:  admin
      Retry:
      Sync:
        Revision:  2eec1b70dbb086567d3c90a6c027a225fd37a3d9
        Source:
          Path:             yamls
          Repo URL:         https://github.com/hemanth22/argocd-demo.git
          Target Revision:  HEAD
        Sync Strategy:
          Hook:
    Phase:       Succeeded
    Started At:  2026-01-20T04:08:45Z
    Sync Result:
      Resources:
        Group:
        Hook Phase:  Running
        Kind:        Service
        Message:     service/nginx created
        Name:        nginx
        Namespace:   default
        Status:      Synced
        Sync Phase:  Sync
        Version:     v1
        Group:       apps
        Hook Phase:  Running
        Images:
          nginx
        Kind:        Deployment
        Message:     deployment.apps/nginx created
        Name:        nginx
        Namespace:   default
        Status:      Synced
        Sync Phase:  Sync
        Version:     v1
      Revision:      2eec1b70dbb086567d3c90a6c027a225fd37a3d9
      Source:
        Path:              yamls
        Repo URL:          https://github.com/hemanth22/argocd-demo.git
        Target Revision:   HEAD
  Reconciled At:           2026-01-20T04:08:46Z
  Resource Health Source:  appTree
  Resources:
    Kind:       Service
    Name:       nginx
    Namespace:  default
    Status:     Synced
    Version:    v1
    Group:      apps
    Kind:       Deployment
    Name:       nginx
    Namespace:  default
    Status:     Synced
    Version:    v1
  Source Hydrator:
  Source Type:  Directory
  Summary:
    Images:
      nginx
  Sync:
    Compared To:
      Destination:
        Namespace:  default
        Server:     https://kubernetes.default.svc
      Source:
        Path:             yamls
        Repo URL:         https://github.com/hemanth22/argocd-demo.git
        Target Revision:  HEAD
    Revision:             2eec1b70dbb086567d3c90a6c027a225fd37a3d9
    Status:               Synced
Events:
  Type    Reason              Age    From                           Message
  ----    ------              ----   ----                           -------
  Normal  ResourceCreated     2m14s  argocd-server                  admin created application
  Normal  ResourceUpdated     2m14s  argocd-application-controller  Updated sync status:  -> OutOfSync
  Normal  ResourceUpdated     2m14s  argocd-application-controller  Updated health status:  -> Missing
  Normal  OperationStarted    2m5s   argocd-server                  admin initiated sync to HEAD (2eec1b70dbb086567d3c90a6c027a225fd37a3d9)
  Normal  OperationCompleted  2m4s   argocd-application-controller  Sync operation to 2eec1b70dbb086567d3c90a6c027a225fd37a3d9 succeeded
  Normal  ResourceUpdated     2m4s   argocd-application-controller  Updated sync status: OutOfSync -> Synced
  Normal  ResourceUpdated     2m4s   argocd-application-controller  Updated health status: Missing -> Progressing
  Normal  ResourceUpdated     2m1s   argocd-application-controller  Updated health status: Progressing -> Healthy
```

## Creating CRD follow argocd declarative setup document

https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/


## Following application CRD deployment document

https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#applications

## Example syntax for application CRD for argocd

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: guestbook
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/argoproj/argocd-example-apps.git
    targetRevision: HEAD
    path: guestbook
  destination:
    server: https://kubernetes.default.svc
    namespace: guestbook
```

## Here is sample template created for argocd

```bash
[root@kubecentos ~]# cat /tmp/argocd-template.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: argocd-demo
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/hemanth22/argocd-demo.git
    targetRevision: HEAD
    path: yamls
  destination:
    server: https://kubernetes.default.svc
```


## Command to apply CRD argocd

```bash
[root@kubecentos ~]# kubectl create -f /tmp/argocd-template.yaml
application.argoproj.io/argocd-demo created


[root@kubecentos ~]# kubectl get applications -n argocd
NAME          SYNC STATUS   HEALTH STATUS
argocd-demo   OutOfSync     Missing
```

## Manually sync for argocd from ui and get status 

```bash
[root@kubecentos ~]# kubectl get deploy,svc
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   42h

[root@kubecentos ~]# kubectl get applications -n argocd
NAME          SYNC STATUS   HEALTH STATUS
argocd-demo   Synced        Healthy
[root@kubecentos ~]# kubectl get deploy,svc
NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   1/1     1            1           8s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP        42h
service/nginx        NodePort    10.99.32.213   <none>        80:30080/TCP   8s
```

## Command delete argo crd based deployment

```bash
[root@kubecentos ~]# kubectl delete -f /tmp/argocd-template.yaml
application.argoproj.io "argocd-demo" deleted
```


## Example Kustomization

https://github.com/hemanth22/argocd-demo


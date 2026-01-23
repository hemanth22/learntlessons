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

### Alternative to expose through nodeport command (Not Recommend for prod)

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
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
kubectl get secret/argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d; echo
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

## ArgoCD CLI installation 

https://argo-cd.readthedocs.io/en/stable/cli_installation/
https://github.com/argoproj/argo-cd/releases

## ArgoCD CLI Installation

```bash
echo "[TASK 1] Installing Argo CD CLI..."
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
echo "[TASK 2] Making Argo CD CLI executable and moving to /usr/local/bin..."
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
echo "[TASK 3] Post Argo CD CLI installation Cleaning up..."
rm -v argocd-linux-amd64
```

## Argo CD CLI Help command

```bash
[root@kubecentos ~]# argocd help
argocd controls a Argo CD server

Usage:
  argocd [flags]
  argocd [command]

Available Commands:
  account     Manage account settings
  admin       Contains a set of commands useful for Argo CD administrators and requires direct Kubernetes access
  app         Manage applications
  appset      Manage ApplicationSets
  cert        Manage repository certificates and SSH known hosts entries
  cluster     Manage cluster credentials
  completion  output shell completion code for the specified shell (bash, zsh or fish)
  configure   Manage local configuration
  context     Switch between contexts
  gpg         Manage GPG keys used for signature verification
  help        Help about any command
  login       Log in to Argo CD
  logout      Log out from Argo CD
  proj        Manage projects
  relogin     Refresh an expired authenticate token
  repo        Manage repository connection parameters
  repocreds   Manage credential templates for repositories
  version     Print version information

Flags:
      --argocd-context string           The name of the Argo-CD server context to use
      --auth-token string               Authentication token; set this or the ARGOCD_AUTH_TOKEN environment variable
      --client-crt string               Client certificate file
      --client-crt-key string           Client certificate key file
      --config string                   Path to Argo CD config (default "/root/.config/argocd/config")
      --controller-name string          Name of the Argo CD Application controller; set this or the ARGOCD_APPLICATION_CONTROLLER_NAME environment variable when the controller's name label differs from the default, for example when installing via the Helm chart (default "argocd-application-controller")
      --core                            If set to true then CLI talks directly to Kubernetes instead of talking to Argo CD API server
      --grpc-web                        Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.
      --grpc-web-root-path string       Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.
  -H, --header strings                  Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)
  -h, --help                            help for argocd
      --http-retry-max int              Maximum number of retries to establish http connection to Argo CD server
      --insecure                        Skip server certificate and domain verification
      --kube-context string             Directs the command to the given kube-context
      --logformat string                Set the logging format. One of: json|text (default "json")
      --loglevel string                 Set the logging level. One of: debug|info|warn|error (default "info")
      --plaintext                       Disable TLS
      --port-forward                    Connect to a random argocd-server port using port forwarding
      --port-forward-namespace string   Namespace name which should be used for port forwarding
      --prompts-enabled                 Force optional interactive prompts to be enabled or disabled, overriding local configuration. If not specified, the local configuration value will be used, which is false by default.
      --redis-compress string           Enable this if the application controller is configured with redis compression enabled. (possible values: gzip, none) (default "gzip")
      --redis-haproxy-name string       Name of the Redis HA Proxy; set this or the ARGOCD_REDIS_HAPROXY_NAME environment variable when the HA Proxy's name label differs from the default, for example when installing via the Helm chart (default "argocd-redis-ha-haproxy")
      --redis-name string               Name of the Redis deployment; set this or the ARGOCD_REDIS_NAME environment variable when the Redis's name label differs from the default, for example when installing via the Helm chart (default "argocd-redis")
      --repo-server-name string         Name of the Argo CD Repo server; set this or the ARGOCD_REPO_SERVER_NAME environment variable when the server's name label differs from the default, for example when installing via the Helm chart (default "argocd-repo-server")
      --server string                   Argo CD server address
      --server-crt string               Server certificate file
      --server-name string              Name of the Argo CD API server; set this or the ARGOCD_SERVER_NAME environment variable when the server's name label differs from the default, for example when installing via the Helm chart (default "argocd-server")

Use "argocd [command] --help" for more information about a command.
```

## ArgoCD CLI Login

```bash
[root@kubecentos ~]# kubectl get svc/argocd-server -n argocd
NAME            TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                      AGE
argocd-server   LoadBalancer   10.109.156.6   193.16.16.100   80:30383/TCP,443:31489/TCP   2d1h
[root@kubecentos ~]# kubectl get secret/argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d
7-1KR9SBGVIjEDdE[root@kubecentos ~]# 
[root@kubecentos ~]# 
[root@kubecentos ~]# argocd login 193.16.16.100 --insecure --username admin --password 7-1KR9SBGVIjEDdE
'admin:login' logged in successfully
Context '193.16.16.100' updated
```

## ArgoCD Command for cluster list

```bash
[root@kubecentos ~]# argocd cluster list
SERVER                          NAME        VERSION  STATUS      MESSAGE  PROJECT
https://kubernetes.default.svc  in-cluster  1.32     Successful     
```

## ArgoCD Command for project list

```bash
[root@kubecentos ~]# argocd proj list
NAME     DESCRIPTION  DESTINATIONS  SOURCES  CLUSTER-RESOURCE-WHITELIST  NAMESPACE-RESOURCE-BLACKLIST  SIGNATURE-KEYS  ORPHANED-RESOURCES  DESTINATION-SERVICE-ACCOUNTS
default               *,*           *        */*                         <none>                        <none>          disabled            <none>
```

## ArgoCD Command for repo list

```bash
[root@kubecentos ~]# argocd repo list
TYPE  NAME        REPO                                          INSECURE  OCI    LFS    CREDS  STATUS      MESSAGE  PROJECT
git   argocddemo  https://github.com/hemanth22/argocd-demo.git  false     false  false  false  Successful           default
```

## ArgoCD command for app list

```bash
[root@kubecentos ~]# argocd app list
NAME  CLUSTER  NAMESPACE  PROJECT  STATUS  HEALTH  SYNCPOLICY  CONDITIONS  REPO  PATH  TARGET
[root@kubecentos ~]# 
```

## AroCD help account command

```bash
[root@kubecentos ~]# argocd account help
Manage account settings

Usage:
  argocd account [flags]
  argocd account [command]

Examples:
  # List accounts
  argocd account list
  
  # Update the current user's password
  argocd account update-password
  
  # Can I sync any app?
  argocd account can-i sync applications '*'
  
  # Get User information
  argocd account get-user-info

Available Commands:
  bcrypt          Generate bcrypt hash for any password
  can-i           Can I
  delete-token    Deletes account token
  generate-token  Generate account token
  get             Get account details
  get-user-info   Get user info
  list            List accounts
  update-password Update an account's password

Flags:
      --as string                      Username to impersonate for the operation
      --as-group stringArray           Group to impersonate for the operation, this flag can be repeated to specify multiple groups.
      --as-uid string                  UID to impersonate for the operation
      --certificate-authority string   Path to a cert file for the certificate authority
      --client-certificate string      Path to a client certificate file for TLS
      --client-key string              Path to a client key file for TLS
      --cluster string                 The name of the kubeconfig cluster to use
      --context string                 The name of the kubeconfig context to use
      --disable-compression            If true, opt-out of response compression for all requests to the server
  -h, --help                           help for account
      --insecure-skip-tls-verify       If true, the server's certificate will not be checked for validity. This will make your HTTPS connections insecure
      --kubeconfig string              Path to a kube config. Only required if out-of-cluster
  -n, --namespace string               If present, the namespace scope for this CLI request
      --password string                Password for basic authentication to the API server
      --proxy-url string               If provided, this URL will be used to connect via proxy
      --request-timeout string         The length of time to wait before giving up on a single server request. Non-zero values should contain a corresponding time unit (e.g. 1s, 2m, 3h). A value of zero means don't timeout requests. (default "0")
      --tls-server-name string         If provided, this name will be used to validate server certificate. If this is not provided, hostname used to contact the server is used.
      --token string                   Bearer token for authentication to the API server
      --user string                    The name of the kubeconfig user to use
      --username string                Username for basic authentication to the API server

Global Flags:
      --argocd-context string           The name of the Argo-CD server context to use
      --auth-token string               Authentication token; set this or the ARGOCD_AUTH_TOKEN environment variable
      --client-crt string               Client certificate file
      --client-crt-key string           Client certificate key file
      --config string                   Path to Argo CD config (default "/root/.config/argocd/config")
      --controller-name string          Name of the Argo CD Application controller; set this or the ARGOCD_APPLICATION_CONTROLLER_NAME environment variable when the controller's name label differs from the default, for example when installing via the Helm chart (default "argocd-application-controller")
      --core                            If set to true then CLI talks directly to Kubernetes instead of talking to Argo CD API server
      --grpc-web                        Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.
      --grpc-web-root-path string       Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.
  -H, --header strings                  Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)
      --http-retry-max int              Maximum number of retries to establish http connection to Argo CD server
      --insecure                        Skip server certificate and domain verification
      --kube-context string             Directs the command to the given kube-context
      --logformat string                Set the logging format. One of: json|text (default "json")
      --loglevel string                 Set the logging level. One of: debug|info|warn|error (default "info")
      --plaintext                       Disable TLS
      --port-forward                    Connect to a random argocd-server port using port forwarding
      --port-forward-namespace string   Namespace name which should be used for port forwarding
      --prompts-enabled                 Force optional interactive prompts to be enabled or disabled, overriding local configuration. If not specified, the local configuration value will be used, which is false by default.
      --redis-compress string           Enable this if the application controller is configured with redis compression enabled. (possible values: gzip, none) (default "gzip")
      --redis-haproxy-name string       Name of the Redis HA Proxy; set this or the ARGOCD_REDIS_HAPROXY_NAME environment variable when the HA Proxy's name label differs from the default, for example when installing via the Helm chart (default "argocd-redis-ha-haproxy")
      --redis-name string               Name of the Redis deployment; set this or the ARGOCD_REDIS_NAME environment variable when the Redis's name label differs from the default, for example when installing via the Helm chart (default "argocd-redis")
      --repo-server-name string         Name of the Argo CD Repo server; set this or the ARGOCD_REPO_SERVER_NAME environment variable when the server's name label differs from the default, for example when installing via the Helm chart (default "argocd-repo-server")
      --server string                   Argo CD server address
      --server-crt string               Server certificate file
      --server-name string              Name of the Argo CD API server; set this or the ARGOCD_SERVER_NAME environment variable when the server's name label differs from the default, for example when installing via the Helm chart (default "argocd-server")

Use "argocd account [command] --help" for more information about a command.
```

## ArgoCD CLI command for user info

```bash
[root@kubecentos ~]# argocd account get-user-info
Logged In: true
Username: admin
Issuer: argocd
Groups: 
```

## ArgoCD CLI command for admin username

```bash
[root@kubecentos ~]# argocd account get admin
Name:               admin
Enabled:            true
Capabilities:       login

Tokens:
NONE
```

## ArgoCD CLI Command to change password

```bash
kubectl get secret/argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d
[root@kubecentos ~]# argocd account update-password
*** Enter password of currently logged in user (admin): 
*** Enter new password for user admin: 
*** Confirm new password for user admin: 
Password updated
Context '193.16.16.100' updated
```

## ArgoCD CLI Command to verify password change

```bash
[root@kubecentos ~]# argocd login 193.16.16.100 --insecure --username admin --password 7-1KR9SBGVIjEDdE
{"level":"fatal","msg":"rpc error: code = Unauthenticated desc = Invalid username or password","time":"2026-01-21T04:42:25Z"}
[root@kubecentos ~]# argocd login 193.16.16.100 --insecure --username admin --password hemanthbitra
'admin:login' logged in successfully
Context '193.16.16.100' updated
```

## ArgoCD CLI Command to create app help

```bash
[root@kubecentos ~]# argocd app create --help
Create an application

Usage:
  argocd app create APPNAME [flags]

Examples:
  # Create a directory app
  argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --directory-recurse

  # Create a Jsonnet app
  argocd app create jsonnet-guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path jsonnet-guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --jsonnet-ext-str replicas=2

  # Create a Helm app
  argocd app create helm-guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path helm-guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --helm-set replicaCount=2

  # Create a Helm app from a Helm repo
  argocd app create nginx-ingress --repo https://charts.helm.sh/stable --helm-chart nginx-ingress --revision 1.24.3 --dest-namespace default --dest-server https://kubernetes.default.svc

  # Create a Kustomize app
  argocd app create kustomize-guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path kustomize-guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --kustomize-image quay.io/argoprojlabs/argocd-e2e-container:0.1

  # Create a MultiSource app while yaml file contains an application with multiple sources
  argocd app create guestbook --file <path-to-yaml-file>

  # Create a app using a custom tool:
  argocd app create kasane --repo https://github.com/argoproj/argocd-example-apps.git --path plugins/kasane --dest-namespace default --dest-server https://kubernetes.default.svc --config-management-plugin kasane

Flags:
      --allow-empty                                Set allow zero live resources when sync is automated
      --annotations stringArray                    Set metadata annotations (e.g. example=value)
  -N, --app-namespace string                       Namespace where the application will be created in
      --auto-prune                                 Set automatic pruning when sync is automated
      --config-management-plugin string            Config management plugin name
      --dest-name string                           K8s cluster Name (e.g. minikube)
      --dest-namespace string                      K8s target namespace
      --dest-server string                         K8s cluster URL (e.g. https://kubernetes.default.svc)
      --directory-exclude string                   Set glob expression used to exclude files from application source path
      --directory-include string                   Set glob expression used to include files from application source path
      --directory-recurse                          Recurse directory
      --dry-source-path string                     Path in repository to the app directory for the dry source
      --dry-source-repo string                     Repository URL of the app dry source
      --dry-source-revision string                 Revision of the app dry source
      --env string                                 Application environment to monitor
  -f, --file string                                Filename or URL to Kubernetes manifests for the app
      --helm-api-versions stringArray              Helm api-versions (in format [group/]version/kind) to use when running helm template (Can be repeated to set several values: --helm-api-versions traefik.io/v1alpha1/TLSOption --helm-api-versions v1/Service). If not set, use the api-versions from the destination cluster
      --helm-chart string                          Helm Chart name
      --helm-kube-version string                   Helm kube-version to use when running helm template. If not set, use the kube version from the destination cluster
      --helm-namespace string                      Helm namespace to use when running helm template. If not set, use app.spec.destination.namespace
      --helm-pass-credentials                      Pass credentials to all domain
      --helm-set stringArray                       Helm set values on the command line (can be repeated to set several values: --helm-set key1=val1 --helm-set key2=val2)
      --helm-set-file stringArray                  Helm set values from respective files specified via the command line (can be repeated to set several values: --helm-set-file key1=path1 --helm-set-file key2=path2)
      --helm-set-string stringArray                Helm set STRING values on the command line (can be repeated to set several values: --helm-set-string key1=val1 --helm-set-string key2=val2)
      --helm-skip-crds                             Skip helm crd installation step
      --helm-skip-schema-validation                Skip helm schema validation step
      --helm-skip-tests                            Skip helm test manifests installation step
      --helm-version string                        Helm version
  -h, --help                                       help for create
      --hydrate-to-branch string                   The branch to hydrate the app to
      --ignore-missing-components                  Ignore locally missing component directories when setting Kustomize components
      --ignore-missing-value-files                 Ignore locally missing valueFiles when setting helm template --values
      --jsonnet-ext-var-code stringArray           Jsonnet ext var
      --jsonnet-ext-var-str stringArray            Jsonnet string ext var
      --jsonnet-libs stringArray                   Additional jsonnet libs (prefixed by repoRoot)
      --jsonnet-tla-code stringArray               Jsonnet top level code arguments
      --jsonnet-tla-str stringArray                Jsonnet top level string arguments
      --kustomize-api-versions stringArray         api-versions (in format [group/]version/kind) to use when running helm template (Can be repeated to set several values: --helm-api-versions traefik.io/v1alpha1/TLSOption --helm-api-versions v1/Service). If not set, use the api-versions from the destination cluster. Only applicable when Helm is enabled for Kustomize builds
      --kustomize-common-annotation stringArray    Set common labels in Kustomize
      --kustomize-common-label stringArray         Set common labels in Kustomize
      --kustomize-force-common-annotation          Force common annotations in Kustomize
      --kustomize-force-common-label               Force common labels in Kustomize
      --kustomize-image stringArray                Kustomize images (e.g. --kustomize-image node:8.15.0 --kustomize-image mysql=mariadb,alpine@sha256:24a0c4b4a4c0eb97a1aabb8e29f18e917d05abfe1b7a7c07857230879ce7d3d)
      --kustomize-kube-version string              kube-version to use when running helm template. If not set, use the kube version from the destination cluster. Only applicable when Helm is enabled for Kustomize builds
      --kustomize-label-include-templates          Apply common label to resource templates
      --kustomize-label-without-selector           Do not apply common label to selectors. Also do not apply label to templates unless --kustomize-label-include-templates is set
      --kustomize-namespace string                 Kustomize namespace
      --kustomize-replica stringArray              Kustomize replicas (e.g. --kustomize-replica my-development=2 --kustomize-replica my-statefulset=4)
      --kustomize-version string                   Kustomize version
  -l, --label stringArray                          Labels to apply to the app
      --name string                                A name for the app, ignored if a file is set (DEPRECATED)
      --nameprefix string                          Kustomize nameprefix
      --namesuffix string                          Kustomize namesuffix
  -p, --parameter stringArray                      set a parameter override (e.g. -p guestbook=image=example/guestbook:latest)
      --path string                                Path in repository to the app directory, ignored if a file is set
      --plugin-env stringArray                     Additional plugin envs
      --project string                             Application project name
      --ref string                                 Ref is reference to another source within sources field
      --release-name string                        Helm release-name
      --repo string                                Repository URL, ignored if a file is set
      --revision string                            The tracking source branch, tag, commit or Helm chart version the application will sync to
      --revision-history-limit int                 How many items to keep in revision history (default 10)
      --self-heal                                  Set self healing when sync is automated
      --set-finalizer                              Sets deletion finalizer on the application, application resources will be cascaded on deletion
      --source-name string                         Name of the source from the list of sources of the app.
      --sync-option Prune=false                    Add or remove a sync option, e.g add Prune=false. Remove using `!` prefix, e.g. `!Prune=false`
      --sync-policy string                         Set the sync policy (one of: manual (aliases of manual: none), automated (aliases of automated: auto, automatic))
      --sync-retry-backoff-duration duration       Sync retry backoff base duration. Input needs to be a duration (e.g. 2m, 1h) (default 5s)
      --sync-retry-backoff-factor int              Factor multiplies the base duration after each failed sync retry (default 2)
      --sync-retry-backoff-max-duration duration   Max sync retry backoff duration. Input needs to be a duration (e.g. 2m, 1h) (default 3m0s)
      --sync-retry-limit int                       Max number of allowed sync retries
      --sync-retry-refresh                         Indicates if the latest revision should be used on retry instead of the initial one
      --sync-source-branch string                  The branch from which the app will sync
      --sync-source-path string                    The path in the repository from which the app will sync
      --upsert                                     Allows to override application with the same name even if supplied application spec is different from existing spec
      --validate                                   Validation of repo and cluster (default true)
      --values stringArray                         Helm values file(s) to use
      --values-literal-file string                 Filename or URL to import as a literal Helm values block

Global Flags:
      --argocd-context string           The name of the Argo-CD server context to use
      --auth-token string               Authentication token; set this or the ARGOCD_AUTH_TOKEN environment variable
      --client-crt string               Client certificate file
      --client-crt-key string           Client certificate key file
      --config string                   Path to Argo CD config (default "/root/.config/argocd/config")
      --controller-name string          Name of the Argo CD Application controller; set this or the ARGOCD_APPLICATION_CONTROLLER_NAME environment variable when the controller's name label differs from the default, for example when installing via the Helm chart (default "argocd-application-controller")
      --core                            If set to true then CLI talks directly to Kubernetes instead of talking to Argo CD API server
      --grpc-web                        Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2.
      --grpc-web-root-path string       Enables gRPC-web protocol. Useful if Argo CD server is behind proxy which does not support HTTP2. Set web root.
  -H, --header strings                  Sets additional header to all requests made by Argo CD CLI. (Can be repeated multiple times to add multiple headers, also supports comma separated headers)
      --http-retry-max int              Maximum number of retries to establish http connection to Argo CD server
      --insecure                        Skip server certificate and domain verification
      --kube-context string             Directs the command to the given kube-context
      --logformat string                Set the logging format. One of: json|text (default "json")
      --loglevel string                 Set the logging level. One of: debug|info|warn|error (default "info")
      --plaintext                       Disable TLS
      --port-forward                    Connect to a random argocd-server port using port forwarding
      --port-forward-namespace string   Namespace name which should be used for port forwarding
      --prompts-enabled                 Force optional interactive prompts to be enabled or disabled, overriding local configuration. If not specified, the local configuration value will be used, which is false by default.
      --redis-compress string           Enable this if the application controller is configured with redis compression enabled. (possible values: gzip, none) (default "gzip")
      --redis-haproxy-name string       Name of the Redis HA Proxy; set this or the ARGOCD_REDIS_HAPROXY_NAME environment variable when the HA Proxy's name label differs from the default, for example when installing via the Helm chart (default "argocd-redis-ha-haproxy")
      --redis-name string               Name of the Redis deployment; set this or the ARGOCD_REDIS_NAME environment variable when the Redis's name label differs from the default, for example when installing via the Helm chart (default "argocd-redis")
      --repo-server-name string         Name of the Argo CD Repo server; set this or the ARGOCD_REPO_SERVER_NAME environment variable when the server's name label differs from the default, for example when installing via the Helm chart (default "argocd-repo-server")
      --server string                   Argo CD server address
      --server-crt string               Server certificate file
      --server-name string              Name of the Argo CD API server; set this or the ARGOCD_SERVER_NAME environment variable when the server's name label differs from the default, for example when installing via the Helm chart (default "argocd-server")
[root@kubecentos ~]# 
```

## ArgoCD CLI Command to create app

```bash
argocd app create argocd-demo --repo https://github.com/hemanth22/argocd-demo.git --path yamls --dest-namespace default --dest-server https://kubernetes.default.svc
```

```bash
[root@kubecentos ~]# argocd cluster list
SERVER                          NAME        VERSION  STATUS      MESSAGE  PROJECT
https://kubernetes.default.svc  in-cluster  1.32     Successful           
[root@kubecentos ~]# argocd app create argocd-demo --repo https://github.com/hemanth22/argocd-demo.git --path yamls --dest-namespace default --dest-server https://kubernetes.default.svc
application 'argocd-demo' created
[root@kubecentos ~]# argocd app list
NAME                CLUSTER                         NAMESPACE  PROJECT  STATUS     HEALTH   SYNCPOLICY  CONDITIONS  REPO                                          PATH   TARGET
argocd/argocd-demo  https://kubernetes.default.svc  default    default  OutOfSync  Missing  Manual      <none>      https://github.com/hemanth22/argocd-demo.git  yamls  
```

## ArgoCD CLI Command to list and sync the app

```bash
[root@kubecentos ~]# argocd app list
NAME                CLUSTER                         NAMESPACE  PROJECT  STATUS     HEALTH   SYNCPOLICY  CONDITIONS  REPO                                          PATH   TARGET
argocd/argocd-demo  https://kubernetes.default.svc  default    default  OutOfSync  Missing  Manual      <none>      https://github.com/hemanth22/argocd-demo.git  yamls  
[root@kubecentos ~]# argocd app sync argocd-demo
TIMESTAMP                  GROUP        KIND   NAMESPACE                  NAME    STATUS    HEALTH        HOOK  MESSAGE
2026-01-21T04:53:47+00:00            Service     default                 nginx  OutOfSync  Missing              
2026-01-21T04:53:47+00:00   apps  Deployment     default                 nginx  OutOfSync  Missing              
2026-01-21T04:53:47+00:00            Service     default                 nginx  OutOfSync  Healthy              

Name:               argocd/argocd-demo
Project:            default
Server:             https://kubernetes.default.svc
Namespace:          default
URL:                https://193.16.16.100/applications/argocd-demo
Source:
- Repo:             https://github.com/hemanth22/argocd-demo.git
  Target:           
  Path:             yamls
SyncWindow:         Sync Allowed
Sync Policy:        Manual
Sync Status:        Synced to  (f49a806)
Health Status:      Progressing

Operation:          Sync
Sync Revision:      f49a806ba4c8bd505813c7cccf3d2083596bfd7a
Phase:              Succeeded
Start:              2026-01-21 04:53:47 +0000 UTC
Finished:           2026-01-21 04:53:47 +0000 UTC
Duration:           0s
Message:            successfully synced (all tasks run)

GROUP  KIND        NAMESPACE  NAME   STATUS  HEALTH       HOOK  MESSAGE
       Service     default    nginx  Synced  Healthy            service/nginx created
apps   Deployment  default    nginx  Synced  Progressing        deployment.apps/nginx created
```

## ArgoCD CLI COmmand to get sync status

```bash
[root@kubecentos ~]# argocd app list
NAME                CLUSTER                         NAMESPACE  PROJECT  STATUS  HEALTH   SYNCPOLICY  CONDITIONS  REPO                                          PATH   TARGET
argocd/argocd-demo  https://kubernetes.default.svc  default    default  Synced  Healthy  Manual      <none>      https://github.com/hemanth22/argocd-demo.git  yamls  
[root@kubecentos ~]# argocd app get argocd-demo
Name:               argocd/argocd-demo
Project:            default
Server:             https://kubernetes.default.svc
Namespace:          default
URL:                https://193.16.16.100/applications/argocd-demo
Source:
- Repo:             https://github.com/hemanth22/argocd-demo.git
  Target:           
  Path:             yamls
SyncWindow:         Sync Allowed
Sync Policy:        Manual
Sync Status:        Synced to  (f49a806)
Health Status:      Healthy

GROUP  KIND        NAMESPACE  NAME   STATUS  HEALTH   HOOK  MESSAGE
       Service     default    nginx  Synced  Healthy        service/nginx created
apps   Deployment  default    nginx  Synced  Healthy        deployment.apps/nginx created
```

## ArgoCD CLI Command to get resources list

```bash
[root@kubecentos ~]# argocd app resources argocd-demo
GROUP  KIND        NAMESPACE  NAME   ORPHANED
       Service     default    nginx  No
apps   Deployment  default    nginx  No
```

## ArgoCD CLI Command to delete argocd-demo app

```bash
argocd app delete arogcd-demo
```
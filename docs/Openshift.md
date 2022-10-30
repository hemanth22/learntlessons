# Openshift

## Openshift login and logout

### Uses the pre-configured OpenShift cluster

```
oc login
```

### Allows you to log in to any OpenShift cluster

```
oc login <cluster address>
```

### Log out

```
oc logout
```

## Project Basics

### See current project

```
oc project
```

### Create a new project

```
oc new-project demo-project
```

### List all projects

```
oc projects
```

### Switch projects

```
oc project <project name>
```

## Get Pod Documentation

### Get built-in documentation for Pods
```
oc explain pod
```

### Get details on the pod's spec
```
oc explain pod.spec
```

### Get details on the pod's containers
```
oc explain pod.spec.containers
```

## Creating Pods from files

### Create a Pod on OpenShift based on a file

```
oc create -f pods/pod.yaml
```

### Show all currently running Pods

```
oc get pods
```

## Port forwarding for Pods

### Open a local port that forwards traffic to a pod
```
oc port-forward <pod name> <local port>:<pod port>
```
### Example of 8080 to 8080 for hello world
```
oc port-forward hello-world-pod 8080:8080
```

## Shell into Pods

### oc rsh will work with any Pod name from oc get pods

```
oc rsh <pod name>
```
### In the shell, check the API on port 8080

```
wget localhost:8080
```
### Exit the rsh session
```
exit
```

### Watch live updates to pods
```
oc get pods --watch
```

### Describe pod

```
oc describe pod/pod-name
```

## Delete (stop) Pods

### Delete any OpenShift resource
```
oc delete <resource type> <resource name>
```
### Delete the pod for this section
```
oc delete pod hello-world-pod
```

### Yaml

https://yaml.org/

## Sample

### Sample pod yaml

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hello-world-pod
  labels:
    app: hello-world-pod
spec:
  containers:
  - env:
    - name: MESSAGE
      value: Hi! I'm an environment variable
    image: quay.io/practicalopenshift/hello-world
    imagePullPolicy: Always
    name: hello-world-override
    resources: {}
```

### Sample service yaml

```yaml
apiVersion: v1
kind: Service
metadata:
  name: hello-world-pod-service
spec:
  selector:
    app: hello-world-pod
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

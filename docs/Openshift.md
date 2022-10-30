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
## DeploymentConfig Basics

### Intro

[DeploymentConfig [apps.openshift.io/v1]](https://docs.openshift.com/container-platform/3.11/rest_api/apps_openshift_io/deploymentconfig-apps-openshift-io-v1.html)

```
oc explain deploymentconfig
```

```
oc explain deploymentconfig.spec.template
```

```
oc explain deploymentconfig.spec
```

```
oc version
```

#### Version 3 to 4.4
```
oc new-app quay.io/practicalopenshift/hello-world
```

#### Version 4.5+
```
oc new-app quay.io/practicalopenshift/hello-world --as-deployment-config 
```

## Deploying applications as DeploymentConfigs

### Deploy an existing image based on its tag
```
oc new-app <image tag>
```
### Deploy the Hello World image for this course
```
oc new-app quay.io/practicalopenshift/hello-world
```

### Check running resources
```
oc status
```

### Deploy from Git using oc new-app
```
oc new-app <git repo URL>
```
### Deploy the Hello World application from Git
```
oc new-app https://gitlab.com/practical-openshift/hello-world.git
```
### Follow build progress (Git only)
```
oc logs -f bc/hello-world
```
### Set the name for the DeploymentConfig 
```
oc new-app <image tag> --name <desired name>
```
### Example with a name
```
oc new-app quay.io/practicalopenshift/hello-world --name demo-app
```

## Get more information about a DeploymentConfig

### Describe the DC to get its labels
```
oc describe dc/hello-world
```
### Get the full YAML definition
```
oc get -o yaml dc/hello-world
```

### Comand to get image stream tag
```
oc get istag
```

## Deleting all oc new-app resources

### Delete all application resources using labels (get them from oc describe)
```
oc delete all -l app=hello-world
```

## Starting new versions and reverting changes

### Roll out the latest version of the application
```
oc rollout latest dc/hello-world
```
### Roll back to the previous version of the application
```
oc rollback dc/hello-world
```

## Deploy from Git using oc new-app

```
oc new-app https://gitlab.com/practical-openshift/hello-world.git
```

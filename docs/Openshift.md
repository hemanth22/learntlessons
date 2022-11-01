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
### Command to see replication controller
```
oc get rc
```
## Get service documentation

### Access oc explain documentation
```
oc explain service
```
### Get more information about Service's spec
```
oc explain service.spec
```
### Get YAML definition for a service
```
oc get -o yaml service/hello-world
```

### Get YAML definition for a route
```
oc get -o yaml route/hello-world
```

## Creating services

### Create a service for a single pod
```
oc expose --port 8080 pod/hello-world-pod
```
### Create a service for a DeploymentConfig 
```
oc expose --port 8080 dc/hello-world
```
### Check that the service and pod are connected properly
```
oc status
```
## Using Pod environment variables to find service Virtual IPs

### Inside the pod, get all environment variables
```
env
```
### Use the environment variables with wget
```
wget -qO- $HELLO_WORLD_POD_PORT_8080_TCP_ADDR:$HELLO_WORLD_POD_PORT_8080_TCP_PORT
```

## Creating Routes

### Create a Route based on a Service
```
oc expose svc/hello-world
```
### Get the Route URL
```
oc status
```
### Check the route
```
curl <route from oc status>
```
### Get YAML definition
```
oc get -o yaml route/hello-world
```

### Routes documentation

[Routes](https://docs.openshift.com/container-platform/3.11/dev_guide/routes.html)

## explain ConfigMaps
```
oc explain configmap
```

### Create a ConfigMap using literal command line arguments
```
oc create configmap <configmap-name> --from-literal KEY="VALUE"
```

### Create from a file
```
oc create configmap <configmap-name> --from-file=MESSAGE.txt
```
### Create from a file with a key override

```
oc create configmap <configmap-name> --from-file=MESSAGE=MESSAGE.txt
```
### Same --from-file but with a directory

```
oc create configmap <configmap-name> --from-file pods
```

### Verify
```
oc get -o yaml configmap/<configmap-name>
```

## Consuming ConfigMaps as Environment Variables

### Set environment variables (same for all types of ConfigMap)
```
oc set env dc/hello-world --from cm/<configmap-name>
```

### Sample configmap yaml file

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: lab-map
```
## Creating Secrets

[ServiceAccounts](https://docs.openshift.com/container-platform/3.11/dev_guide/service_accounts.html)
```
oc explain secret
```

### Create a simple generic (Opaque) Secret

```
oc create secret generic <secret-name> --from-literal KEY="VALUE"
```

```
oc create secret generic message-secret --from-literal MESSAGE="Secret Message"
```

## Check the Secret
```
oc get -o yaml secret/<secret-name>
```

### Consume the Secret as Environment Variables

### Almost the same as ConfigMaps

```
oc set env dc/<dc-name> --from secret/<secret-name>
```
### Sample secrets

```yaml
apiVersion: v1
data:
  MESSAGE: YmFzZTY0
kind: Secret
metadata:
  name: lab-secret
type: Opaque
```

## Create ImageStreams

### Create the ImageStream (but don't deploy yet)
```
oc import-image --confirm <image tag>
```

### Example with this course's image
```
oc import-image --confirm quay.io/practicalopenshift/hello-world
```
### Importing any new images
```
oc import-image --confirm quay.io/practicalopenshift/hello-world
```

## Importing extra ImageStreamTags for an existing ImageStream

### oc tag syntax
```
oc tag <original> <destination>
```

### Example
```
oc tag quay.io/image-name:tag image-name:tag
```

## Check the current ImageStreams and ImageStreamTags

### List ImageStreams
```
oc get is
oc get imagestream
```

### List tags
```
oc get istag
oc get imagestreamtag
```

## Use the ImageStream with oc new-app

### Deploy an application based on your new ImageStream
```
oc new-app myproject/hello-world
```

### Creating and pushing a private image
### These require signing up for a Quay.io account and pushing a private image

### Remote Tag syntax
```
<host name>/<your username>/<image name>
```
### Building an image with a remote tag
```
docker build -t quay.io/$REGISTRY_USERNAME/private-repo .
```
### Log into a registry
```
docker login <hostname>
```
### Log into quay.io

```
docker login quay.io
```
### Push (send) an image to a remote registry
```
docker push <remote tag>
```
### Push the image to Quay
```
docker push quay.io/$REGISTRY_USERNAME/private-repo
```

## Use Private images with OpenShift

### You may need to run this command 
```
source credentials.env
```
## Create a Docker registry secret
```
oc create secret docker-registry \
  <secret name> \
  --docker-server=$REGISTRY_HOST \
  --docker-username=$REGISTRY_USERNAME \
  --docker-password=$REGISTRY_PASSWORD \
  --docker-email=$REGISTRY_EMAIL
```

## A touch of secrets magic
### This command links the secret to the service account named "default"
```
oc secrets link default <secret name> --for=pull
```

### Check that the service account has the secret associated
```
oc describe serviceaccount/default
```
### Once authentication is set up, start the application 
```
oc new-app quay.io/$REGISTRY_USERNAME/private-repo
```

## Intro to builds

### Create a new BuildConfig from a Git repository URL
```
oc new-build https://gitlab.com/practical-openshift/hello-world.git
```

### Get more information about the bui
```
oc get -o yaml buildconfig/hello-world
```

### See builds that have run
```
oc get build
```

## Creating new BuildConfigs

### Create a new BuildConfig from a Git repository URL

```
oc new-build <Git URL>
```

### Example

```
oc new-build https://gitlab.com/practical-openshift/hello-world.git
```

### Start a new build from the update-message branch

```
oc new-build https://gitlab.com/practical-openshift/hello-world.git#update-message
```

### Use --context-dir to build from a subdirectory

```
oc new-build https://gitlab.com/practical-openshift/labs.git --context-dir hello-world
```

## Working with existing BuildConfigs

### Start a build

```
oc start-build bc/hello-world
```

### Get logs for a single build

```
oc logs -f build/hello-world-1
```

```
oc logs -f buildconfig/hello-world-1
```

```
oc describe is/hello-world
```

## Get logs for the latest build for a BuildConfig

### This is the best way (usually)

```
oc logs -f bc/hello-world
```

### Cancel a running build

```
oc cancel-build bc/hello-world
```

### Get more information about the build

```
oc get -o yaml buildconfig/hello-world
```

### See builds that have run

```
oc get build
```

```
oc get buildconfig
```

### Start a build for an existing BuildConfig

```
oc start-build bc/hello-world
```

## Set build hooks

### Set a post-commit hook

```
oc set build-hook bc/hello-world \
  --post-commit \
  --script="echo Hello from build hook"
```

### Check the logs output for "Hello from build hook"

```
oc logs -f bc/hello-world
```

### Set a failing build hook to observe the behavior

```
oc set build-hook bc/hello-world \
  --post-commit \
  --script="exit 1"
```

### Check the events to see if it ran

```
oc get events
```

### Remove the build hook

```
oc set build-hook bc/hello-world \
  --post-commit \
  --remove
```

### See all of your pods

```
oc get pods
```

## Working with WebHooks

### Get the secret token

```
oc get -o yaml buildconfig/hello-world
```

### Export the secret as a variable

```
export GENERIC_SECRET=<generic token from previous command>
```

### Get the webhook URL

```
oc describe buildconfig/hello-world
```

### Copy the webhook URL and replace <secret> with $GENERIC_SECRET

```
curl -X POST -k <webhook URL with secret replaced with $GENERIC_SECRET>
```

## Use S2I in a build

|Dockerfile Instruction|S2I Script|
|---|---|
|RUN|Assemble|
|CMD|RUN|

### The syntax is the same as normal Builds. OpenShift uses S2I when there is no Dockerfile

### oc new-app works with S2I 

```
oc new-app <Git URL with no Dockerfile>
```

### oc new-build works with S2I 

```
oc new-build <Git URL with no Dockerfile>
```

### Example: build the s2i/ruby directory of the labs project

```
oc new-app https://gitlab.com/practical-openshift/labs.git \
  --context-dir s2i/ruby --as-deployment-config
```

### Specifying a builder image

```
oc new-app builder-image~<Git URL>
```

### Example: Deploy with the ruby image explicitly declared

```
oc new-app \
  ruby~https://gitlab.com/practical-openshift/labs.git \
  --context-dir s2i/ruby --as-deployment-config
```

### Get the logs
```
oc logs -f bc/labs
```

### Check the running pods
```
oc get pods
```

### Expose and check
```
oc expose svc/labs
oc get route
```

### S2I Scripts

||||
|---|---|---|
|assemble| Required | Build image |
|run | Required | CMD instruction |
|save-artifacts| Optional | Cache dependencies |
|usage|Optional | Documentation for users |
|test`/`run|Optional| Test the builder image |

### Overriding S2I Scripts
### Assemble and Run are the two main scripts
### Overrides go in your source at .s2i/bin/assemble or .s2i/bin/run
### They need to call the original scripts, which are usually at /usr/libexec/s2i/assemble or /usr/libexec/s2i/run

## Volumes

### Create a new project for the volumes section
```
oc new-project volumes
```
### Deploy the basic app
```
oc new-app quay.io/practicalopenshift/hello-world
```
### Main syntax

```
oc set volume dc/<dc name> --add --type emptyDir --mount-path <path inside container>
```

### Add an emptyDir volume

```
oc set volume dc/hello-world \
  --add \
  --type emptyDir \
  --mount-path /empty-dir-demo
```

### Check the definition
```
oc get -o yaml dc/hello-world
```

### Get the pod names
```
oc get pods
```
  
### Start a shell
```
oc rsh <pod name from output>
```

### Check for /empty-dir-demo
```
ls /
```

### Check contents of /empty-dir-demo
```
ls /empty-dir-demo
```

### Add a file 
```
echo "Test file contents" > /empty-dir-demo/test-file.txt
```

### Check that the file was created successfully

```
ls /empty-dir-demo
```

### Create the configmap to use as a Volume

### Main command
```
oc set volume <DC name> --add --configmap-name <configmap name> --mount-path <path inside container>
```

```
oc create configmap cm-volume \
  --from-literal file.txt="ConfigMap file contents"
```

### Mount the ConfigMap

```
oc set volume dc/hello-world \
  --add \
  --configmap-name cm-volume \
  --mount-path /cm-directory
```

### Check updates to the DeploymentConfig
```
oc get -o yaml dc/hello-world
```

### Get the pod name
```
oc get pod
```

### Start the shell
```
oc rsh <pod name>
```

### Check for /cm-directory
```
ls /
```

### Check inside /cm-directory
```
ls /cm-directory
```

### Check the file contents
```
cat /cm-directory/file.txt
```

### The official Kubernetes Documentation for Volumes
https://kubernetes.io/docs/concepts/storage/volumes/

### Check out the built-in documentation

```
oc explain persistentvolume.spec
```

```
oc explain persistentvolume.spec.vsphereVolume
```

```
oc explain persistentvolume.spec.cinder
```

## Advanced DeploymentConfig

### Create a new project for the Advanced DC section
```
oc new-project advanced-dc
```

### Deploy the Hello World image
```
oc new-app quay.io/practicalopenshift/hello-world
```

### Use oc describe on the DeploymentConfig
```
oc describe dc/hello-world
```

### Start watching pods
```
oc get pods --watch
```

### Set a volume in order to trigger a rollout
```
oc set volume dc/hello-world \
  --add \
  --type emptyDir \
  --mount-path /config-change-demo
```

## triggers

### List triggers
```
oc set triggers dc/hello-world
```

### Remove the ConfigChange trigger
```
oc set triggers dc/hello-world \
  --remove
  --from-config
```

### Re-add the ConfigChange trigger
```
oc set triggers dc/hello-world --from-config
```

### Remove the ImageChange trigger
```
oc set triggers dc/<dc name> \
  --remove \
  --from-image <image name>:<tag>
```

### Re-add the ImageChange trigger

### You need to pick a container in your pod spec that corresponds to the image in --from-image
```
oc set triggers dc/<dc name> \
  --from-image <image name>:<tag> \
  -c <container name>
```

## Deployment Hooks

### General syntax
```
oc set deployment-hook dc/<dc name> \
  (--pre, --post, or --mid) \
  -c <container name to execute hook in>
  -- <command to execute for the hook>
```

### Example: Add a simple deployment hook
```
oc set deployment-hook dc/hello-world \
  --pre \
  -c hello-world \
  -- /bin/echo Hello from pre-deploy hook
```

### Check the hook in the DeploymentConfig definition
```
oc describe dc/hello-world
```

### Roll out again to see the changes

### You should get a hello-world-4-hook-pre pod
```
oc rollout latest dc/hello-world
```

### Check events
```
oc get events
```

## Switching to the Recreate Strategy
### No oc set deployment-strategy as of writing, so you'll need to manually update the resource definition

### Edit it live
```
oc edit dc/hello-world
```

### To change to Recreate, switch the spec.strategy to be:
```
  strategy:
    type: Recreate
```

### Check that the changes saved (search for Strategy)
```
oc describe dc/hello-world
```

### Rollout to test
```
oc rollout latest dc/hello-world
```
  
## Readiness and Liveness probes

### General syntax
```
oc set probe dc/<dc name> (--liveness or --readiness) (--open-tcp, --get-url, or -- for a command)
```

### Example: Add a liveness probe that opens TCP port 8080 for its test
```
oc set probe dc/hello-world --liveness --open-tcp=8080
```

### Example: Add a readiness probe that requests localhost port 8080 with the path /health/readiness for its test
```
oc set probe dc/hello-world --readiness --get-url=http://:8080/health/readiness
```

### Example: Add a readiness probe that runs "exit 0" inside the container as its test
```
oc set probe dc/hello-world --readiness -- exit 0
```

### Set the probe incorrectly
```
oc set probe dc/hello-world \
  --liveness \
  --open-tcp=8081
```

### Watch pods
```
oc get pods --watch
```

### Set the probe to the correct port
```
oc set probe dc/hello-world \
  --liveness \
  --open-tcp=8080
```

## Horizontal pods Autoscaling

### Manual Scaling
  
#### Make a new project for the scaling section
```
oc new-project scaling
```

#### Deploy Hello World
```
oc new-app quay.io/practicalopenshift/hello-world
```

#### Get the definition
```
oc describe dc/hello-world
```

#### General Syntax
```
oc scale dc/<dc name> --replicas=<desired replicas>
```

#### Example: Manual scale to 3 pods
```
oc scale dc/hello-world --replicas=3
```

#### Example: Scale back down to one
```
oc scale dc/hello-world --replicas=1
```

### Autoscaling

#### General Syntax to create a HorizontalPodAutoscaler (HPA)
```
oc autoscale dc/<dc name> \
  --min <desired minimum pods> \
  --max <desired maximum pods> \
  --cpu-percent=<desiredTargetCPU>
```

#### Example of scaling Hello World between 1 and 10 pods with an 80% CPU target
```
oc autoscale dc/hello-world \
  --min 1 \
  --max 10 \
  --cpu-percent=80
```

#### Check the HPA
```
oc get hpa
```

#### More information on the HPA
```
oc describe hpa/hello-world
```

#### Get the YAML for the HPA
```
oc get -o yaml hpa/hello-world
```

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

[deployment strategies](https://docs.openshift.com/container-platform/3.11/dev_guide/deployments/deployment_strategies.html#custom-strategy)

  
## Templates
  
## Manage templates as OpenShift resources

### Create the template from the file
```
oc create -f template/hello-world-template.yaml
```

### Check the template
```
oc get template
```

### Create an application based on the template
```
oc new-app hello-world
```

### Set parameter values

```
oc new-app hello-world \
  -p MESSAGE="Hello from parameter override."
```

## Process templates

### Basic processing (gives you JSON)
```
oc process hello-world
```

### Get the processed results in YAML
```
oc process hello-world -o yaml
```

### With parameters
```
oc process hello-world -o yaml \
  -p MESSAGE="Hello from oc process"
```

### Save the processed template to a file
```
oc process hello-world -o yaml \
  -p MESSAGE="Hello from oc process" \
  > processed-objects.yaml
```

### Check the file
```
head processed-objects.yaml
```

### Create the objects
```
oc create -f processed-objects.yaml
```


## Use a template file

```
oc process -o yaml -f <template file>
```

### Use a file-based template

```
oc process -o yaml \
  -f template/hello-world-template.yaml
```

### Example with oc new-app and a parameter
```
oc new-app \
  -f template/hello-world-template.yaml
  -p MESSAGE="Hello from oc new-app with a file"
```


### Creating your own Template

```
# Get YAML for existing objects on the OpenShift server
# The dc,is... syntax lists the types of resources that you would like to export
# Add hpa or any other type if you need them
oc get -o yaml dc,is,bc,svc,route --export
```

### Save output to a file

```
oc get -o yaml dc,is,bc,svc,route \
  --export \
  > test-template.yaml
```

### Open it up in your favorite text editor
```
vi test-template.yaml
```

```
Steps for a custom template:
1. Change the items property to objects
2. Change kind from List to Template
3. Add a name property to the metadata section
4. Remove status from each resource
5. Remove most of metadata except for name, labels, and annotations
6. Remove any automatically-assigned resources such as service Virtual IPs and Route hosts
7. (optional) Add template parameters 

# Example parameter definition
- description: Message to respond to requests with
  displayName: Message
  name: MESSAGE
  required: false
  value: Hello from the default value for the template

# Using the parameter in your template YAML
          env:
            - name: MESSAGE
              # This syntax copies the template parameter value as a YAML string
              value: ${MESSAGE}
```

## Appendix
  
### Deployment and DeploymentConfig FAQ
  
Here are some of the most frequently asked questions by students about Deployments and DeploymentConfigs.  
Why did oc new-app work without --as-deployment-config?  
Yes, some of the commands in this course will work without the --as-deployment-config flag on oc new-app.  
The default behavior of oc new-app is to create a Deployment in more recent versions of OpenShift and oc.  
For many use cases, Deployment is a good choice to run your applications and it's a Kubernetes built-in type.  
Using a Kubernetes type is advantageous because it allows you to migrate your workload to non-OpenShift clusters if you needed to do such a thing.  
The controller pattern used in Deployments is a bit cleaner than DeploymentConfig's deploy pods.  
However, not all the functionality in DeploymentConfigs is supported by the Deployment type.  

Why does OpenShift have both Deployments and DeploymentConfigs?  

Deployments and DeploymentConfigs are different resource types, but they are very similar.  
Both Deployments and DeploymentConfigs have the same job of running multiple copies of your container images.  
They both maintain a stable number of pods, work with HorizontalPodAutoscalers, and support rollouts through the oc command line tool.  

DeploymentConfigs were added to OpenShift by RedHat as a custom resource type in the early days of OpenShift 3, around 2015.  
Adding them allowed RedHat to add the DeploymentConfig features to the OpenShift platform without waiting for Kubernetes to support them.  
An early version of Deployments landed in Kubernetes itself in Kubernetes 1.2 in 2016.  

Because OpenShift is a compliant Kubernetes distribution, OpenShift also supports this Deployment resource type.
With OpenShift 4, the underlying Kubernetes version is much more recent than the OpenShift 3.x line.  
This means that it also got the improvements made over the years to the Deployment type.  
Deployments now have the API version apps/v1, with no more alpha or beta.   
Now that the Deployment object is more mature, RedHat decided to switch oc new-app to use the Kubernetes built-in Deployment type by default.  

What are the differences between Deployment and DeploymentConfig?  

The first major difference is that Deployments use a ReplicaSet and DeploymentConfigs use a ReplicationController.  
These two resource types serve a similar purpose, and you shouldn't have to worry about them as a Deployment or DeploymentConfig user.  
But they are different. More information on differences here: https://stackoverflow.com/questions/36220388/what-is-the-difference-between-replicaset-and-replicationcontroller  

Another big difference is that Deployments run on a control loop inside the Kubernetes control plane to conduct rollouts.  
The controller pattern is very common in Kubernetes. DeploymentConfigs instead run the deployment logic on pods in the data plane alongside your application.  

More information on controllers in Kubernetes and OpenShift: https://kubernetes.io/docs/concepts/architecture/controller/  

Why does this course use DeploymentConfig?  

Deployments are the default for oc new-app, but DeploymentConfigs have more features as of writing.  
Kubernetes may close this gap with future enhancements to the Deployment system.  
There are a lot of use cases that will work just fine with a Deployment and don't need a DeploymentConfig.  
This course teaches DeploymentConfigs so that you can learn and use the extra functionality available to you in OpenShift DeploymentConfigs.  
Here are the features that are not supported in Deployments but are supported in DeploymentConfigs:  

- Custom deployment strategies  
- Automated rollbacks  
- ConfigChange and ImageChange triggers  
- Lifecycle hooks  

__More Info__  
For more information about Deployments and DeploymentConfigs, you can consult the official documentation from RedHat here:  
https://docs.openshift.com/container-platform/4.9/applications/deployments/what-deployments-are.html  
Kubernetes Deployment information: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/  

### Conclusion
  
__Kubernetes News__
Kubernetes itself is always innovating, and there's a lot of advanced functionality that we haven't covered in this course.  
OpenShift is based on Kubernetes, so studying Kubernetes resources is always a good use of time.  
Official Blog: https://kubernetes.io/blog/  

__Kubecon__
The official Kubernetes conference is a great place for you to learn more about what's happening in the Kubernetes and cloud native ecosystem.  
The Cloud Native Computing Foundation or CNCF is responsible for tracking Cloud-native project maturity as well as  
conducting security audits and generally improving Kubernetes-based tools.  

The easiest way to benefit from Kubecon is from the CNCF's Youtube channel.  
They have playlists for each of the conferences so that you can learn all about cutting edge Cloud Native tools.  

CNCF Youtube: https://www.youtube.com/c/cloudnativefdn  

CNCF Charter: https://github.com/cncf/foundation/blob/master/charter.md  

__Helm__  
Helm is a very popular and useful tool in Kubernetes and OpenShift based environments.  
Helm provides a way of packaging together software for Kubernetes, much like Chocolatey for Windows,  
Homebrew for Macs, and various OS package managers in Linux.  
If you are planning to develop software for Kubernetes or OpenShift long-term,  
it's a good idea to learn how Helm works and get comfortable using it.  

There are many good resources available to learn about Helm.  
One of the best ways to get started is to run through the Helm Quickstart on your OpenShift environment.  

Quickstart https://helm.sh/docs/intro/quickstart/  

Helm Main Site: https://helm.sh/  

__Telemetry__
Once your application is deployed, how will you know if it is running successfully?  
How do you measure your success rate? These are important questions for every developer to answer for their applications.  

There are a few tools in the cloud native landscape to help you with this.  
The most important and the best place to start is  Prometheus, which handles metrics for your application.  
These metrics can be used to alert you when things are going wrong through the use of AlertManager.  
A common complementary tool to these is Grafana to allow visualization of your application's performance data.  

Along with metrics, you'll also want to learn about text logging systems such as Kibana or Loki.  

No discussion of observability would be complete without also mentioning tracing systems such as Jaeger.  

One of the best resources to learn distributed application maintenance best practices is the Google Site Reliability Engineer (SRE) book, also linked below.  

There are lots of good resources to learn about these systems including some Udemy courses. Here are some links to the official documentation so you can learn more about these important topics.  

Prometheus: https://prometheus.io/docs/introduction/overview/  

AlertManager: https://www.prometheus.io/docs/alerting/latest/alertmanager/  

Grafana: https://grafana.com/  

Kibana: https://www.elastic.co/kibana/  

Loki: https://grafana.com/oss/loki/  

Jaeger: https://www.jaegertracing.io/  

OpenTelemetry: https://opentelemetry.io/

Google SRE Book: https://sre.google/books/  



__Service Mesh__  
Service Meshes can provide advanced networking capabilities such as:  

- Blue Green Deployment  

- Observability  

- Metrics for requests between Pods  

- Error Tracing  

- Request Tapping (view live traffic from a dashboard)  

- Automatic and transparent Retries  

- Timeout handling  

- Many more  



If you're interested in these capabilities then Service Meshes can be a good topic for you to learn. Here are some of the most common and mature service meshes for Kubernetes and OpenShift:  

- Linkerd (CNCF Graduated) https://linkerd.io/  

- Istio https://istio.io/latest/  



__Operators__  
Kubernetes operators provide advanced automated "Day 2" functionality customized for each application. Operators are a way of encoding the operational knowledge needed to run the application after it's installed. There are a few ways of creating and using operators. While you don't need operators in order to be effective with OpenShift, they are common enough that you should know what they are.  



More information on operators: https://kubernetes.io/docs/concepts/extend-kubernetes/operator/  



__Conclusion__  
This list provides you with several very important topics for OpenShift developers. However, there are also a lot of other excellent Cloud-native projects not mentioned here. For a full list you can see the CNCF project list here: https://www.cncf.io/projects/. The best way to learn about new developments is to check the Kubecon / CloudNativeCon Youtube playlists.

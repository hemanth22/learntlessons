# Getting Started with Podman  

## Configuring Podman in Rootless Mode

```bash
yum install podman
```

```bash
id -Gn
```

```bash
sysctl -ar max_user_namespaces --no-need to execute below command
```

```bash
podman version
```

```bash
cat /etc/subuid
```

__slirp4netns__ for networking need to be installed for podman.  

## Command to list images

```bash
podman image ls 
```

## Command to ps

```bash
podman ps
```

```bash
podman ps -a
```

## Command to search

```bash
podman search httpd
```

## Locating images 

```bash
sed -E '/^(#|$)/d' /etc/containers/registries.conf
```

## Command to run Simplest Container

```bash
podman run -it rhscl/httpd-24-rhel7 /bin/bash
```

## Creating a Simple Container  

```bash
podman image ls
```

## Command to search images from redhat registry
```bash
podman search httpd | head
```

## Command to list registries
```bash
sed -E '/^(#|$)/d' /etc/containers/registries.conf
```

## Command to run httpd

```bash
podman run -it rhscl/httpd-24-rhel7 /bin/bash
```

## Command to list pods

```bash
podman ps -a
```

## Understanding a web server containers

## Command to inspect image

```bash
podman inspect registry.access.redhat.com/rhscl/httpd-24-rhel7 | grep expose
```

## Command to run image in detached mode

```bash
podman run --name=www -d -p 8000:8080 rhscl/httpd-24-rhel7
```

```bash
podman rm [container_name]
```

## Creating a Web Container

```bash
podman image ls
```

```bash
podman run --name=www -d registry.access.redhat.com/rhscl/httpd-2-rhel7
```
## Execute inside container

```bash
podman exec -it www /bin/bash
```

## Inside container below command

```bash
curl localhost:8080
```

## Command to stop container

```bash
podman stop wwww
```

## Command to remoeve container

```bash
podman rm www
```

## Implementing Port Mapping

```bash
podman ps -a
```

```bash
podman run --name=www -d -p 8000:8080 registry.access.redhat.com/rhscl/httpd-2-rhel7
```

## Managing Container Lifecycle  

### Understanding Container Lifecycle  

- Starting and stopping containers  
- Connecting to running containers  
- Deleting images and containers  
- Pulling containers from registries  
- Using port mapping and firewalls  
- Persisting container volumes  


```bash
podman stop www
```

```bash
podman restart www
```

```bash
podman kill www
```

```bash
podman restart -l
```

```bash
podman stop -a
```

```bash
podman rm www
```

```bash
podman rm -f www
```

```bash
podman rm -a -f
```

```bash
podman rmi rhscl/httpd-24-rhel7 
```

```bash
podman image rm rhscl/httpd-24-rhel7 
```

```bash
podman rmi -a
```

### What About Publishing All Ports ?

```bash
podman pull rhscl/httpd-24-rhel7 
```

```bash
podman run --name=www -d --publish-all rhscl/httpd-24-rhel7
```

```bash
podman port -l
```

```bash
firewall-cmd --add-port 378138/tcp
```

### Understanding Persisting volumes  

```bash
chcon -Rvt container_file_t web-pages
```

```bash
podman run --name=www -d --publish-all -v /home/user/web-pages:/var/www/html rhscl/httpd-24-rhel7
```

### Creating Persistent Volumes  

```bash
chcon -Rvt container_file_t web-pages
```

```bash
firewall-cmd --list-all
```

```bash
podman run --name=www -d -p 35985:8080 -v /home/user/web-pages:/var/www/html rhscl/httpd-24-rhel7
```

## Managing Writable Data on Persistent Volumes

### Finding MySQL Containers

```bash
podman search --limit 1 mysql #only 1 match / registry
```

```bash
podman pull rhscl/mysql-57-rhel7
```
### Command to search environment variables

```bash
podman inspect rhscl/mysql-57-rhel7 | grep usage
```

```bash
podman run --name=sql -d -e MYSQL_USER=user -e MYSQL_PASSWORD=Password1 -e MYSQL_DATABASE=db -p 3306:3306 rhscl/mysql-57-rhel7
```

```bash
sudo firewall-cmd --add-port 3306/tcp
```

```bash
sudo yum install -y mysql
```

```bash
mysql -u user -p -h 172.16.120.129
```

### Connecting to Database  

```bash
podman run -d -e MYSQL_USER=user -e MYSQL_PASSWORD=pass -e MYSQL_DATABASE=db -p 3306:3306 rhscl/mysql-57-rhel7
```

```bash
podman ps
```

```bash
firewall-cmd --list-all
firewall-cmd --add-port 3306/tcp
```

```bash
podman port -l
```

```bash
yum install -y mysql
```

```bash
mysql -u user-p -h 172.16.120.129
mysql>SELECT DATABASE();
mysql>USE db;
mysql>SELECT DATABASE();
mysql>quit
```

### Understanding Writable Volumes

```bash
podman exec -it sql /bin/bash

bash-4.2$ id
$ ps -p1 -f
$ mkdir /home/tux/mysql
$ chcon -t container_file_t /home/tux/mysql
$ podman unshare chown 27:27 /home/tux/msql
$ ls -ld /home/tux/msql
```

```bash
podman rm -f sql
```

```bash
podman run -d --name=sql -e MYSQL_USER=user -e MYSQL_PASSWORD=pass -e MYSQL_DATABASE=db -p 3306:3306 -v /home/tux/mysql:/var/lib/mysql/data rhscl/mysql-57-rhel7
```

### MySQL User ID  

```bash
podman exec -it sql /bin/bash
>bash-4.2$ id
>bash-4.2$ ps -p1 -f
```

### Working in Namespaces  

```bash
chcon -t container_file_t mysql/
podman unshare id
podman unshare chown 27 mysql
```

### Creating Data in MySQL  

```bash
podman ps

podman rm -f sql 
```

### Command to check with container runtime

```bash
crun list
```

### Command to check whether podman running

```bash
ps -ef | grep conmon
```

```bash
[root@centos8 ~]# ps -ef | grep conmon | grep 'pidfile -n' | awk '{ print $1, $2, $12, $22 }'
root 2177 e2e9bec88c0239979660df3873518c312a924ac4ece91a8ac14d968887627ac0 d55f73f2558d-infra
root 2182 2a140ee98d8c02221ec38ecf5124a52afc68625ec66d5a3da6ec1de39d2eb638 mailhog
```

### Command to monitor podman

```bash
podman ps --format json > /var/tmp/podman.json
```

```python
import json

# Read the JSON data from the file
with open('/var/tmp/podman.json', 'r') as f:
    parsed = json.load(f)

# Print header
print('Created,Pid,Names,State,host_port,container_port,Image')

# Extract and print requested fields
for container in parsed:
    Created = container.get('Created', '')
    Pid = container.get('Pid', '')
    Names = ','.join(container.get('Names', []))
    State = container.get('State', '')
    host_port = ''
    container_port = ''
    if 'Ports' in container and container['Ports']:
        host_port = container['Ports'][0].get('host_port', '')
        container_port = container['Ports'][0].get('container_port', '')
    Image = container.get('Image', '')
    print(f'{Created},{Pid},{Names},{State},{host_port},{container_port},{Image}')
```

```
python3.13 podman_monitoring.py
```


## Podman command to create pod for mailhog

```bash
podman pod create -n mail -p 8025:8025 -p 1025:1025
```


## Podman command to create container inside the pod


```bash
podman run -d --pod mail --name mailhog docker.io/mailhog/mailhog:latest
```

## Below Podman commands for SMTP 25

```bash
podman pod create -n mail -p 8025:8025 -p 1025:25
podman run -d --pod mail --name mailhog docker.io/mailhog/mailhog:latest
```

```bash
[root@centos8 ~]# podman pod ps
POD ID        NAME        STATUS      CREATED         INFRA ID      # OF CONTAINERS
d55f73f2558d  mail        Running     28 minutes ago  e2e9bec88c02  2
```

```bash
[root@centos8 ~]# podman ps
CONTAINER ID  IMAGE                                    COMMAND     CREATED         STATUS        PORTS                                                   NAMES
e2e9bec88c02  localhost/podman-pause:5.4.0-1751987092              39 seconds ago  Up 7 seconds  0.0.0.0:1025->25/tcp, 0.0.0.0:8025->8025/tcp            d55f73f2558d-infra
2a140ee98d8c  docker.io/mailhog/mailhog:latest                     8 seconds ago   Up 7 seconds  0.0.0.0:1025->25/tcp, 0.0.0.0:8025->8025/tcp, 1025/tcp  mailhog
```

## Mailhog without pod and direct container

```bash
podman run -d -p 8025:8025 -p 1025:1025 --name mailhog docker.io/mailhog/mailhog:latest
```

## Podman command without truncate

```bash
podman ps --no-trunc
```

## Podman command stop container

```bash
[root@centos8 ~]# podman stop mailhog
mailhog
```

## Podman command stop pod

```bash
[root@centos8 ~]# podman pod stop mail
mail
```


## Podman command to remove container

```bash
[root@centos8 ~]# podman rm mailhog
mailhog

```

## Podman command to remove pod

```bash
[root@centos8 ~]# podman pod rm mail
d55f73f2558dff9b176f4c07382bf58827f9a8895c11047a0ed9480caf2c008e
```


## Podman volume example 

```bash
podman volume create postgresdb-data
podman volume ls
podman run -d --name postgresdb -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -e POSTGRES_DB=mydatabase -v postgresdb-data:/var/lib/postgresql/data -p 5432:5432 docker.io/library/postgres:latest
```
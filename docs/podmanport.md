## podman command to create httpd

```bash
podman run -d --name httpd quay.io/sclorg/httpd-24-micro-c9s
```

## Podman inspect 

```bash
[root@centos8 ~]# podman inspect --format '{{.NetworkSettings.IPAddress}}' 33fc383eee49
10.88.0.2
[root@centos8 ~]# podman inspect --format '{{.Name}} -> {{.NetworkSettings.IPAddress}}' 33fc383eee49
httpd -> 10.88.0.2
[root@centos8 ~]# podman ps -q | xargs podman inspect --format '{{.Name}} {{.NetworkSettings.IPAddress}}'
httpd 10.88.0.2
[root@centos8 ~]# podman inspect 33fc383eee49 | jq -r '.[0].NetworkSettings.IPAddress'
10.88.0.2
```

## Install socat

```bash
dnf install socat
```

## socat command to create network port for container runs without port

```bash
## By default httpd runs in port 8080, we are re-diecting 8080 to random port to expose 
socat TCP-LISTEN:1234,fork TCP-CONNECT:10.88.0.2:8080
```

## verification


```bash
[root@centos8 ~]# curl -I localhost:1234
HTTP/1.1 403 Forbidden
Date: Sun, 18 Jan 2026 14:31:21 GMT
Server: Apache/2.4.62 (CentOS Stream) OpenSSL/3.5.1
Last-Modified: Tue, 04 Jun 2024 22:57:12 GMT
ETag: "296919-61a185ec88200"
Accept-Ranges: bytes
Content-Length: 2713881
Content-Type: text/html; charset=UTF-8
```

## using socat container

```bash
podman pull docker.io/alpine/socat:1.8.0.3
```

```bash
podman run -d --name socat -p 3214:1234 alpine/socat TCP-LISTEN:1234,fork TCP-CONNECT:10.88.0.2:8080
```

```bash
podman ps -q | xargs podman inspect --format '{{.Name}} {{.NetworkSettings.IPAddress}} Ports={{json .NetworkSettings.Ports}}'
```

```bash
[root@centos8 ~]# podman ps -q | xargs podman inspect --format '{{.Name}} {{.NetworkSettings.IPAddress}} Ports={{json .NetworkSettings.Ports}}'
httpd 10.88.0.2 Ports={"8080/tcp":null,"8443/tcp":null}
socat 10.88.0.3 Ports={"1234/tcp":[{"HostIp":"0.0.0.0","HostPort":"3214"}]}
```

```bash
[root@centos8 ~]# curl -I 0.0.0.0:3214
HTTP/1.1 403 Forbidden
Date: Sun, 18 Jan 2026 14:37:38 GMT
Server: Apache/2.4.62 (CentOS Stream) OpenSSL/3.5.1
Last-Modified: Tue, 04 Jun 2024 22:57:12 GMT
ETag: "296919-61a185ec88200"
Accept-Ranges: bytes
Content-Length: 2713881
Content-Type: text/html; charset=UTF-8

[root@centos8 ~]# curl -I localhost:3214
HTTP/1.1 403 Forbidden
Date: Sun, 18 Jan 2026 14:37:49 GMT
Server: Apache/2.4.62 (CentOS Stream) OpenSSL/3.5.1
Last-Modified: Tue, 04 Jun 2024 22:57:12 GMT
ETag: "296919-61a185ec88200"
Accept-Ranges: bytes
Content-Length: 2713881
Content-Type: text/html; charset=UTF-8
```

```bash
podman ps --format '{{.Names}} {{.Ports}}'
```
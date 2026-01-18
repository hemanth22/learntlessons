## CRI-O installation


```bash
echo "[TASK 1] Configure CRIO Version"
CRIO_VERSION=v1.34
echo "[TASK 2] Add the CRI-O Repository"
cat <<EOF | tee /etc/yum.repos.d/cri-o.repo
[cri-o]
name=CRI-O
baseurl=https://download.opensuse.org/repositories/isv:/cri-o:/stable:/$CRIO_VERSION/rpm/
enabled=1
gpgcheck=1
gpgkey=https://download.opensuse.org/repositories/isv:/cri-o:/stable:/$CRIO_VERSION/rpm/repodata/repomd.xml.key
EOF
echo "[TASK 3] Configure SELinux to permissive mode"
setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config
echo "[TASK 4] Install CRI-O on RHEL"
dnf install -y cri-o
echo "[TASK 5] Ensure to start CRI-O"
systemctl start crio
systemctl status crio
echo "[TASK 5] Ensure to enable CRI-O for startup"
systemctl enable crio
systemctl status crio
echo "[TASK 6] Install CNI Plugin for CRI-O"
CNI_VERSION="v1.6.0"
ARCH="amd64"
curl -LO "https://github.com/containernetworking/plugins/releases/download/${CNI_VERSION}/cni-plugins-linux-${ARCH}-${CNI_VERSION}.tgz"
mkdir -p /opt/cni/bin
tar -C /opt/cni/bin -xzf cni-plugins-linux-${ARCH}-${CNI_VERSION}.tgz
mv /etc/cni/net.d/10-crio-bridge.conflist.disabled /etc/cni/net.d/10-crio-bridge.conflist
echo "[TASK 7] Service restart of CRI-O"
systemctl restart crio
systemctl status crio
echo "[TASK 8] Tools provision for CRI-O"
export VERSION="v1.34.0"
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz
tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
cp /usr/local/bin/crictl /usr/bin/
echo "[TASK 9] Verification of CRI-O Runtime"
crictl --runtime-endpoint unix:///var/run/crio/crio.sock version
echo "[TASK 10] Verification of CRI-O Version"
crictl --version
echo "[TASK 10] CRI-O Cluster info"
crictl info | tail -20
echo "[TASK 11] Preventive action CRI-O sandbox creation can fail due to systemd eBPF device filtering"
cat <<EOF | tee /etc/crio/crio.conf.d/99-disable-ebpf.conf
[crio.runtime]
enable_devices = false
EOF
systemctl restart crio
echo "[TASK 12] Update OpenSSL + system crypto policies"
dnf update -y openssl crypto-policies
update-crypto-policies --set DEFAULT
echo "[TASK 13] Manual reboot required"
echo "reboot linux manually"
echo "[TASK 14] Verification of CRI-O Runtime after reboot"
crictl --runtime-endpoint unix:///var/run/crio/crio.sock version
crictl --version
```

## CRI-O Configuration

```bash
[root@centos8 ~]# cat /etc/crictl.yaml
runtime-endpoint: "unix:///var/run/crio/crio.sock"
timeout: 0
debug: false
```

## CRI-O Purge

```bash
echo "[TASK 1] Ensure to configure environment variables"
CRIO_VERSION=v1.34
CNI_VERSION="v1.6.0"
ARCH="amd64"
VERSION="v1.34.0"
echo "[TASK 2] Post Installation purge"
/bin/rm -v cni-plugins-linux-${ARCH}-${CNI_VERSION}.tgz
/bin/rm -v crictl-$VERSION-linux-amd64.tar.gz
```

## Verify the crictl version

```bash
crictl --runtime-endpoint unix:///var/run/crio/crio.sock version
crictl --version
```

## verify the output of crictl info command output, Runtime and Network should be in Ready State

```bash
crictl info | tail -20
```

## command to verify runtime

```bash
[root@centos8 ~]# crictl info | grep -i cgroup
      "CgroupManagerName": "systemd",
      "ConmonCgroup": "",
            "io.kubernetes.cri-o.cgroup2-mount-hierarchy-rw",
            "io.kubernetes.cri-o.UnifiedCgroup",
          "MonitorCgroup": "system.slice",
          "MonitorExecCgroup": "",
            "io.kubernetes.cri-o.cgroup2-mount-hierarchy-rw",
            "io.kubernetes.cri-o.UnifiedCgroup",
          "MonitorCgroup": "system.slice",
          "MonitorExecCgroup": "",
      "SeparatePullCgroup": "",
```

## CRIO Command to create pod

```bash
[root@centos8 ~]# cat nginx-pod.json
{
  "metadata": {
    "name": "nginx-pod",
    "namespace": "default"
  },
  "linux": {
    "cgroup_parent": "system.slice"
  },
  "port_mappings": [
    {
      "container_port": 80,
      "protocol": 0
    }
  ]
}
```

## Command to create pod sandbox

```bash
[root@centos8 ~]# POD_ID=$(crictl runp nginx-pod.json)
crictl inspectp $POD_ID | grep -i cgroup
        "io.kubernetes.cri-o.CgroupParent": "system.slice",
        "cgroupsPath": "system.slice:crio:22b6583fa5c1810377375a0a25012c3db2ad3b83a7326ea5ff1c0c1a56d44301",
```

## Command to create pods

```bash
[root@centos8 ~]# crictl pods
POD ID              CREATED             STATE               NAME                NAMESPACE           ATTEMPT             RUNTIME
22b6583fa5c18       2 minutes ago       Ready               nginx-pod           default             0                   (default)
```

## json to create container inside pod

```bash
[root@centos8 ~]# cat nginx-container.json
{
  "metadata": {
    "name": "nginx"
  },
  "image": {
    "image": "docker.io/library/nginx:latest"
  },
  "log_path": "nginx.log",
  "linux": {
    "security_context": {
      "privileged": false
    }
  }
}
```

## command to create container inside pod

```bsh
[root@centos8 ~]# CID=$(crictl create $POD_ID nginx-container.json nginx-pod.json)
[root@centos8 ~]# crictl start $CID
b14bff59bf46fe75a76bd540444ff0b3fe8c52f6bf322e4b3f25557c7f836630
[root@centos8 ~]# crictl ps
CONTAINER           IMAGE                            CREATED             STATE               NAME                ATTEMPT             POD ID              POD                 NAMESPACE
b14bff59bf46f       docker.io/library/nginx:latest   9 seconds ago       Running             nginx               0                   22b6583fa5c18       unknown             unknown
```


## Command to list container and pods

```bash
[root@centos8 ~]# crictl ps
CONTAINER           IMAGE                            CREATED             STATE               NAME                ATTEMPT             POD ID              POD                 NAMESPACE
b14bff59bf46f       docker.io/library/nginx:latest   2 minutes ago       Running             nginx               0                   22b6583fa5c18       unknown             unknown
```

## View the container logs, run

```bash
[root@centos8 ~]# crictl logs $CID
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/01/18 14:01:36 [notice] 2#2: using the "epoll" event method
2026/01/18 14:01:36 [notice] 2#2: nginx/1.29.4
2026/01/18 14:01:36 [notice] 2#2: built by gcc 14.2.0 (Debian 14.2.0-19)
2026/01/18 14:01:36 [notice] 2#2: OS: Linux 5.14.0-570.39.1.el9_6.x86_64
2026/01/18 14:01:36 [notice] 2#2: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/01/18 14:01:36 [notice] 2#2: start worker processes
2026/01/18 14:01:36 [notice] 2#2: start worker process 25
2026/01/18 14:01:36 [notice] 2#2: start worker process 26
2026/01/18 14:01:36 [notice] 2#2: start worker process 27
2026/01/18 14:01:36 [notice] 2#2: start worker process 28
```

## Get the pod IP address and try to access application, run the following command

```bash
[root@centos8 ~]# crictl inspectp --output table 22b6583fa5c18 | head
ID: 22b6583fa5c1810377375a0a25012c3db2ad3b83a7326ea5ff1c0c1a56d44301
Name: nginx-pod
UID: ec67140b-b6b1-4113-bac1-a21229815894
Namespace: default
Attempt: 0
Status: SANDBOX_READY
Created: 2026-01-18 13:59:31.698659283 +0000 UTC
IP Addresses: 10.85.0.4
Additional IP: 1100:200::4
Labels:
[root@centos8 ~]# crictl inspectp --output table | grep -i 'Addresses'
IP Addresses: 10.85.0.3
```

## curl command.

```bash
[root@centos8 ~]# curl -I 10.85.0.4
HTTP/1.1 200 OK
Server: nginx/1.29.4
Date: Sun, 18 Jan 2026 14:05:22 GMT
Content-Type: text/html
Content-Length: 615
Last-Modified: Tue, 09 Dec 2025 18:28:10 GMT
Connection: keep-alive
ETag: "69386a3a-267"
Accept-Ranges: bytes
```

## To clean up the Pod and container, run following commands.

```bash
crictl stop $CID
crictl rm $CID
crictl stopp $POD_ID
crictl rmp $POD_ID
```
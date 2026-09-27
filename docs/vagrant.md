# Vagrant command line

## Vagrant initial vagrant file

```bash
vagrant init bitroid/rockylinux9 --box-version 6.0.0
```


## Vagrant command to bring up the vagrant instance

```bash
vagrant up
```

## Vagrant command to bring up the instance and provision with script

```bash
vagrant up --provision
```

## Vagrant command to bring up the instance without script provision

```bash
vagrant up --no-provision
```

## Vagrant commadn to bring down the vagrant instance

```bash
vagrant halt
```

## Vagrant command to restart instance

```bash
vagrant reload
```

## Vagrant command to delete instance

```bash
vagrant destroy
```

## Vagrant command to delete instance forcefully

```bash
vagrant destroy -f
```

## Vagrant command to check status of the instances

```bash
vagrant global-status
```

## Vagrant command to list boxes installed

```powershell
vagrant box list
```

## Vagrant command to add external url box

```powershell
vagrant box add <name> <url> 
```

## Vagrant command to add internal box from path

```powershell
PS C:\HOMEWARE\VM\bitroidrocky\9> vagrant package --vagrantfile vagrant_file/Vagrantfile --output rockylinux9.box
==> default: Clearing any previously set forwarded ports...
==> default: Exporting VM...
==> default: Compressing package to: C:/HOMEWARE/VM/bitroidrocky/9/rockylinux9.box
==> default: Packaging additional file: vagrant_file/Vagrantfile
```

```powershell
vagrant box add --name bitroid/rockylinux9_28_06 C:/HOMEWARE/VM/bitroidrocky/9/rockylinux9.box
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'bitroid/rockylinux9_28_06' (v0) for provider: (amd64)
    box: Unpacking necessary files from: file:///C:/HOMEWARE/VM/bitroidrocky/9/rockylinux9.box
    box:
==> box: Successfully added box 'bitroid/rockylinux9_28_06' (v0) for '(amd64)'!
```

```powershell
PS C:\HOMEWARE\VM\kube> vagrant box list
bitroid/rockylinux10      (virtualbox, 1.0.0, (amd64))
bitroid/rockylinux9       (virtualbox, 6.0.0, (amd64))
bitroid/rockylinux9_28_06 (virtualbox, 0, (amd64))
generic/alpine318         (virtualbox, 4.3.12, (amd64))
generic/alpine38          (virtualbox, 4.3.12, (amd64))
rockylinux/8              (virtualbox, 9.0.0, (amd64))
rockylinux/9              (virtualbox, 6.0.0, (amd64))
rockylinux10              (virtualbox, 0, (amd64))
```

```bash
Vagrant.configure("2") do |config|
  config.vm.box = "bitroid/rockylinux9_28_06"
  
  # REMOVE OR COMMENT OUT THIS LINE:
  # config.vm.box_version = "26.08" 

  # Prevent Vagrant from looking for newer versions on HashiCorp Cloud
  config.vm.box_check_update = false 

  # ... rest of your configuration (rsync, etc.)
end
```

## Vagrant command to login

```bash
vagrant cloud auth login
```

```bash
vagrant cloud auth login --token 'PASTE_TOKEN_HERE'
```

## Vagrant command to logout

```bash
vagrant cloud auth logout
```

## Vagrant command to package vagrant image in virtualbox

```bash
vagrant package --vagrantfile vagrant_file/Vagrantfile --output rockylinux9.box
```

## Vagrant command to upload box to cloud

```bash
vagrant cloud publish vagrant/mybox 1.0.0 virtualbox /path/to/mybox.box -d "Description of the box" --release
```

__Example__
```bash
vagrant cloud publish bitroid/rockylinux9 6.0.0 virtualbox rockylinux9.box -d "bitroid/rockylinux9" --release
```

## Vagrant command to list plugin

```bash
vagrant plugin list
```

## Vagrant command to install plugin

```bash
vagrant plugin install vagrant-vbguest
```

```bash
vagrant plugin install vagrant-sshfs
```

```bash
vagrant plugin install vagrant-hostmanager
```

```bash
vagrant plugin install vagrant-disksize
```

## Vagrant command to take snapshot

```bash
vagrant snapshot save <snapshot_name>
```

## Vagrant command to restore snapshot

```bash
vagrant snapshot restore <snapshot_name>
```

## Vagrant command to restore snapshot without script provision

```bash
vagrant snapshot restore <snapshot_name> --no-provision
```

## vagrant command to ssh

```bash
vagrant ssh
```

## vagrant command to ssh to specific instance

```bash
vagrant ssh instance_name
```

## vagrant command to execute in multiple instance in detached mode

```bash
vagrant ssh manager -c 'cat /etc/hostname'  
vagrant ssh worker -c 'cat /etc/hostname'
```

## vagrant commmand to bring up in debug mode

```powershell
vagrant up --debug > debug.log 2>&1
```

## Vagrant command to add rockylinux boxes

### Rockylinux8

```powershell
vagrant box add Rocky-8-Vagrant-Vbox-8.10 https://dl.rockylinux.org/pub/rocky/8.10/images/x86_64/Rocky-8-Vagrant-Vbox-8.10-20240528.0.x86_64.box
```

### Rockylinux9

```powershell
vagrant box add Rocky-9-Vagrant-Vbox-9.8 https://dl.rockylinux.org/pub/rocky/9.8/images/x86_64/Rocky-9-Vagrant-Vbox-9.8-20260525.0.x86_64.vagrant.virtualbox.box
```

### Rockylinux10

```powershell
vagrant box add Rocky-10-Vagrant-Vbox-10.2 https://dl.rockylinux.org/pub/rocky/10.2/images/x86_64/Rocky-10-Vagrant-Vbox-10.2-20260525.0.x86_64.vagrant.virtualbox.box
vagrant box add Rocky-10-Vagrant-Vbox-10.1 https://dl.rockylinux.org/vault/rocky/10.1/images/x86_64/Rocky-10-Vagrant-Vbox-10.1-20251116.0.x86_64.box
```

## How to install GuestAddition inside vagrant rocky linux image using iso image

```bash
echo "[TASK 1] Update packages"
dnf -y update
dnf distro-sync -y
yum install -y kernel-headers
yum install -y gcc make perl bzip2 elfutils-libelf-devel wget patch libgomp glibc-headers glibc-devel
yum install -y kernel-devel
echo "[TASK 2] Verify packages"
rpm -q kernel-devel kernel-headers gcc make perl bzip2 elfutils-libelf-devel wget binutils patch libgomp glibc-headers glibc-devel
echo "[TASK 3] Download VirtualBox Guest Additions"
cd /root/
wget https://download.virtualbox.org/virtualbox/7.2.8/VBoxGuestAdditions_7.2.8.iso
echo "[TASK 4] Mount VirtualBox Guest Additions"
mkdir -p /opt/VBoxGuestAdditions_7.2.8
cp -v /root/VBoxGuestAdditions_7.2.8.iso /opt
mount -o loop /opt/VBoxGuestAdditions_7.2.8.iso /opt/VBoxGuestAdditions_7.2.8
echo "[TASK 5] Execute VirtualBox Guest Additions"
ls -ltr /opt/VBoxGuestAdditions_7.2.8
cd /opt/VBoxGuestAdditions_7.2.8
sh ./VBoxLinuxAdditions.run
echo "[TASK 6] Purge VirtualBox Guest Additions"
rm -v /root/VBoxGuestAdditions_7.1.4.iso
echo "[TASK 7] Enable ssh password authentication"
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl reload sshd
echo "[TASK 8] Set root password"
echo -e "hemanth\nhemanth" | passwd root >/dev/null 2>&1
```

## How to install GuestAddition inside vagrant rocky linux image with dnf


```bash
% dnf install centos-release-kmods
% dnf install kmod-vbox-guest-additions
% systemctl reboot
```

or 

```bash
# Install the release package
% dnf install centos-release-kmods

# Install the kmod, which will bring in the guest additions package
% dnf install kmod-vbox-guest-additions

$ dnf install virtualbox-guest-additions kernel-devel-matched
$ systemctl enable vboxservice
$ systemctl status vboxservice
# Reboot the system for it to take affect
% systemctl reboot

# Once your VM is up, you can verify the service is running:
% systemctl status vboxclient
% lsmod | grep vboxguest
```

## How to identify VBox process

```bash
[vagrant@localhost ~]$ systemctl list-unit-files | grep -i vbox
vboxadd-service.service                    enabled         disabled
vboxadd.service                            enabled         disabled
[vagrant@localhost ~]$ systemctl status vboxadd.service vboxadd-service.service
● vboxadd.service
     Loaded: loaded (/opt/VBoxGuestAdditions-7.2.14/init/vboxadd; enabled; preset: disabled)
     Active: active (exited) since Sun 2026-08-23 18:13:20 UTC; 21min ago
    Process: 579 ExecStart=/opt/VBoxGuestAdditions-7.2.14/init/vboxadd start (code=exited, status=0/SUCCESS)
   Main PID: 579 (code=exited, status=0/SUCCESS)
        CPU: 575ms

● vboxadd-service.service
     Loaded: loaded (/opt/VBoxGuestAdditions-7.2.14/init/vboxadd-service; enabled; preset: disabled)
     Active: active (running) since Sun 2026-08-23 18:13:20 UTC; 21min ago
    Process: 868 ExecStart=/opt/VBoxGuestAdditions-7.2.14/init/vboxadd-service start (code=exited, status=0/SUCCESS)
      Tasks: 9 (limit: 24762)
     Memory: 2.0M (peak: 2.6M)
        CPU: 584ms
     CGroup: /system.slice/vboxadd-service.service
             └─889 /usr/sbin/VBoxService --pidfile /var/run/vboxadd-service.sh
```

## Vagrant command to verify vbguest status

```powershell
vagrant vbguest --status
```

## Vagrant command to install guestbox

```powershell
vagrant vbguest --do install
```

## Vagrant errors FAQ

### VERR_INTNET_FLT_IF_NOT_FOUND

```text
Error: VERR_INTNET_FLT_IF_NOT_FOUND  

Recommendation:

1. Open Oracle Virtual Machine
2. Go to Files -> Tools -> Network
3. Delete the Host-only Networks adaptor , which is matching with vagrant file private_network ip
4. This will recreate when vagrant image is destroy and brought up

Root Cause:

This would have been cause due to inappropiate shutdown or delete vagrant resources manually.
```

### SSH TIMEOUT CONNECTIVITY ERROR  

If you are getting below error, try investigating with below process

```powershell
PS C:\HOMEWARE\VM\centos8> vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Clearing any previously set forwarded ports...
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
    default: Adapter 3: bridged
==> default: Forwarding ports...
    default: 8000 (guest) => 8000 (host) (adapter 1)
    default: 80 (guest) => 8089 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
PS C:\HOMEWARE\VM\centos8> ssh root@centos8
ssh: connect to host centos8 port 22: Connection timed out
PS C:\HOMEWARE\VM\centos8> ssh root@centos8
ssh: connect to host centos8 port 22: Connection timed out
PS C:\HOMEWARE\VM\centos8> ssh -vvvv root@centos8
debug1: OpenSSH_for_Windows_10.0p2 Win32-OpenSSH-GitHub, LibreSSL 4.2.0
debug3: Started with: "C:\\\\Program Files\\\\OpenSSH\\\\ssh.exe" -vvvv root@centos8
debug1: Reading configuration data C:\\Users\\hemanth/.ssh/config
debug1: C:\\Users\\hemanth/.ssh/config line 13: Applying options for centos8
debug3: Failed to open file:C:/ProgramData/ssh/ssh_config error:2
debug3: expanded UserKnownHostsFile '~/.ssh/known_hosts' -> 'C:\\Users\\hemanth/.ssh/known_hosts'
debug3: expanded UserKnownHostsFile '~/.ssh/known_hosts2' -> 'C:\\Users\\hemanth/.ssh/known_hosts2'
debug2: resolving "centos8" port 22
debug3: resolve_host: lookup centos8:22
debug3: channel_clear_timeouts: clearing
debug3: ssh_connect_direct: entering
debug1: Connecting to centos8 [192.168.56.9] port 22.
debug3: finish_connect - ERROR: async io completed with error: 10060, io:00000166872CA2D0
debug1: connect to address 192.168.56.9 port 22: Connection timed out
```

```powershell
PS C:\HOMEWARE\VM\centos8> & "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list runningvms
"centos8_default_1789623491210_54859" {d8df879e-be28-41fd-b791-42dbd19936da}
PS C:\HOMEWARE\VM\centos8> & "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "centos8_default_1789623491210_54859" screenshotpng "$PWD\centos8.png"
```

```powershell
Select-String -Path "$env:USERPROFILE\VirtualBox VMs\centos8_default_1789623491210_54859\Logs\VBox.log" -Pattern "NEM|Hyper-V|HMR3Init" | Select-Object -First 10
```

If it is due to HyperV unusual startup.
Execute below commands in powershell as an admin

```powershell
bcdedit /set hypervisorlaunchtype off
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart
Disable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
Disable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -NoRestart
```

Restart VM using below

```powershell
vagrant halt --force
vagrant up
```

### Repo list for references

[RockyLinux 8 Repo](https://dl.rockylinux.org/vault/rocky/8.9/images/x86_64/)  
[RockyLinux 9 Repo](https://dl.rockylinux.org/pub/rocky/9.8/images/x86_64/)  
[RockyLinux 10 Repo](https://dl.rockylinux.org/pub/rocky/10.2/images/x86_64/)  
[CentOS Packages](https://centos.pkgs.org/)  
[RockyLinux Packages](https://rockylinux.pkgs.org/)  
[CentOS 10 Stream](https://cloud.centos.org/centos/10-stream/x86_64/images/)  

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

```bash
vagrant box list
```

## Vagrant command to add external url box

```bash
vagrant box add <name> <url> 
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

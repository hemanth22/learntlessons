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

## Vagrant command to add internal box from path

```bash
PS C:\HOMEWARE\VM\bitroidrocky\9> vagrant package --vagrantfile vagrant_file/Vagrantfile --output rockylinux9.box
==> default: Clearing any previously set forwarded ports...
==> default: Exporting VM...
==> default: Compressing package to: C:/HOMEWARE/VM/bitroidrocky/9/rockylinux9.box
==> default: Packaging additional file: vagrant_file/Vagrantfile
```

```bash
vagrant box add --name bitroid/rockylinux9_28_06 C:/HOMEWARE/VM/bitroidrocky/9/rockylinux9.box
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'bitroid/rockylinux9_28_06' (v0) for provider: (amd64)
    box: Unpacking necessary files from: file:///C:/HOMEWARE/VM/bitroidrocky/9/rockylinux9.box
    box:
==> box: Successfully added box 'bitroid/rockylinux9_28_06' (v0) for '(amd64)'!
```

```bash
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

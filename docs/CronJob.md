## Cronjob scheduling

1. Grant cronjob to run job based on user.  

First check whether you have cron.allow  

```shell
/etc/cron.allow
```

if there is then execute below command to add access to user.  

```shell
echo "centos" /etc/cron.allow
```

2. Create cron file  

Create a `cron` file for `root` user  

```shell
# touch /var/spool/cron/root
# /usr/bin/crontab /var/spool/cron/root
```

Create a `cron` file for `centos` user  

```shell
# touch /var/spool/cron/centos
# /usr/bin/crontab /var/spool/cron/centos
```

3. Schedule your job  

create some dummy jobs. To give a demonstration I will schedule a job to clear temporary files every midnight for both the user  

```shell
# echo "0 0 * * * rm -f /tmp/root/*" >> /var/spool/cron/root

# echo "0 0 * * * rm -f /tmp/centos/*" >> /var/spool/cron/centos
```

4. Validate the cron job content  

Here you can use `-u` to define the username for which you wish to perform the cron action  

```shell
# crontab -u centos -l
0 0 * * * rm -f /tmp/centos/*

# crontab -u root -l
0 0 * * * rm -f /tmp/root/*
```

So our cron jobs are updated successfully for both `root` and `centos` user.  

5. Script to create cron job using bash shell script  

**vi cronjobdeployer.sh**
```shell
#!/bin/bash
   if [ `id -u` -ne 0 ]; then
      echo "This script can be executed only as root, Exiting.."
      exit 1
   fi

case "$1" in
   install|update)

	CRON_FILE="/var/spool/cron/root"

	if [ ! -f $CRON_FILE ]; then
	   echo "cron file for root doesnot exist, creating.."
	   touch $CRON_FILE
	   /usr/bin/crontab $CRON_FILE
	fi

	# Method 1 for root user
	grep -qi "cleanup_script" $CRON_FILE
	if [ $? != 0 ]; then
	   echo "Updating cron job for cleaning temporary files"
           /bin/echo "0 0 * * * rm -f /root/cleanup_script.sh" >> $CRON_FILE
	fi

	# Method 2 for user level
	#grep -qi "cleanup_script" $CRON_FILE
	#if [ $? != 0 ]; then
	#   echo "Updating cron job for cleaning temporary files"
	#   crontab -u centos -l >/tmp/crontab
    #       /bin/echo "0 0 * * * rm -f /home/centos/cleanup_script.sh" >> /tmp/crontab
	#   crontab -u centos /tmp/crontab
	#fi

	;;
	
	*)
	
	echo "Usage: $0 {install|update}"
	exit 1
    ;;

esac
```

Here I have shared two methods to update cron job using a shell script for `root` and `centos` user.  

Command to execute

```shell
# /root/cronjobdeployer.sh install
```

6. List the cron jobs  

```
# crontab -u root -l
0 0 * * * rm -f /home/root/cleanup_script.sh

# crontab -u centos -l
0 0 * * * rm -f /home/centos/cleanup_script.sh
```

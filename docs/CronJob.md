# Cronjob scheduling

## Grant cronjob to run job based on user.  

First check whether you have cron.allow  

```shell
/etc/cron.allow
```

if there is then execute below command to add access to user.  

```shell
echo "centos" /etc/cron.allow
```

## Create cron file  

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

## Schedule your job  

create some dummy jobs. To give a demonstration I will schedule a job to clear temporary files every midnight for both the user  

```shell
# echo "0 0 * * * rm -f /tmp/root/*" >> /var/spool/cron/root

# echo "0 0 * * * rm -f /tmp/centos/*" >> /var/spool/cron/centos
```

## Validate the cron job content  

Here you can use `-u` to define the username for which you wish to perform the cron action  

```shell
# crontab -u centos -l
0 0 * * * rm -f /tmp/centos/*

# crontab -u root -l
0 0 * * * rm -f /tmp/root/*
```

So our cron jobs are updated successfully for both `root` and `centos` user.  

## Script to create cron job using bash shell script  

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

## Command to execute

```shell
# /root/cronjobdeployer.sh install
```

## List the cron jobs  

```
# crontab -u root -l
0 0 * * * rm -f /home/root/cleanup_script.sh

# crontab -u centos -l
0 0 * * * rm -f /home/centos/cleanup_script.sh
```

## Cronjob script with many options

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
	   echo -e "\033[5;32mDeployment Completed.\033[0"
           /bin/echo "* * * * * root /root/cleanup_script.sh" >> $CRON_FILE
	fi

	# Method 2 for user level
	#grep -qi "cleanup_script" $CRON_FILE
	#if [ $? != 0 ]; then
	#   echo "Updating cron job for cleaning temporary files"
	#   crontab -u deepak -l >/tmp/crontab
    #       /bin/echo "0 0 * * * rm -f /home/deepak/cleanup_script.sh" >> /tmp/crontab
	#   crontab -u deepak /tmp/crontab
	#fi

	;;

	disable)
	
	grep -qi --extended-regexp "^#.*cleanup_script.*" /var/spool/cron/root
	if [ $? != 0 ]
	then
		crontab -l | sed "/^[^#].*cleanup_script/s/^/#/" | crontab -
		echo -e "\033[5;32mDisabled cronjob\033[0m"
	else
		echo -e "\033[5;31;40mERROR: \033[0m\033[31;40mCron Job is already disable.\033[m"
	fi
	
	;;

	enable)

	crontab -l | sed "/^#.*cleanup_script/s/^#//" | crontab -
	;;
	
	*)
	
	echo "Usage: $0 {install|update|disable|enable}"
	exit 1
    ;;

esac
```

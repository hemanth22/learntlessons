# What is Unix ?  

- Unix is an operating system.  
- Developed by __AT&T__ employees at __Bell Labs(1969-1971).__  
  - Initially it is names __*"Unics"*__ (i.e Uniplexed information and computing service).  
  - Later Renamed to __*"Unix"*__ when it could support multiple users.  
- Rewritten in the C Programming languge __(1972)__.  
  - C was developed for the Unix OS.  
- Unix spreads outside __AT&T(1975)__.  
  - Goverment agencies, universities and corporations.  
  - Free Licenses and source code.  
- Branches and improvements __(1977 - Present)__.  
  - __Open Source__: BSD (Berkeley Software Distribution), Linux.  
  - __Closed Source__: Solaris (Sun/Oracle), AIX (IBM), HP/UX (Hewlett-packard).  
  - __Mixed Source__: Mac OS X (Apple).  
- "Unix" now means a "Unix-like System".  
- Mobile devices are Unix like iphone, ipad, Andriod.  

__Mac OS X__  
  - BSD Unix + NexTSTEP + Apple code = DARWIN.  
  - Unix is "Under the hood".  
  - Finder and System preference interact with unix.  
  - Access unix directly from the command line using terminals.  
  
__Terminal Application__  
- Provides command line access to unix.  
- Pre-installed with macosx.  
- located in /Applications/Utilities/Terminal  

__KERNEL and SHELLS__  
- Kernel  
  - Core of the OS.  
  - Allocates time and memory to programs.  
  - MACOSX uses the mach kernel.  
- Shell
  - Outer layer of OS.  
  - Interacts with user.  
  - Sends request to kernel.  
  - MACOSX uses the bash shell, but includes other choics.  
- Popular Shells
  - sh   : Thompson shell (1971).  
  - sh   : Bourne shell (1977).  
  - csh  : c shell (1979).   
  - tcsh : tabbed c shell (1979).  
  - ksh  : Korn shell (1982).  
  - bash : Bourne-Again Shell (1987).  
  - zsh  : Z shell (1990). 
  - fish : friendly interactive shell.  
  
__Command to check which shell and path.__  

`>$ echo $SHELL`  

Output  
```
/bin/bash
```

__Command to check which shell.__

`>$ echo $0`

Output  
```
bash
```
- To directly switch to another shell type directly give shell name in name.  

__Unix manual pages__.  

```
man -k [commandname]
```
```
apropos [commandname]
```
```
whatis [commandname]
```

__File System Basics__  

Command to display present working directory.  

```
$pwd
```

- In linux we use forward slash ("/").  
- In microsoft window we use backward slash ("\").  

Command to listing files and directory.  

`>$ ls`  

`>$ ls -l`  

`>$ ls -la`  

`>$ ls -lah`  

Moving around directory.  

`>$ cd`  

`>$ cd ..`  

`>$ cd ../..`  

`>$ cd ~`  

`>$ cd -`  

__File system Organization__  

|Directory/Folder|Contents|
|---|---|
|/|Root|
|/bin|Binaries, Programs|
|/sbin|system binaries, system programs|
|/dev|Devices: hard drives, keyboard, mouse etc.|
|/etc|system configurations|
|/home|User home directories|
|/lib|libraries of code|
|/tmp|Temporary files|
|/var|various, mostly files the system uses|
|/usr|User programs, tools and libraries (not files)|
|/usr/bin|"|
|/usr/etc|"|
|/usr/lib|"|
|/usr/local|"|

__Root directory of the entire system hirerarchy__.  

|Directory|Hirerachy details|
|---|---|
|/bin/|Essential user command binaries|
|/boot/|static files of the boot loader|
|/dev/|device files|
|/etc/|Host specific system configuration|
|/home/|user home directories|
|/lib/|Essential shared iibraries and kernel modules|
|/media/|Mount point for a removable media|
|/mnt/|Mount point for a temporarily mounted files systems|
|/opt/|Add on application software package|
|/sbin/|System binaries|
|/srv/|Data for services provided by this system|
|/tmp/|temporary files|
|/usr/|(MULTI-) USER UTILIES AND APPLICATIONS Required directories: __BIN,INCLUDE,LIB,LOCAL,SBIN,SHARE__|
|/var/|variables files|
|/root/|Home directory for the root user|
|/proc/|Virtual file system documenting kernel and process status as textfiles|

__Working with files and directories__
__Naming files__
- Maximum of 255 characters.  
- Avoid `/\*&%?$|^~<>` and most other symbols.  
- Use A-Z,a-z,0-9,period,underscore,hyphen.  
- Typically lowercase.  
- "MyFile" and "myfile" would be different.  
- Underscores are better than spaces.  
  - Escape spaces with `\`.  
  - User quotes around names with spaces.  
- File endings (.txt, .png, .html, etc) not required but helpful.  
  - Differentiates files from commands and directories.  

__Creating files__  
- Primary techniques to create fiies.  
  - Unix text editors.  
  - Direct output to file
  
Touch command.  

`$touch file_name`  

This will create an empty file.  

__Unix test editors__  
- ed (Edit text - earlier unix editor, not user friendly)  
- vi (visual editing mode), vim (vi improved)  
- GNU Emacs (editor macros)  
  - Macros to automate work, swiss army knife.  
- pico (pine compose), nano (1000x larger than pico)  
- gedit
- sublime
- atom

__Reading files__  
- cat 
  - concatenate.  
- more
  - Paginated output.  
- less
  - Backward scrolling  
  - Better memory use  
  - less > more  
less -M  
less -N  

__Reading portion of files__  
- head  
  - Displays line from beginning of a file.  
- tail  
  - Displays ine from end of a file.  
- tail -f  
  - "follow" tail of a line.
  
__Creating directories__  

`$mkdir "directory/foldername"`  

`$mkdir -P dir/dir1/dir2`  

`$mkdir -vp dir/dir1/dir2`  

__Moving renaming files or directory__  

`$mv file1.txt file2.txt`  

`$mv file1.txt ../newfile.txt`  

`$mv file1.txt ..`  

mv option  

|Option|Description|
|---|---|
|-n|no overwriting|
|-f|force overwriting|
|-i|interactive overwriting, ask me|
|-v|verbose|

__Copying files and directories__  

`$cp text_file.txt file.txt`  

cp option  

|Option|Description|
|---|---|
|-n|no overwriting|
|-f|force overwriting|
|-i|interactive overwriting, ask me|
|-v|verbose|

`$cp -R directory directory`  

__Deleting files and directories__  

`$rm file`  

`$rmdir directoryname`  

`$rm -R directoryname`  

- rm  
  - only remove files  
- rmdir  
  - only removes non empty directories  
- rm -R  
  - Removes files and folders recursively  
  - By default, doesn't care if directories are empty  
  
__Hard links__  
- ln file to link hardlink.  
- Reference a file in the file system.  
- Do not break if file is moved.  
- Do not break if file is deleted.  

`$ln source destination`  

__Symbolic link__  
- "Sym link"
- ln -s fileto link sym link  
- Reference a filepath or a directory path.  
- Break if file is moved.  
- Break if file is deleted.  

__Searching for files and directories__  

find path expression   

`$find ~/Documents -name "some.jpg"`

__wildcard characters__  

|wildcard|characters|
|---|---|
|`*`|zero or more characters|
|`?`|any one character|
|`[]`|any character in the brackets|

`$find ~ -name *.plist -and -not-path *QuickPath*`  

__Ownership and permissions__  

`$whoami`  

`$echo $HOME`  

__Unix groups__  

`$groups`  

__File and directory ownership__  

`$chown user:group file.txt`  

`$chown user file.txt`  

`$chown :group file.txt`  

`$chgrp file.txt`  

`$chown -R user:group file.txt`  

__File and directory permission__  

||User|group|other|
|---|---|---|---|
|read(r)|yes|yes|yes|
|write(w)|yes|yes|no|
|execute(x)|yes|no|no|
||rwx|rw|r|

__Setting permissions using alpha notation__  

`$chmod mode filename`  

Examples  

`$chmod ugo=rwx filename`  

`$chmod u=rwx,g=rw,o=r filename`  

`$chmod ug+w filename`  

`$chmod o-w filename`  

`$chmod ugo+rw filename`  

`$chmod a+rw filename`  

`$chmod -R g+w foldername`  

`$chmod g+w foldername`  

__Setting permissions using octal notation__  

||user|group|other|
|---|---|---|---|
|Read(r)|4|4|4|
|Write(w)|2|2|0|
|execute|1|0|0|

`$chmod 777 filename`  

`$chmod 764 fiename`  

`$chmod 755 filename`  

`$chmod 000 fiename`  

r=4, w=2, x=1  

__The root user__  

- Super user account that can do anything on the system  
- Root user is disabled by default in macosx  
- Why talk about it ?
  - Import Unix concept.  
  - May read or hear references to "root".  
  - Remote Unix servers usually have the root user enabled.  
  - Important when discussing sudo.  
  
__Sudoers__  

sudo -> subsutitute user and do.  
sudo -u  
sudo -k (This will expire sudo)  
cat /etc/sudoers  

__Commands and programs__  

__Command basics__  

`$whereis`  

`$which`  

`$whatis`  

- command options: -v, --version, --help  
- exit: q,x,ctrl+q,ctrl+x, or esc.  
- force quit: control+c  
- semicolons between commands  
- whereis, which, whatis  

__The path variable__  

`$echo $PATH` (This is for temporary path)  

`$PATH=/usr/bin:/bin:/usr/sbin:.`  

`$echo PATH`  

__System information commands__  

`$uptime`  
`$users`  
`$who`  
`$uname`  
`$uname -mnrsvp`  
`$uname -ap`  
`$hostname`  
`$domainname`  

__Disk information command__  

`$df`  
`$df -h`  
`$df -H`  
`$du`  
`$du -h directory`  
`$du -ah directory`  
`$du -hd 1 directory`  
`$du -hd 0 directory`  

### ss command

The ss command is the replacement of the netstat command.

```
[root@mastersftp ssh]# ss -ltnup 'sport = :22'
Netid    State     Recv-Q    Send-Q       Local Address:Port         Peer Address:Port    Process
tcp      LISTEN    0         128                0.0.0.0:22                0.0.0.0:*        users:(("sshd",pid=36496,fd=5))
tcp      LISTEN    0         128                   [::]:22                   [::]:*        users:(("sshd",pid=36496,fd=7))
```

### fuser command

```shell
[root@mastersftp ssh]# fuser 22/tcp
22/tcp:               4003  4007  4020  4025 36496
[root@mastersftp ssh]# fuser -v 22/tcp
                     USER        PID ACCESS COMMAND
22/tcp:              root       4003 F.... sshd
                     root       4007 F.... sshd
                     root       4020 F.... sshd
                     root       4025 F.... sshd
                     root      36496 F.... sshd
[root@mastersftp ssh]# fuser -v 22/tcp 68/udp
                     USER        PID ACCESS COMMAND
22/tcp:              root       4003 F.... sshd
                     root       4007 F.... sshd
                     root       4020 F.... sshd
                     root       4025 F.... sshd
                     root      36496 F.... sshd
68/udp:              root       2834 F.... NetworkManager

```

### lsof command

```shell
[root@mastersftp ssh]# lsof -i :22
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
sshd     4003 root    5u  IPv4  32481      0t0  TCP mastersftp:ssh->193.16.33.1:52173 (ESTABLISHED)
sshd     4007 root    5u  IPv4  32597      0t0  TCP mastersftp:ssh->193.16.33.1:52174 (ESTABLISHED)
sshd     4020 root    5u  IPv4  32481      0t0  TCP mastersftp:ssh->193.16.33.1:52173 (ESTABLISHED)
sshd     4025 root    5u  IPv4  32597      0t0  TCP mastersftp:ssh->193.16.33.1:52174 (ESTABLISHED)
sshd    36496 root    5u  IPv4  67425      0t0  TCP *:ssh (LISTEN)
sshd    36496 root    7u  IPv6  67427      0t0  TCP *:ssh (LISTEN)
[root@mastersftp ssh]# lsof -i :22 -i :68
COMMAND     PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
NetworkMa  2834 root   24u  IPv4  29328      0t0  UDP mastersftp:bootpc->_gateway:bootps
sshd       4003 root    5u  IPv4  32481      0t0  TCP mastersftp:ssh->193.16.33.1:52173 (ESTABLISHED)
sshd       4007 root    5u  IPv4  32597      0t0  TCP mastersftp:ssh->193.16.33.1:52174 (ESTABLISHED)
sshd       4020 root    5u  IPv4  32481      0t0  TCP mastersftp:ssh->193.16.33.1:52173 (ESTABLISHED)
sshd       4025 root    5u  IPv4  32597      0t0  TCP mastersftp:ssh->193.16.33.1:52174 (ESTABLISHED)
sshd      36496 root    5u  IPv4  67425      0t0  TCP *:ssh (LISTEN)
sshd      36496 root    7u  IPv6  67427      0t0  TCP *:ssh (LISTEN)
```

### netstat commmand


```shell
root# netstat -ltnup         
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.1:17600         0.0.0.0:*               LISTEN      1293/dropbox        
tcp        0      0 127.0.0.1:17603         0.0.0.0:*               LISTEN      1293/dropbox   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      575/sshd  
tcp        0      0 127.0.0.1:9393          0.0.0.0:*               LISTEN      900/perl  
tcp        0      0 :::80                   :::*                    LISTEN      9583/docker-proxy 
tcp        0      0 :::443                  :::*                    LISTEN      9571/docker-proxy
udp        0      0 0.0.0.0:68              0.0.0.0:*                           8822/dhcpcd
```

```
l – show only listening sockets
t – show TCP connections
n – show addresses in a numerical form
u – show UDP connections
p – show process id/program name
```

```
netstat -ltnup | grep ':22'
```

__Viewing processes__  

`$ps`  

`$ps -a`  

`$ps a`  

`$ps -aux`  

__EXAMPLES__
To see every process on the system using standard syntax:  

          `$ps -e`  
          
          `$ps -ef`  
          
          `$ps -eF`  
          
          `$ps -ely`  

To see every process on the system using BSD syntax:  

          `$ps ax`  
          
          `$ps axu`  

To print a process tree:  

          `$ps -ejH`  
          
          `$ps axjf`  

To get info about threads:  

          `$ps -eLf`  
          
          `$ps axms`  

To get security info:  

          `$ps -eo euser,ruser,suser,fuser,f,comm,label`  
          
          `$ps axZ`  
          
          `$ps -eM`  

To see every process running as root  
       (real & effective ID) in user format:  
       
          `$ps -U root -u root u`  

To see every process with a user-defined format:  

          `$ps -eo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm`  
          
          `$ps axo stat,euid,ruid,tty,tpgid,sess,pgrp,ppid,pid,pcpu,comm`  
          
          `$ps -Ao pid,tt,user,fname,tmout,f,wchan`  

Print only the process IDs of syslogd:  

          `$ps -C syslogd -o pid=`  

Print only the name of PID 42:  

          `$ps -q 42 -o comm=`  

Print process with headers

```
printf "UID\tPID\tPPID\tC\tSTIME\tTTY\tTIME\t\tCMD\n"
ps -ef | grep ssh | awk 'BEGIN{OFS="\t"}{ print $1,$2,$3,$4,$5,$6,$7,$8 }'
```

__Monitoring process___

`$top` (q to quit)  

`$top -n 10 -o cpu -s 3 -u username`  

press `?` for help.  

Linux has more interactive commands than unix in top program.  

__Stopping processes__  

`$ps aux`  

`$kill PID`  

`$kill -9 PID`  

### Command to kill all the process with user centos

```shell
pkill -u centos
```

__Text file helper__  

- wc 
  - word count
- sort
  - sort lines
- uniq
  - filter in/out repeated lines
- head
- tail

By default sort treat A,a are different to correct use below code.  

`$sort -f`  

`$sort -r`  

`$sort -u` (sorted & unique)  

`$uniq`  

`$uniq -d` (duplicate line)  

`$uniq -u` (unduplicated line)  

__Utility Program__  

- cal/ncal
  - calender  
- bc  
  - calculator  
- expr  
  - expression evaluator  
- units  
  - unit conversion  
  
`$cal 12 2020`  

`$cal -y 2000`

`$cal -y`  

`$ncal`  

`$bc`  

```
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'. 
100/9
11
scale=1
100/9
11.1
scale=10
100/9
11.1111111111
```

```
[bhemanth@localhost ~]$ expr 1+1
1+1
[bhemanth@localhost ~]$ expr 1 + 1
2
[bhemanth@localhost ~]$ expr 122 * 3344
expr: syntax error
[bhemanth@localhost ~]$ expr 122 \* 3344
407968
```

__Units__

```
[bhemanth@localhost ~]$ units
Currency exchange rates from 2012-10-24 
2565 units, 85 prefixes, 66 nonlinear units

You have: 1 foot
You want: meters
	* 0.3048
	/ 3.2808399
You have: 1 inch
You want: centimeters
	* 2.54
	/ 0.39370079
You have: deg F
You want: deg C
conformability error
	0.017453293 A^2 radian s^4 / kg m^2
	0.017453293 A radian s
You have: ^C
```

```
[bhemanth@localhost ~]$ units '2 litres' 'quarts'
Currency exchange rates from 2012-10-24 
	* 2.1133764
	/ 0.47317647
[bhemanth@localhost ~]$ units '1 inch' 'centimeters'
Currency exchange rates from 2012-10-24 
	* 2.54
	/ 0.39370079
```

__Using the command history__  

`$cat .bash_history`  

`$history`  

`$ !1` (to execute history command !command number)  

`$!-2`  

`$!expr` (This shows exr recent command from history)  

`$!!` (Previous Command)  

`$history -d 24`  

`$history -c`  

|CMD|Description|
|---|---|
|!3|References history command #3|
|!-2|References command which was 2 comands back|
|!cat|Reference most recently command beginning with "cat"|
|!!|References previous command|
|!$|Reference previous command arguments|

__Directing input and output__  

__Standart input and output__
- standard input  
  - stdin  
  - keyboard  
  - /dev/stdin  
- standard output  
  - stdout  
  - text terminal
  - /dev/stdout  
  
__Directory output to a file__
  
`$cat file1.txt file2.txt > newfile.txt`  

__Appending to a file__

`$cat file1.txt file2.txt >> newfile.txt`  

__Directing input from a file__  

```
[bhemanth@localhost Downloads]$ cat !$
cat fruit.txt
apple
pineapple
orange
mango
pears
kiwi
grapes
lichi
```
```
[bhemanth@localhost Downloads]$ sort < fruit.txt 
apple
grapes
kiwi
lichi
mango
orange
pears
pineapple
```
```
[bhemanth@localhost Downloads]$ wc < lorem_ipsum.txt 
  19  916 6126
```

```
[bhemanth@localhost Downloads]$ echo "(3 * 4) + (11 * 37)" > calculation.txt
[bhemanth@localhost Downloads]$ bc < calculation.txt 
419
```

`sort < fruit.txt > sorted_fruit.txt`  

`(sort < fruit.txt) > sorted_fruit.txt`

__Pipling output to input__  

| - this a key to pipe

`$echo "Hello world" | wc`  

`$echo "(3 * 4) + (11 * 37)" | bc`  

__Suppressing output__
- /dev/null
  - "null devices", "bit bucket", "blank hole"  
  - Similar to special files /dev/stdin & /dev/stdout  
  - Unix discards any data sent there  
  
`$ls -la > /dev/null`  

`$echo < /dev/null`  

__Configuring your working environment__


Below are the profiles.  

- /etc/profile
- ~/.bash_profile
- ~/.bash_logout
- ~/.bashrc
- ~/.profile
- ~/.login
  - . means configuration file.  
  
__Bash Shells Login Vs Non Login__  

Add to ~/.bash_profile.

```
if [ -f ~/.bashrc ];
then 
   source ~/.bashrc
fi
```  
- .bashrc - non login profile  
- .bash_profile - login profile  

__Setting command aliases__  

`$alias ll='ls -la'`  

`$unalias ll'`  

__Setting and exporting environment variable__  

`$echo $SHELL`  

`$MYNAME='HEMANTH'` 

`$echo $MYNAME`  

__Setting the PATH Variables__  

`$echo $PATH`  

`$PATH=''` 

`$PATH="/usr/local/bin:$PATH"`  

__Configuring history with variables__  

## Command to clear history.  

`$history -c`  

Filename: .bashrc

```
export HISTSIZE=10000 #500 is default
export HISTFIZESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p'
export HISTCONTROL=ignoreboth #Ignorre dups:Ignore space
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll"
```

__Customizing the command prompt__

`$PS1="-->"`  

`$PS1="\u"`

|code|command prompt output|
|---|---|
|`\u`|username|
|`\s`|current shell|
|`\w`|current working directory|
|`\W`|base name of current working directory|
|`\d`|date in "weekday monthday"|
|`\D{format}`|date in strftime format ("%Y-%m-%d")|
|`\A`|time in 24hr HH:MM|
|`\t`|time in 24hr HH:MM:SS|
|`\@`|time in 12hrs HH:MM AM/PM|
|`\T`|time in 12hrs HH:MM:SS|
|`\H`|hostname|
|`\h`|hostname upto first "."|
|`\!`|history number of this command|
|`\$`|when UID is 0 (root), a "#", otherwise a "$"|
|`\\`|a literal backslash|

`$PS1="\D{%Y-%m-%d}\@>"` 

__Logout file__  

File: .bash_logout  
echo "See you later"  

__Unix power tools__  

__Grep searching for matching expressions__  

- grep
  - output all lines matching a regular expression.  
  - Global Regular Expression Print.  
    - In unix ed editor: g/re/p  
    
- Regular Expression:
  - Expression for describing a pattern in text strings  
  - "regex" for short.  
  
- Useful in other contexts  
  - Most programming languages.  
  - Many text editors.  

Grep Command to search  

```
[bhemanth@localhost Downloads]$ grep apple fruit.txt 
apple
pineapple
```
Grep Command to search with ignore match    
```
[bhemanth@localhost Downloads]$ grep -i Apple fruit.txt 
apple
pineapple
```
Grep command to search whole word  
```
[bhemanth@localhost Downloads]$ grep -w apple fruit.txt 
apple
```
Grep command to search with not matching  
```
[bhemanth@localhost Downloads]$ grep -v apple fruit.txt 
orange
mango
pears
kiwi
grapes
lichi
```
Grep command to show with number  
```
[bhemanth@localhost Downloads]$ grep -n apple fruit.txt 
1:apple
2:pineapple
```
Grep command to count matching word  
```
[bhemanth@localhost Downloads]$ grep -c apple fruit.txt 
2
```
Grep command to count maching word  
```
[bhemanth@localhost Downloads]$ grep -c lorem lorem_ipsum.txt 
4
```

__Grep multiple files, other input__  

```
$ grep apple !$
grep apple /dir1/dir2/dir3/
grep: /dir1/dir2/dir3/: Is a directory
```
```
$ grep -R apple /dir1/dir2/dir3/
/dir1/dir2/dir3/fruit.txt:apple
/dir1/dir2/dir3/fruit.txt:pineapple
```
```
$ grep -Rn apple /dir1/dir2/dir3/
/dir1/dir2/dir3/fruit.txt:1:apple
/dir1/dir2/dir3/fruit.txt:2:pineapple
```
```
[bhemanth@localhost Example]$ tree
.
└── dir1
    └── dir2
        └── dir3
            └── fruit.txt

3 directories, 1 file
```
```
$ grep -Rh apple .
apple
pineapple
```
```
$ grep -Rl apple .
./dir1/dir2/dir3/fruit.txt
```
```
$ grep -RL apple .
```
```
$ ls *.txt
fruit.txt  lorem_ipsum.txt
```
```
$ ls *fruit.txt
fruit.txt
```
```
$ grep apple *fruit.txt
apple
pineapple
```
```
$ cat fruit.txt | grep apple
apple
pineapple
```
```
$ ps aux | grep gnome-terminal
bhemanth 21882  0.0  0.2 757176 28932 ?        Sl   13:28   0:09 /usr/libexec/gnome-terminal-server
bhemanth 30591  0.0  0.0 112720   984 pts/0    S+   17:01   0:00 grep --color=auto gnome-terminal
```
```
$ history | grep docker | less
```

__Grep coloring metched text__

```
grep lorem lorem_ipsum.txt 
```
```
grep --color=auto lorem lorem_ipsum.txt 
```

File: .bashrc
```
export GREP_COLOR="34;47"
export GREP_OPTIONS="--color=auto"
```

|Attributes|Text color|Background|
|---|---|---|
|0 reset all|30 black|40 black|
|1 bright|31 red|41 red|
|2 dim|32 green|42 green|
||33 yellow|43 yellow|
|4 underscore|34 blue|44 blue|
|5 blink|35 purple|45 purple|
||36 cyan|46 cyan|
|7 reverse|37 white|47 white|

## Introduction to regular expressions

```
$ grep 'apple' fruit.txt 
apple
pineapple
```
```
$ grep 'a..le' fruit.txt 
apple
pineapple
```
```
$ grep '.a.a.a' fruit.txt 
banana
```
```
$ grep 'ea' fruit.txt 
pineapple
pears
```
```
$ grep 'ea[cp]' fruit.txt 
pineapple
```

__Regular expressionns basic syntax__  

|Regex|Meaning|Example|
|---|---|---|
|`.`|wild card, anyone character except line breaks|gre.t|
|`[]`|character set, anyone character listed inside[]|gr[ea]y|
|`[^]`|Negative character set, anyone character not listed inside[]|[^aeiou]|
|`-`|Range indicator (when inside a character set)|[A-Za-z0-9]|
|`*`|Preceding element can occur zero or more times|file_\*names|
|`+`|Preceding element can occur one or more times\*|gro+ve|
|`?`|Preceding element can occur zero or one time\*|colou?r|
|\||Alternation, OR operator\*|(jpg\|gif\|png)|
|`^`|start of line anchor| ^Hello|
|`$`|end of line anchor|world$|
|`\`|Escape the next character (`\+` is literal `+` character)|image\\.jpg|
|`\d`|Any digit|20\d\d-06-09|
|`\D`|Anything not a digit|^\D+|
|`\w`|Anyword character (alphanumeric+underscore)|\w+\_export\\.s/|
|`\W`|any not a word character|\w+\W\w+|
|`\s`|whitespace (space, tab, line break)|\w+\s\w+|

\* Extended Regular Expression Syntax.  

__Regular  Expression character classes__

|class|Represents|
|---|---|
|[:alpha:]|Alphabetic characters|
|[:digit:]|Numeric characters|
|[:alnum:]|Alphanumeric characters|
|[:lower:]|lower case alphabetic character|
|[:upper:]|upper case alphabetic character|
|[:punct:]|Punctuation character|
|[:space:]|space characters(space,tab,newline)|
|[:blank:]|whitespace character|
|[:print:]|printable character, including space|
|[:graph:]|printable character, not including space|
|[:cntrl:]|control characters (non-printing)|
|[:xdigit:]|Hexadecimal characters (0-9,A-F,a-f)|

__Using regular expressions with grep__

```
$ grep '^p' fruit.txt
pineapple
peanut
pears
```
```
$ grep 'berry$' fruit.txt
blueberry
canberry
```
```
$ echo 'berry bush' | grep 'berry$'
```
```
$ echo 'AaBbCcDdEe' | grep --color [:upper:]
grep: character class syntax is [[:space:]], not [:space:]
```
```
$ echo 'AaBbCcDdEe' | grep --color '[[:upper:]]'
AaBbCcDdEe
```
```
$ echo 'a;b:c.d^e#' | grep --color '[[:punct:]]'
a;b:c.d^e#
```
```
$ grep 'ap*le' *fruit.txt
apple
pineapple
```
```
$ grep 'ap+le' *fruit.txt
$ grep -E 'ap+le' *fruit.txt
apple
pineapple
```
```
$ grep 'apple|pear' *fruit.txt
$ grep -E 'apple|pear' *fruit.txt
apple
pineapple
pears
```

__tr translating characters__  

```
$ echo 'a,b,c' | tr ',' '-'
a-b-c
```
```
$ echo '142523436542' | tr '123456' 'EBGDAE'
EDBABGDGEADB
```
```
$ echo 'This is ROT-13 encrypted' | tr 'A-Za-z' 'N-ZA-Mn-za-m'
Guvf vf EBG-13 rapelcgrq
```
```
$ echo 'already daytime' | tr 'day' 'night'
ilreing nigtime
```
```
$ echo "abc1233d4ece567f" | tr 'bedf5-9' 'x'
axc1233x4xcxxxxx
```
```
$ echo "abc1233d4ece567f" | tr 'bedf5-9' 'xz'
axc1233z4zczzzzz
```
```
$ echo "abc1233d4ece567f" | tr 'bedf5-9' 'xzzz'
axc1233z4zczzzz
```
```
$ cat people.txt
Kevin
Lynda
Bob
Susan
Larry
Anne
Claire
John
```
```
$ tr 'A-Z' 'a-z' < people.txt 
kevin
lynda
bob
susan
larry
anne
claire
john
```
```
$ tr '[:upper:]' '[:lower:]' < people.txt 
kevin
lynda
bob
susan
larry
anne
claire
john
```
```
$ tr ',' '\t' < us_presidents.csv > us_presidents.tsv 
$ tr ',' ';' < us_presidents.csv > us_presidents.dsv 
```
__tr deleting & squeezing characters__

tr option  

|Option|Description|
|---|---|
|-d|Delete characters in listed set|
|-s|Squeeze repeats in listed set|
|-c|Use complimentary set|
|-dc|Delete characters not in listed set|
|-sc|Squeeze characters not in listed set|

```
$ echo "abc1233d4ece567f" | tr -d [:digit:]
abcdecef
```
```
$ echo "abc1233d4ece567f" | tr -dc [:digit:]
12334567
```
```
$ echo "abc1233d4ece567f" | tr -s [:digit:]
abc123d4ece567f
```
```
$ echo "abc1233d4ece567f" | tr -sc [:digit:]
abc1233d4ece567f
```
```
$ echo "abc1233d4ece567f" | tr -ds [:digit:]
tr: missing operand after ‘[:digit:]’
Two strings must be given when both deleting and squeezing repeats.
Try 'tr --help' for more information.

$ echo "abc1233d4ece567f" | tr -ds [:digit:] [:alpha:]
abcdecef
```
```
$ echo "abc1233d4ece567f" | tr -dsc [:digit:] [:digit:]
1234567
```
From above code c is applied to only d.  

__Remove non-printable charater from file1__  

```
tr -dc [:print:] < new_file.txt > file2.txt
```

__Remove surplus carriage return & end of file character__  

```
tr -d '\015\032' < new_file.txt > unix_file
```

__Remove double space or three space or multiple space from file__

```
tr -s ' ' < file1 > file2
```

__Sed Stream editor__  

sed 's/a/b'

|option|description|
|---|---|
|s:|substitution|
|a:|search string|
|b:|replacement string|

```
$ echo 'upstream' | sed 's/up/down/'
downstream
```
```
$ echo 'upstream and upward' | sed 's/up/down/g'
downstream and downward
```
```
$ echo 'upstream and upward' | sed 's:up:down:g'
downstream and downward
```
```
$ sed 's/pear/mango/' fruit.txt 
mango
raspberry
banana
peach
apple
pineapple
blueberry
papaya
strawberry
strawberry
plum
mango
apple
```
```
sed 's/pear/mango/' fruit.txt > mango_fruits.txt
```
```
$ sed 's/a/x/' fruit.txt 
pexr
rxspberry
bxnana
pexch
xpple
pinexpple
blueberry
pxpaya
strxwberry
strxwberry
plum
pexr
xpple
```
```
$ sed 's/a/x/g' fruit.txt 
pexr
rxspberry
bxnxnx
pexch
xpple
pinexpple
blueberry
pxpxyx
strxwberry
strxwberry
plum
pexr
xpple
```
```
$ echo 'During daytime we have sunlight' | sed -e 's/day/night/' -e 's/sun/moon/'
During nighttime we have moonlight
```

__Sed regular expressions & back references__  

```
echo "who needs vowels ?" | sed 's/[aeiou]/_/g'
wh_ n__ds v_w_ls ?
```
```
$ echo "who needs vowels ?" | sed 's/[aeiou]*/_/g'
_w_h_ _n_d_s_ _v_w_l_s_ _?_
```
```
$ echo "who needs vowels ?" | sed 's/[aeiou]+/_/g'
who needs vowels ?
```
```
$ echo "who needs vowels ?" | sed -E 's/[aeiou]+/_/g'
wh_ n_ds v_w_ls ?
```
```
$ sed 's/^p/P/g' fruit.txt 
Pear
raspberry
banana
Peach
apple
Pineapple
blueberry
Papaya
strawberry
strawberry
Plum
Pear
apple
```
```
$ sed 's/^p/M/g' fruit.txt 
Mear
raspberry
banana
Meach
apple
Mineapple
blueberry
Mapaya
strawberry
strawberry
Mlum
Mear
apple
```
```
$ sed 's/^/>/g' fruit.txt 
>pear
>raspberry
>banana
>peach
>apple
>pineapple
>blueberry
>papaya
>strawberry
>strawberry
>plum
>pear
>apple
```
```
$ sed 's/^/ /g' fruit.txt 
 pear
 raspberry
 banana
 peach
 apple
 pineapple
 blueberry
 papaya
 strawberry
 strawberry
 plum
 pear
 apple
```
```
$ sed 's/^/\t/g' fruit.txt 
	pear
	raspberry
	banana
	peach
	apple
	pineapple
	blueberry
	papaya
	strawberry
	strawberry
	plum
	pear
	apple
```
```
$ sed -E 's/<[]>//g' homepage.html clear
sed: -e expression #1, char 9: unterminated `s' command
```
```
$ sed -E 's/<[]>//g' homepage.html
sed: -e expression #1, char 9: unterminated `s' command
[bhemanth@localhost Example]$ sed -E 's/<[^<>]>//g' homepage.html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
  <head>
    <title>Widget Corp. | Homepage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="author" content="Kevin Skoglund, Nova Fabrica" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/styles/main.css" type="text/css" />
  </head>
  <body>
    <div id="header">
      <div id="navigation">
        <ul>
          <li class="home">
            <a href="/homepage.html"><span>Widget Corp.</a>
          </li>
          <li class="products">
            <a href="/products.html">Products</a>
          </li>
          <li class="contact">
            <a href="/contact.html">Contact</a>
          </li>
        </ul>
      </div>
    </div>
    <div id="content">
      <h2>Welcome to Widget Corp.</h2>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar, mauris sit amet interdum feugiat, nibh eros elementum turpis, ut lobortis lorem neque nec dui. Fusce convallis ipsum vitae nunc sodales pharetra. Aliquam ac ipsum quam. Phasellus imperdiet, purus facilisis egestas porta, libero augue sagittis magna, in feugiat felis nibh sit amet leo. Sed malesuada scelerisque adipiscing. Nulla semper erat eu dui posuere vestibulum. Fusce egestas felis mauris. Donec rhoncus, turpis eu blandit mollis, mi erat semper turpis, vel commodo tortor mi sed nulla. Quisque euismod blandit ante eget posuere. Nulla at massa id est pulvinar sodales.</p>
    </div>
    <div id="footer">
      &copy; Widget Corp.
    </div>
  </body>
</html>
```
```
$ echo 'daytime' | sed 's/(...)time/daylight/'
daytime
$ echo 'daytime' | sed 's/\(...\)time/daylight/'
daylight
```
```
$ echo 'daytime' | sed 's/\(...\)time/\1light/'
daylight
```
```
$ echo "Dan stevens" | sed -E 's/([A-Za-z]+)([A-Za-z]+)/\2 \1/'
n Da stevens
```
```
$ sed -E 's/(apple|pear|plum|peach)/\1 tree/' fruit.txt 
pear tree
raspberry
banana
peach tree
apple tree
pineapple tree
blueberry
papaya
strawberry
strawberry
plum tree
pear tree
apple tree
```
__Cut cutting select text portions__  

```
$ cat dir_content.txt 
total 144
drwxr-xr-x  14 kevin  staff   476B Feb 12 14:14 .
drwxr-xr-x+ 16 kevin  staff   544B Feb 12 14:00 ..
-rw-r--r--@  1 kevin  staff   6.0K Feb  6 14:49 .DS_Store
-rw-r--r--   1 kevin  staff     0B Feb 12 14:14 dir_content.txt
-rw-r--r--   1 kevin  staff    99B Feb 11 20:11 fruit.txt
-rw-r--r--   1 kevin  staff    12B Feb 12 14:14 hello_world.txt
-rw-r--r--@  1 kevin  staff    35K Feb  5 22:26 lorem_ipsum.txt
-rw-r--r--   1 kevin  staff    55B Feb  5 22:51 new_file.txt
-rw-r--r--   1 kevin  staff    81B Feb  5 23:58 newer_file.txt
-rw-r--r--   1 kevin  staff    17B Feb  5 23:11 overwrite_test2.txt
-rw-r--r--   1 kevin  staff     0B Feb 10 15:41 ownership.txt
-rw-r--r--@  1 kevin  staff    81B Feb  5 15:11 short_file.txt
-rw-r--r--   1 kevin  staff    99B Feb 12 14:13 sorted_fruit.txt
drwxrwxr-x   3 kevin  staff   102B Feb  5 23:39 test1
```
```
$ cut -c 2-10 dir_content.txt
otal 144
rwxr-xr-x
rwxr-xr-x
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rw-r--r--
rwxrwxr-x
```
```
$ echo '14 kevin staff' | wc
      1       3      15
```
```
$ cut -c 2-10,30- dir_content.txt
otal 144
rwxr-xr-x 476B Feb 12 14:14 .
rwxr-xr-x 544B Feb 12 14:00 ..
rw-r--r-- 6.0K Feb  6 14:49 .DS_Store
rw-r--r--   0B Feb 12 14:14 dir_content.txt
rw-r--r--  99B Feb 11 20:11 fruit.txt
rw-r--r--  12B Feb 12 14:14 hello_world.txt
rw-r--r--  35K Feb  5 22:26 lorem_ipsum.txt
rw-r--r--  55B Feb  5 22:51 new_file.txt
rw-r--r--  81B Feb  5 23:58 newer_file.txt
rw-r--r--  17B Feb  5 23:11 overwrite_test2.txt
rw-r--r--   0B Feb 10 15:41 ownership.txt
rw-r--r--  81B Feb  5 15:11 short_file.txt
rw-r--r--  99B Feb 12 14:13 sorted_fruit.txt
rwxrwxr-x 102B Feb  5 23:39 test1
```
```
$ cut -c 2-10,30-35 dir_content.txt
otal 144
rwxr-xr-x 476B 
rwxr-xr-x 544B 
rw-r--r-- 6.0K 
rw-r--r--   0B 
rw-r--r--  99B 
rw-r--r--  12B 
rw-r--r--  35K 
rw-r--r--  55B 
rw-r--r--  81B 
rw-r--r--  17B 
rw-r--r--   0B 
rw-r--r--  81B 
rw-r--r--  99B 
rwxrwxr-x 102B 
```
```
$ cut -c 2-10,30-35,40- dir_content.txt
otal 144
rwxr-xr-x 476B 12 14:14 .
rwxr-xr-x 544B 12 14:00 ..
rw-r--r-- 6.0K  6 14:49 .DS_Store
rw-r--r--   0B 12 14:14 dir_content.txt
rw-r--r--  99B 11 20:11 fruit.txt
rw-r--r--  12B 12 14:14 hello_world.txt
rw-r--r--  35K  5 22:26 lorem_ipsum.txt
rw-r--r--  55B  5 22:51 new_file.txt
rw-r--r--  81B  5 23:58 newer_file.txt
rw-r--r--  17B  5 23:11 overwrite_test2.txt
rw-r--r--   0B 10 15:41 ownership.txt
rw-r--r--  81B  5 15:11 short_file.txt
rw-r--r--  99B 12 14:13 sorted_fruit.txt
rwxrwxr-x 102B  5 23:39 test1
```
```
ps aux | cut -c 11-15,72-
ps aux | less
```
```
cut -f 2,6 us_presidents.tsv 
```
```
 cut -f 2,6 us_presidents.csv 
 cut -f 2,6 -d "," us_presidents.csv 
```
```
$cat dir_content.txt | cut -c 185.193 --output-delimiter=' '
```
__GZIP Commands__

Command to zip the file in ascii format
```
$gzip -a filename
```

Command to decompress the file
```
$gzip -d filename.gz
```

Command to unzip the file
```
$gunzip filename.gz
```

Command to grep on gzip file
```
$zgrep 'ABC' filename.gz | cut -c 185,193 --output-delimiter=' '
```
__Diff compaing files__  

```
$ history | tail -n 5
 3591  Jun 01 09:41 pm history | tail -n 10
 3592  Jun 01 09:56 pm cut -f 2,6 us_presidents.tsv 
 3593  Jun 01 09:56 pm cut -f 2,6 us_presidents.csv 
 3594  Jun 01 09:56 pm cut -f 2,6 -d "," us_presidents.csv 
 3595  Jun 01 09:57 pm history | tail -n 5
```
```
$ cat original_file.txt 
line 1:  delete delete delete delete delete delete
line 2:  delete delete delete delete delete delete
line 3:  delete delete delete delete delete delete
line 4:  
line 5:  change change change change change change
line 6:  change change change change change change
line 7:  change change change change change change
line 8:  
line 9:  append append append append append append
line 10: append append append append append append
line 11: append append append append append append
```
```
$ cat revised_file.txt 
line 1:  delete delete delete delete delete delete
line 3:  delete delete delete delete delete delete
line 4:  
line 5:  change change change change change change
line 6:  change        change        change       
line 7:  change change change change change change
line 8:  
line 9:  append append append append append append
line 10: append append append append append append
line 11: append append append append append append
line 12: append append append append append append
```
```
$ diff original_file.txt revised_file.txt 
2d1
< line 2:  delete delete delete delete delete delete
6c5
< line 6:  change change change change change change
---
> line 6:  change        change        change       
11a11
> line 12: append append append append append append
```

Here d means delete, c means changes, and a means append.  

__Diff comparison options__  

|Options|Description|
|---|---|
|-i|Case insensitive|
|-b|Ignore changes to blank characters|
|-w|Ignore all whitespaces|
|-B|Ignore blank lines|
|-r|recursively compare directories|
|-s|show identical files|

__Diff alternative formats__  

__diff output formats__

|option|description|
|---|---|
|-c|Copied context|
|-u|Unified context|
|-y|side by side|
|-q|only whether files differ|

```
$ diff -c original_file.txt revised_file.txt 
*** original_file.txt	2011-02-22 10:00:57.000000000 +0530
--- revised_file.txt	2011-02-22 10:02:46.000000000 +0530
***************
*** 1,11 ****
  line 1:  delete delete delete delete delete delete
- line 2:  delete delete delete delete delete delete
  line 3:  delete delete delete delete delete delete
  line 4:  
  line 5:  change change change change change change
! line 6:  change change change change change change
  line 7:  change change change change change change
  line 8:  
  line 9:  append append append append append append
  line 10: append append append append append append
  line 11: append append append append append append
--- 1,11 ----
  line 1:  delete delete delete delete delete delete
  line 3:  delete delete delete delete delete delete
  line 4:  
  line 5:  change change change change change change
! line 6:  change        change        change       
  line 7:  change change change change change change
  line 8:  
  line 9:  append append append append append append
  line 10: append append append append append append
  line 11: append append append append append append
+ line 12: append append append append append append
```
Here - means deleted, ! means changed, + means added or append.  

```
$ diff -y original_file.txt revised_file.txt 
line 1:  delete delete delete delete delete delete		line 1:  delete delete delete delete delete delete
line 2:  delete delete delete delete delete delete	      <
line 3:  delete delete delete delete delete delete		line 3:  delete delete delete delete delete delete
line 4:  							line 4:  
line 5:  change change change change change change		line 5:  change change change change change change
line 6:  change change change change change change	      |	line 6:  change        change        change       
line 7:  change change change change change change		line 7:  change change change change change change
line 8:  							line 8:  
line 9:  append append append append append append		line 9:  append append append append append append
line 10: append append append append append append		line 10: append append append append append append
line 11: append append append append append append		line 11: append append append append append append
							      >	line 12: append append append append append append
```
Here < means deleted, | means changed, > append or added.  

```
$ diff -u original_file.txt revised_file.txt 
--- original_file.txt	2011-02-22 10:00:57.000000000 +0530
+++ revised_file.txt	2011-02-22 10:02:46.000000000 +0530
@@ -1,11 +1,11 @@
 line 1:  delete delete delete delete delete delete
-line 2:  delete delete delete delete delete delete
 line 3:  delete delete delete delete delete delete
 line 4:  
 line 5:  change change change change change change
-line 6:  change change change change change change
+line 6:  change        change        change       
 line 7:  change change change change change change
 line 8:  
 line 9:  append append append append append append
 line 10: append append append append append append
 line 11: append append append append append append
+line 12: append append append append append append
```

Here - means delete, + means append.  

```
diff -u original_file.txt revised_file.txt | diffstat
 revised_file.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
```
```
diff -q original_file.txt revised_file.txt 
Files original_file.txt and revised_file.txt differ
```
```
$ diff -q original_file.txt original_file.txt 
$ diff -qs original_file.txt original_file.txt 
Files original_file.txt and original_file.txt are identical
```
__Difference between diff and cmp command__  

|diff|cmp|
|---|---|
|diff - compare files line by line|cmp - compare two files byte by byte|

## Cmp command  

```
$ cmp original_file.txt revised_file.txt
original_file.txt revised_file.txt differ: byte 57, line 2
```
## Xargs passing argument lists to commands

```
$ wc lorem_ipsum.txt 
  523  5289 36232 lorem_ipsum.txt
```

```
$ echo 'lorem_ipsum.txt' | wc
      1       1      16
```
__wordcount using xargs__
```
$ echo 'lorem_ipsum.txt' | xargs wc
  523  5289 36232 lorem_ipsum.txt
```
__command to check what is the parameter passed to wc__
```
$ echo 'lorem_ipsum.txt' | xargs -t wc
wc lorem_ipsum.txt 
  523  5289 36232 lorem_ipsum.txt
```
__command to check what is the parameter i.e. going to pass__
``` 
$ echo 'lorem_ipsum.txt' | xargs -t
echo lorem_ipsum.txt 
lorem_ipsum.txt
```
```
echo 'lorem_ipsum.txt us_presidents.csv' | xargs -t wc
wc lorem_ipsum.txt us_presidents.csv 
  523  5289 36232 lorem_ipsum.txt
   45   121  4309 us_presidents.csv
  568  5410 40541 total
```
```
$ echo 'lorem_ipsum.txt us_presidents.csv' | xargs -t n1 wc
n1 wc lorem_ipsum.txt us_presidents.csv 
xargs: n1: No such file or directory
```
```
echo 1 2 3 4 | xargs -n2
1 2
3 4
```
```
$ echo 1 2 3 4 | xargs -t -n2
echo 1 2 
1 2
echo 3 4 
3 4
```
```
$ echo 1 2 3 4 5 6 | xargs -n3
1 2 3
4 5 6
```
```
$ echo 1 2 3 4 5 6 7 8 9| xargs -n3
1 2 3
4 5 6
7 8 9
```
```
$ ls | xargs -n 3 echo
```
```
$ echo 1 2 3 4 | xargs -L 2 echo
1 2 3 4
```
```
$ head lorem_ipsum.txt | xargs -L 2
```
```
head lorem_ipsum.txt | xargs -n 2
```
```
$ cat fruit.txt | xargs echo
pear raspberry banana peach apple pineapple blueberry papaya strawberry strawberry plum pear apple
```
```
$ cat fruit.txt | xargs -I {} echo " buymore {}"
 buymore pear
 buymore raspberry
 buymore banana
 buymore peach
 buymore apple
 buymore pineapple
 buymore blueberry
 buymore papaya
 buymore strawberry
 buymore strawberry
 buymore plum
 buymore pear
 buymore apple
```
```
$ cat fruit.txt | xargs -I :FRUIT: echo " buymore :FRUIT:"
 buymore pear
 buymore raspberry
 buymore banana
 buymore peach
 buymore apple
 buymore pineapple
 buymore blueberry
 buymore papaya
 buymore strawberry
 buymore strawberry
 buymore plum
 buymore pear
 buymore apple
```

```
$ ls | grep 'lorem*' | xargs -n 1
lorem_ipsum.txt
```
```
$ ls | grep 'lorem*' | xargs -0 -n 1
lorem_ipsum.txt
```

__xargs usage example__  

```
$ cat file_manifest.txt | xargs cat | less
```
```
$ cat fruit.txt | sort | uniq 
apple
banana
blueberry
papaya
peach
pear
pineapple
plum
raspberry
strawberry
```
```
$ cat fruit.txt | sort | uniq | xargs -I {} mkdir -p ~/Desktop{}
```
```
$ ps aux | grep 'bad processes'
$ ps aux | grep 'bad processes' | cut -c 11-15
$ ps aux | grep 'bad processes' | cut -c 11-15 | xargs kill -9
```
```
$ grep 'apple' *fruit.txt
fruit.txt:apple
fruit.txt:pineapple
fruit.txt:apple
mango_fruit.txt:apple
mango_fruit.txt:pineapple
mango_fruit.txt:apple
sorted_fruit.txt:apple
sorted_fruit.txt:apple
sorted_fruit.txt:pineapple
unique_sorted_fruit.txt:apple
unique_sorted_fruit.txt:pineapple
```
```
$ grep -l 'apple' * fruit | xargs wc
grep: dir1: Is a directory
grep: test1: Is a directory
grep: fruit: No such file or directory
 13  13  99 fruit.txt
 13  13 101 mango_fruits.txt
 13  13 101 mango_fruit.txt
 13  13  99 sorted_fruit.txt
 10  10  77 unique_sorted_fruit.txt
 62  62 477 total
```
```
find . -type f -print0 | xargs -0 chmod 644
find . -type d -print0 | xargs -0 chmod 644
```
```
find directoryname -type f | xargs -0 chmod 755
```
```
find . -name "*fruit.txt" -print0 | xargs -0 -1 {} cp {} ~/Desktop/{}.backup
```
```
find ~/Desktop/ -name "*.backup" -print0 | xargs -p -0 rm
```
```
find ~/Desktop/ -name "*.backup" -depth1 -print0 | xargs -p -0 -n 1 rm
```
```
find ~/web/ -name "*.html" -print0 | xargs -0 grep -l "<h3>"
```
```
find . -nname "*fruit.txt" -print0 | xargs -0 grep -li "mango" | xargs -I {} cp {} ~/Desktop/{}
```

## Command find the logs
```bash
find / -regextype posix-extended -regex '.*\.log([.-][0-9]+)+' -exec ls -ltra {} \;
find / -regextype posix-extended -regex '.*\.log$' -exec ls -ltra {} \;
find / -regextype posix-extended -regex '.*\.log([.-][0-9a-z]+)+' -exec ls -ltra {} \;
find / -regextype posix-extended -regex '.*\.log([.-][0-9a-zA-Z]+)+' -exec ls -ltra {} \;
```

## Command find and gzip the logs
```bash
find / -regextype posix-extended -regex '.*\.log([.-][0-9]+)+' -exec gzip * {} \;
find / -regextype posix-extended -regex '.*\.log$' -exec gunzip * {} \;
find / -regextype posix-extended -regex '.*\.log([.-][0-9a-z]+)+' -exec gzip * {} \;
find / -regextype posix-extended -regex '.*\.log([.-][0-9a-zA-Z]+)+' -exec gzip * {} \;
```

## Command find and gunzip the logs
```bash
find / -regextype posix-extended -regex '.*\.log([.-][0-9]+)+' -exec gunzip * {} \;
find / -regextype posix-extended -regex '.*\.log$' -exec gunzip * {} \;
find / -regextype posix-extended -regex '.*\.log([.-][0-9a-z]+)+' -exec gunzip * {} \;
find / -regextype posix-extended -regex '.*\.log([.-][0-9a-zA-Z]+)+' -exec gunzip * {} \;
find / -regextype posix-extended -regex '.*([.-][0-9a-zA-Z]+)+[.-]log' -type f -exec ls -ltrh {} \;
find /root/logs -regextype posix-extended -regex '.*([0-9]{4})([0-9]{2})([0-9]{2})[.-]log' -type f -exec ls -ltrh {} \;
```

## disk file system commands

```bash
df -hT | egrep "[9|1-9]%"
```

```bash
df -hT | egrep "([89][0-9]|100)%"
```

```bash
df -hT | egrep "([70,80,90][0-9]|100)%"
```

```bash
df -hT | egrep "([89][0-9]|100)%.*%"
```

```bash
printf "Used\tAvail\tUsed\tFilesystem\n"
#echo -e "Used\tAvail\tUsed\tFilesystem"
df -hT | sort -n |grep -vE '^Filesystem' | awk 'BEGIN{OFS="\t"}{ print $6,$5,$4"\t" $1 }'
```

```bash
df -H --output=size,used,avail
```

## disk utility command

```bash
du -sh * | awk -F '\t' 'BEGIN{ print "{" } $1 ~ /[KGM]$/ {printf "%s\"%s\": \"%s\"", (++n>1?",\n":""), $2, $1} END{ print "\n}" }'
```

```bash
du -sh * | grep -E '^[0-9.]+[KMG]' | sort -hr | awk -F'\t' 'BEGIN { print "{" }NR > 1 { print "," }{ printf "\"" $2 "\": \"" $1 "\"" }END{ print "\n}"}'
```

```shell
du -ah /root/* | sort -n -r
```

```shell
du -hs * | sort -rh | head -n 20
```

```shell
du -a /root/ | sort -n -r | head -n 20
```

```shell
du -sm * | sort -rn | head
```

```shell
find . -xdev -type f -size +100M
```

```shell
find . -xdev -type f -size +100M -print | xargs ls -lh | sort -k5,5 -h -r
find / -xdev -type f -size +100M -exec ls -la {} \; | sort -nk 5
```

```shell
du -ahx . | sort -rh | head -5
du -ahx / | sort -rh | head -20
du -ax / | sort -rn | head -20
du -ahx / | grep -E '\d+G\s+'
```

```shell
find . -type f -print | xargs du -sk | sort -rn
find / -xdev -type f -size +100M -exec du -sh {} ';' | sort -rh | head -n50
```

```shell
du -h --max-depth=1 * | sort -rh | head -n 20
```
## How to logrotate in linux

**vi /etc/logrotate.d/catalina**

```shell
/root/logs/india/tomcat-india/catalina.log {
        size 1k
        daily
        copytruncate
        dateext
	dateformat -%Y%m%d-%s
        rotate 4
        compress
}
```

## Command to debug and force start the logs

```shell
logrotate -v -f  /etc/logrotate.d/catalina
```

## Command to change extension from .txt to .log for 1000 files

```shell
for x in *.txt; do mv "$x" "${x%.txt}.log";done
```

## Sed command to convert dos2unix

```shell
sed -i -e 's/\r$//' filename
```

## Sed command to delete specific word

```shell
sed -i -e '/up/d' lorem_ipsum.txt
```

## telnet command

```shell
curl -v telnet://127.0.0.1:23
```

```shell
curl -v telnet://[ip address]:[port]
```

```shell
telnet remotehost 80
```

### Telnet command with auto-close
s
```bash
echo -e '\x1dclose\x0ds' | curl -v telnet://[ip address]:[port]
```

### telnet example commands

__Command for ssh__
```
[root@centos8 ~]# telnet 193.16.16.9 22
Trying 193.16.16.9...
Connected to 193.16.16.9.
Escape character is '^]'.
SSH-2.0-OpenSSH_8.0
quit
Invalid SSH identification string.
Connection closed by foreign host.
[root@centos8 ~]# telnet 193.16.16.9 1025
```
__Command for smtp__
```
[root@centos8 ~]# telnet 193.16.16.9 1025
Trying 193.16.16.9...
Connected to 193.16.16.9.
Escape character is '^]'.
220 mailhog.example ESMTP MailHog
HELO
250 Hello 
quit
221 Bye
Connection closed by foreign host
```

__Command for sftp__

```
[root@centos8 ~]# telnet 193.16.16.9 64022
Trying 193.16.16.9...
Connected to 193.16.16.9.
Escape character is '^]'.
220 (vsFTPd 3.0.3)
quit
221 Goodbye.
Connection closed by foreign host.
```

## curl commands

command references:  

https://curl.se/docs/manual.html  
https://everything.curl.dev/usingcurl  

### curl smtp command

create a sample email.txt file

__vi email.txt__
```
From: John Smith <john@example.com>
To: Joe Smith <smith@example.com>
Subject: an example.com example email
Date: Mon, 7 Nov 2016 08:45:16

Dear Joe,
Welcome to this example email. What a lovely day.
```

__and trigger below command__

```shell
curl -k -v smtp://193.16.16.9:1025 --mail-from john@example.com --mail-rcpt smith@example.com --upload-file email.txt
```
__output__
```shell
*   Trying 193.16.16.9...
* TCP_NODELAY set
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Connected to 193.16.16.9 (193.16.16.9) port 1025 (#0)
< 220 mailhog.example ESMTP MailHog
> EHLO email.txt
< 250-Hello email.txt
< 250-PIPELINING
< 250 AUTH PLAIN
> MAIL FROM:<john@example.com>
< 250 Sender john@example.com ok
> RCPT TO:<smith@example.com>
< 250 Recipient smith@example.com ok
> DATA
< 354 End data with <CR><LF>.<CR><LF>
} [199 bytes data]
* We are completely uploaded and fine
< 250 Ok: queued as 2U5TiFCZQD0VXGl2Jhjfaox8NEqoalMFrIKtPd-RMbU=@mailhog.example
100   199    0     0  100   199      0  99500 --:--:-- --:--:-- --:--:--  194k
* Connection #0 to host 193.16.16.9 left intact
```

### Another SMTP method

```shell
curl -k -v smtp://193.16.16.9:1025 --mail-from 'john@example.com' --mail-rcpt 'smith@example.com'
```

Type below message and put dot(.) at the end of the message like below and press `ctrl+d`
```shell
Subject: smtp test mail
This is a smtp test mail
.
```
__output__

```shell
[root@centos8 ~]# podman run --rm -i -t bitroid/centos-systemd:7.5 sh
sh-4.2# curl --version
curl 7.29.0 (x86_64-redhat-linux-gnu) libcurl/7.29.0 NSS/3.34 zlib/1.2.7 libidn/1.28 libssh2/1.4.3
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp scp sftp smtp smtps telnet tftp 
Features: AsynchDNS GSS-Negotiate IDN IPv6 Largefile NTLM NTLM_WB SSL libz unix-sockets 
sh-4.2# curl -k -v smtp://193.16.16.9:1025 --mail-from 'john@example.com' --mail-rcpt 'smith@example.com'
* About to connect() to 193.16.16.9 port 1025 (#0)
*   Trying 193.16.16.9...
* Connected to 193.16.16.9 (193.16.16.9) port 1025 (#0)
< 220 mailhog.example ESMTP MailHog
> EHLO c194609564cb
< 250-Hello c194609564cb
< 250-PIPELINING
< 250 AUTH PLAIN
> MAIL FROM:<john@example.com>
< 250 Sender john@example.com ok
> RCPT TO:<smith@example.com>
< 250 Recipient smith@example.com ok
> DATA
< 354 End data with <CR><LF>.<CR><LF>
Subject: smtp  test mail
This is a smtp test mail
.
< 250 Ok: queued as Tgm0AkHNg7XZ1LozaRPhjYbNDLDuNyHJdPlLg-Yg5uo=@mailhog.example
* Connection #0 to host 193.16.16.9 left intact
```

### Another SMTP method 2

```shell
curl -k -v --url 'smtp://193.16.16.9:1025' --mail-from 'john@example.com' --mail-rcpt 'smith@example.com' -H "From: john@example.com" -H "To: smith@example.com" -H "Subject: smtp test mail" -F "This is a test mail, please ignore.;type=text/plan"
```
__output__
```shell
* Rebuilt URL to: smtp://193.16.16.9:1025/
*   Trying 193.16.16.9...
* TCP_NODELAY set
* Connected to 193.16.16.9 (193.16.16.9) port 1025 (#0)
< 220 mailhog.example ESMTP MailHog
> EHLO centos8
< 250-Hello centos8
< 250-PIPELINING
< 250 AUTH PLAIN
> MAIL FROM:<john@example.com>
< 250 Sender john@example.com ok
> RCPT TO:<smith@example.com>
< 250 Recipient smith@example.com ok
> DATA
< 354 End data with <CR><LF>.<CR><LF>
* We are completely uploaded and fine
< 250 Ok: queued as CEmdgwuVegePVHwS5X4lUvVD9lE1otk0fWtp4I7JHFg=@mailhog.example
* Connection #0 to host 193.16.16.9 left intact
```
### sftp command example

```
[root@centos8 ~]# podman run --rm -it -p 64022:21 -p 4559-4564:4559-4564 -e FTP_USER=root -e FTP_PASSWORD=hemanth docker.io/panubo/vsftpd:latest

[root@centos8 ~]# curl -k -v sftp://193.16.16.9:64022
* Rebuilt URL to: sftp://193.16.16.9:64022/
*   Trying 193.16.16.9...
* TCP_NODELAY set
* Connected to 193.16.16.9 (193.16.16.9) port 64022 (#0)
* User: 
^C
```

```
[root@centos8 ~]# curl -k -v sftp://root@193.16.16.9:64022
* Rebuilt URL to: sftp://root@193.16.16.9:64022/
*   Trying 193.16.16.9...
* TCP_NODELAY set
* Connected to 193.16.16.9 (193.16.16.9) port 64022 (#0)
* User: root
^C
```

### http command example

```
[root@centos8 ~]# curl --verbose https://räksmörgås.se
* Rebuilt URL to: https://räksmörgås.se/
*   Trying 188.126.83.221...
* TCP_NODELAY set
*   Trying 2a00:1a28:1410:5::1229...
* TCP_NODELAY set
* Immediate connect fail for 2a00:1a28:1410:5::1229: Network is unreachable
* Connected to räksmörgås.se (188.126.83.221) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/pki/tls/certs/ca-bundle.crt
  CApath: none
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, [no content] (0):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, [no content] (0):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, [no content] (0):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, [no content] (0):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS handshake, [no content] (0):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=xn--rksmrgs-5wao1o.se
*  start date: Dec 21 13:02:32 2022 GMT
*  expire date: Mar 21 13:02:31 2023 GMT
*  subjectAltName: host "räksmörgås.se" matched cert's "xn--rksmrgs-5wao1o.se"
*  issuer: C=US; O=Let's Encrypt; CN=R3
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.3 (OUT), TLS app data, [no content] (0):
* TLSv1.3 (OUT), TLS app data, [no content] (0):
* TLSv1.3 (OUT), TLS app data, [no content] (0):
* Using Stream ID: 1 (easy handle 0x55e24218e6b0)
* TLSv1.3 (OUT), TLS app data, [no content] (0):
> GET / HTTP/2
> Host: xn--rksmrgs-5wao1o.se
> User-Agent: curl/7.61.1
> Accept: */*
> 
* TLSv1.3 (IN), TLS handshake, [no content] (0):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, [no content] (0):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS app data, [no content] (0):
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
* TLSv1.3 (OUT), TLS app data, [no content] (0):
< HTTP/2 200 
< server: nginx/1.23.2
< date: Wed, 18 Jan 2023 05:47:08 GMT
< content-type: text/html
< content-length: 1960
< last-modified: Wed, 16 Mar 2022 15:07:13 GMT
< vary: Accept-Encoding
< etag: "6231fd21-7a8"
< expires: Fri, 17 Feb 2023 05:47:08 GMT
< cache-control: max-age=2592000
< pragma: public
< cache-control: public
< accept-ranges: bytes
< 
* TLSv1.3 (IN), TLS app data, [no content] (0):
<!doctype html>
<html>
<head>
  <title>internetstiftelsen testar IDN: räksmörgås.se</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="apple-touch-icon" sizes="180x180" href="https://static.internetstiftelsen.se/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="https://static.internetstiftelsen.se/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="https://static.internetstiftelsen.se/favicons/favicon-16x16.png">
  <link rel="manifest" href="https://static.internetstiftelsen.se/favicons/site.webmanifest">
  <link rel="mask-icon" href="https://static.internetstiftelsen.se/favicons/safari-pinned-tab.svg" color="#ff4069">
  <link rel="shortcut icon" href="https://static.internetstiftelsen.se/favicons/favicon.ico">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-config" content="https://static.internetstiftelsen.se/favicons/browserconfig.xml">
  <meta name="theme-color" content="#ffffff">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="https://styleguide.internetstiftelsen.se/assets/css/app.min.css"/>
</head>

<body>
<div class="wrapper">
<div class="row justify-content-center">
<div class="grid-18 grid-md-14 grid-lg-10">
<h1>räksmörgås.se</h1>
<img src="macka.jpg" />
<p>
  Detta är en test av IDN, <i>Internationalized Domain Names</i>.
  Det finns mer att läsa om IDN på Internetstiftelsens
  <a href="https://internetstiftelsen.se/domaner/registrera-ett-domannamn/villkor-och-regler-for-se-och-nu-domaner/">hemsida om IDN</a>.
  Denna domän heter även xn--rksmrgs-5wao1o.se.
</p>
  Testlänkar:
  <ul>
    <li><a href="http://www.räksmörgås.se/">www.räksmörgås.se</a></li>
    <li><a href="http://www.xn--rksmrgs-5wao1o.se/">www.xn--rksmrgs-5wao1o.se</a></li>
  </ul>
</div>
</div>
</div>
</body>
</html>
* Connection #0 to host räksmörgås.se left intact
```

### http frangment

```
curl https://example.com/#[1-10]
```

### curl dict

```
[root@centos8 ~]# curl dict://dict.org/d:overclock
220 dict.dict.org dictd 1.12.1/rf on Linux 4.19.0-10-amd64 <auth.mime> <163832465.12025.1674021593@dict.dict.org>
250 ok
150 1 definitions retrieved
151 "overclock" jargon "The Jargon File (version 4.4.7, 29 Dec 2003)"
overclock
 /oh'vr?klok?/, vt.

    To operate a CPU or other digital logic device at a rate higher than it was
    designed for, under the assumption that the manufacturer put some {slop}
    into the specification to account for manufacturing tolerances.
    Overclocking something can result in intermittent {crash}es, and can even
    burn things out, since power dissipation is directly proportional to {clock
    } frequency. People who make a hobby of this are sometimes called ?
    overclockers?; they are thrilled that they can run their CPU a few percent
    faster, even though they can only tell the difference by running a {
    benchmark} program. See also {case mod}.

.
250 ok [d/m/c = 1/0/59; 0.000r 0.000u 0.000s]
221 bye [d/m/c = 0/0/0; 0.000r 0.000u 0.000s]
```


### curl trace

```
[root@centos8 ~]# curl --trace dump http://bitroid.in
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx</center>
</body>
</html>
[root@centos8 ~]# curl -v --trace-time http://example.com
06:02:46.192015 * Rebuilt URL to: http://example.com/
06:02:46.233806 *   Trying 93.184.216.34...
06:02:46.233907 * TCP_NODELAY set
06:02:46.434535 *   Trying 2606:2800:220:1:248:1893:25c8:1946...
06:02:46.434633 * TCP_NODELAY set
06:02:46.434744 * Immediate connect fail for 2606:2800:220:1:248:1893:25c8:1946: Network is unreachable
06:02:46.449759 * Connected to example.com (93.184.216.34) port 80 (#0)
06:02:46.449876 > GET / HTTP/1.1
06:02:46.449876 > Host: example.com
06:02:46.449876 > User-Agent: curl/7.61.1
06:02:46.449876 > Accept: */*
06:02:46.449876 > 
06:02:46.663147 < HTTP/1.1 200 OK
06:02:46.663244 < Age: 504155
06:02:46.663280 < Cache-Control: max-age=604800
06:02:46.663315 < Content-Type: text/html; charset=UTF-8
06:02:46.663348 < Date: Wed, 18 Jan 2023 06:02:47 GMT
06:02:46.663382 < Etag: "3147526947+ident"
06:02:46.663415 < Expires: Wed, 25 Jan 2023 06:02:47 GMT
06:02:46.663478 < Last-Modified: Thu, 17 Oct 2019 07:18:26 GMT
06:02:46.663513 < Server: ECS (nyb/1D13)
06:02:46.663546 < Vary: Accept-Encoding
06:02:46.663578 < X-Cache: HIT
06:02:46.663612 < Content-Length: 1256
06:02:46.663646 < 
<!doctype html>
<html>
<head>
    <title>Example Domain</title>

    <meta charset="utf-8" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style type="text/css">
    body {
        background-color: #f0f0f2;
        margin: 0;
        padding: 0;
        font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
        
    }
    div {
        width: 600px;
        margin: 5em auto;
        padding: 2em;
        background-color: #fdfdff;
        border-radius: 0.5em;
        box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);
    }
    a:link, a:visited {
        color: #38488f;
        text-decoration: none;
    }
    @media (max-width: 700px) {
        div {
            margin: 0 auto;
            width: auto;
        }
    }
    </style>    
</head>

<body>
<div>
    <h1>Example Domain</h1>
    <p>This domain is for use in illustrative examples in documents. You may use this
    domain in literature without prior coordination or asking for permission.</p>
    <p><a href="https://www.iana.org/domains/example">More information...</a></p>
</div>
</body>
</html>
06:02:46.663747 * Connection #0 to host example.com left intact
```

### curl command for scp connectivity test

```shell
curl -k -v -u root: scp://193.16.34.20:22
```
__Output__

```shell
[root@mastersftp ~]# curl -k -v -u root: scp://193.16.34.20:22/
*   Trying 193.16.34.20...
* TCP_NODELAY set
* Connected to 193.16.34.20 (193.16.34.20) port 22 (#0)
* User: root
* Authentication using SSH public key file
* Completed public key authentication
* Authentication complete
* SSH CONNECT phase done
* SCP: Warning: scp: /: not a regular file
* Closing connection 0
curl: (78) SCP: Warning: scp: /: not a regular file
```

### curl command for scp to download the file

```
curl -k -v -u root: scp://193.16.34.20:22/tmp/sit1.txt -o sit1.txt
```
__Output__
```
curl -k -v -u root: scp://193.16.34.20:22/tmp/sit1.txt -o sit1.txt
*   Trying 193.16.34.20...
* TCP_NODELAY set
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Connected to 193.16.34.20 (193.16.34.20) port 22 (#0)
* User: root
* Authentication using SSH public key file
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Completed public key authentication
* Authentication complete
* SSH CONNECT phase done
{ [69 bytes data]
100    69  100    69    0     0    202      0 --:--:-- --:--:-- --:--:--   201
100    69  100    69    0     0    202      0 --:--:-- --:--:-- --:--:--   202
* Closing connection 0
[root@mastersftp tmp]# ls -ltr
total 16
drwx------. 3 root    root     17 Jan 18 08:32 systemd-private-a7338e206a4a4b258d0cd3f137201845-chronyd.service-y8979f
-rwxrwxr-x. 1 vagrant vagrant 373 Jan 18 08:32 vagrant-shell
drwxr-xr-x. 2 root    root      6 Jan 18 09:41 vscode-typescript0
-rw-r--r--. 1 root    root      8 Jan 18 10:35 test.txt
-rw-r--r--. 1 root    root     69 Jan 18 11:31 sit1.txt
```

### curl command for sftp connectivity test

```shell
curl -k -v -u root: sftp://193.16.34.20:22
```

__Output__

```shell
[root@mastersftp ~]# curl -k -v -u root: sftp://193.16.34.20:22/
*   Trying 193.16.34.20...
* TCP_NODELAY set
* Connected to 193.16.34.20 (193.16.34.20) port 22 (#0)
* User: root
* Authentication using SSH public key file
* Completed public key authentication
* Authentication complete
dr-xr-xr-x   18 root     root          255 Jan 18 08:30 .
dr-xr-xr-x   18 root     root          255 Jan 18 08:30 ..
drwxr-xr-x   17 root     root         2780 Jan 18 08:30 dev
dr-xr-xr-x  100 root     root            0 Jan 18 08:30 proc
drwxr-xr-x   23 root     root          740 Jan 18 08:30 run
dr-xr-xr-x   13 root     root            0 Jan 18 08:30 sys
drwxr-xr-x   84 root     root         8192 Jan 18 08:30 etc
dr-xr-x---    3 root     root          170 Jan 18 09:58 root
drwxr-xr-x   20 root     root          278 Jan 18 08:30 var
drwxr-xr-x   12 root     root          144 Feb 10  2021 usr
lrwxrwxrwx    1 root     root            7 May 18  2020 bin -> usr/bin
lrwxrwxrwx    1 root     root            8 May 18  2020 sbin -> usr/sbin
lrwxrwxrwx    1 root     root            7 May 18  2020 lib -> usr/lib
lrwxrwxrwx    1 root     root            9 May 18  2020 lib64 -> usr/lib64
dr-xr-xr-x    5 root     root          243 Feb 10  2021 boot
drwxr-xr-x    3 root     root           21 Feb 10  2021 home
drwxr-xr-x    2 root     root            6 May 18  2020 media
drwxr-xr-x    2 root     root            6 May 18  2020 mnt
drwxr-xr-x    2 root     root            6 May 18  2020 opt
drwxr-xr-x    2 root     root            6 May 18  2020 srv
drwxrwxrwt    8 root     root          240 Jan 18 11:24 tmp
-rw-------    1 root     root     2147483648 Feb 10  2021 swapfile
drwxr-xr-x    2 vagrant  vagrant       111 Jan 15 17:23 vagrant
* Connection #0 to host 193.16.34.20 left intact
[root@mastersftp ~]# 
```

### Command to upload a file through scp

```shell
curl -k -v --upload-file /tmp/master.txt -u root: scp://193.16.34.20:22/tmp/master_sit1_test1.txt
```
__Output__

```shell
[root@mastersftp tmp]# curl -k -v --upload-file /tmp/master.txt -u root: scp://193.16.34.20:22/tmp/master_sit1_test1.txt
*   Trying 193.16.34.20...
* TCP_NODELAY set
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Connected to 193.16.34.20 (193.16.34.20) port 22 (#0)
* User: root
* Authentication using SSH public key file
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Completed public key authentication
* Authentication complete
* SSH CONNECT phase done
} [69 bytes data]
* We are completely uploaded and fine
100    69    0     0    0    69      0    218 --:--:-- --:--:-- --:--:--   217
100    69    0     0    0    69      0    218 --:--:-- --:--:-- --:--:--   218
* Closing connection 0
```

### Another method for scp

```shell
curl -k -v -T /tmp/master.txt -u root: scp://193.16.34.20:22/tmp/master_sit1.txt
```
__Output__
```shell
[root@mastersftp tmp]# curl -k -v -T /tmp/master.txt -u root: scp://193.16.34.20:22/tmp/master_sit1.txt
*   Trying 193.16.34.20...
* TCP_NODELAY set
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Connected to 193.16.34.20 (193.16.34.20) port 22 (#0)
* User: root
* Authentication using SSH public key file
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Completed public key authentication
* Authentication complete
* SSH CONNECT phase done
} [69 bytes data]
* We are completely uploaded and fine
100    69    0     0    0    69      0    202 --:--:-- --:--:-- --:--:--   202
100    69    0     0    0    69      0    202 --:--:-- --:--:-- --:--:--   202
* Closing connection 0
```

#### Authentication steps followed on sftp and scp on above commands

Authentication with curl against an SSH server (when you specify an SCP or SFTP URL) is done like this:  
curl connects to the server and learns which authentication methods that this server offers  
curl then tries the offered methods one by one until one works or they all failed  
curl will attempt to use your public key as found in the .ssh subdirectory in your home directory if the server offers public key authentication.  
When doing do, you still need to tell curl which user name to use on the server.
For example, the user 'john' lists the entries in his home directory on the remote SFTP server  

### Command fetch output of specific tag output

```shell
cat helper_input.xml 
<name>Hemanth</name>
<age>25</age>
<ref>d98usa-a9s8h</ref>
<name2>Bitra</name2>

xmllint --format helper_input.xml | awk -F'[<>]' '/<ref>/{print $3}'

cat helper_input.xml | awk -F'[<>]' '/<ref>/{print $3}'
d98usa-a9s8h
```

## top command in batch mode  

```
top -bc -o +%MEM | head -n 20
```

```
top -bc -o +%CPU | head -n 20
```

## remove command to delete file or folder based on inode

```shell
find -inum 208802 -exec rm -i {} \;
```

## tar commands

### create a tar file

```shell
tar -czvf archive.tar.gz stuff
```

### create a tar excluding extension

```shell
tar -czvf archive.tar.gz /home/ubuntu --exclude=*.mp4
```

### extract a tar file to specific directory

```shell
tar -xzvf archive.tar.gz -C /tmp
```

### extract a tar file without verbose

```shell
tar -xzf archive.tar.gz
```

### tar command to split the zip file into multiple files
```shell
tar cvzf - loremipsum.log.gz | split --bytes=50M - loremipsum.log.tar.gz.
```

### tar command to unsplit the files
```shell
cat loremipsum.log.tar.gz.* | tar xvzf -
```

## IP Address filter using grep

```shell
grep -Eo '\b((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.)){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))\b' *
```

## Command to find the empty record in specific field

```shell
awk -F '|' '{if($2=="") print}' filename
```

## Command to find duplicate record in specific field

```shell
cat filename | sort | uniq -c | awk -F '|' '{if($2>1) print}' 
```

## Command to find double decimal or multiple point in double quote amount.

```shell
awk -F '\"' '{ print $2 }' filename.txt | awk -F '.' '{ if($3>1) print}'
awk -F '\"' '{ print $0 }' filename.txt | awk -F '.' '{ if($3>1) print}'
```

__filename.txt__
```shell
ABC,CD,DE,12346,ABC729,dafsdf,loremipsum,"47207.8.79"
```
__output__
```
47207.8.79
```

### SSH Commands

```
ssh -o "StrictHostKeyChecking=no" -p port_number username@hostname

or

ssh -o "StrictHostKeyChecking=no" -p 2222 user@example.com
```

__Commmand to verify SSH Authentication__

```
ssh -v -o PreferredAuthentications=publickey user@hostname
```

__Command to convert public key from OpenSSH to TectiaSSH format__

```
ssh-keygen-g3 --import-public-key openssh_public_key tectiassh_public_key.pub
```

__Command to convert public key from TectiaSSH to OpenSSH format__

```
ssh-keygen -i -f tectiassh_public_key.pub > openssh_public_key.pub
```

__Command to generate rsa key__

```
ssh-keygen -t rsa -b 2048
```

__Command to convert existing rsa to pem file__

```
openssl rsa -in /root/.ssh/id_rsa -outform PEM -out /root/.ssh/centos8.pem
```

### Journal Command

__Command to View All Cron Job Logs__  
```
journalctl -u cron
```

__Filter Logs by a Specific Timeframe__  
```
journalctl -u cron --since "2024-08-01" --until "2024-08-02"
```

__View Logs for a Specific User's Cron Jobs__  
```
journalctl _SYSTEMD_UNIT=cron.service _UID=$(id -u your_username)
```

__View Real-Time Logs__  
```
journalctl -u cron -f
```

__Search for Specific Keywords in Cron Logs__  
```
journalctl -u cron | grep "keyword"
```

__Logs from the current boot__  
```
journalctl -b
```

__Logs from a specific boot__  
```
journalctl -b -1  # previous boot
```

__Logs from a specific time period__  
```
journalctl --since "2024-08-01 00:00:00" --until "2024-08-01 12:00:00"
```

__Logs from the last 30 minutes__  
```
journalctl --since "30 min ago"
```

__Logs for a specific service__  
```
journalctl -u <service_name>
```
__OR__
```
journalctl -u apache2
```

__Show only error messages__  
```
journalctl -p err
```

__Show messages with priority level (0 to 7, emerg to debug)__  
```
journalctl -p 0..3  # emerg to err
```

__Show only kernel messages__  
```
journalctl -k
```

__Output in reverse chronological order__  
```
journalctl -r
```

__Show only the last 10 log entries__  
```
journalctl -n 10
```

__Show logs with full output (no truncation)__  
```
journalctl -o verbose
```

__Save logs to a file__  
```
journalctl -u <service_name> > /path/to/logfile
```

__View Apache logs from the last boot__  
```
journalctl -u apache2 -b
```

__View errors from the last hour__  
```
journalctl -p err --since "1 hour ago"
```

__View Logs for Service Failures Across the System__  
```
journalctl -p err -b
```

#### inode full investigation command


__Command for disk file system to check inode count__
```
df -ihT
```

__list command to find the inode of the files__

```
ls -iltr
```

__Disk utitly command for inode finding__

```
du --inodes -h /path/to/directory
du --inodes --max-depth=1 -h /path/to/directory
du --inodes -a -h /path/to/directory
du --inodes --threshold=1M -h /path/to/directory
du --inodes -h /path/to/directory | sort -h
du --inodes -h /path/to/search/* | sort -rn | head -n 10
```
or
```
find /path/to/search -type d -exec du --inodes {} \; | sort -rn | head -n 10
find /path/to/search -type d -printf "%i %p\n" | sort -rn | head -n 10
find /path/to/search -type d -print0 | xargs -0 -I {} sh -c 'echo -n "{}: "; find "{}" -type f | wc -l' | sort -n -k2 -r | head -n 10
```
or
```
du -x --inodes / | sort -nr | head -n 10
sudo du -x --inodes / | sort -nr | head -n 10
```
or
```
find / -type f -exec du -h {} * | sort -rh | head -10
```

__Monitor Live log updates with specific keyword__

```
tail -f /var/log/syslog | grep - line-buffered  "error"
tail -f logfile | grep --line-buffered pattern
stdbuf -o0 tail -f logfile | grep pattern
```

__Kill command with most resource-intensive process__

```
kill -9 $(ps -eo pid,%cpu - sort=-%cpu) | awk 'NR==2 {print $1}'
```

__Reference on du:__ https://unix.stackexchange.com/questions/140367/finding-all-large-files-in-the-root-filesystem  

__Good webpage:__ [linuxjourney](https://linuxjourney.com/)

__Redirecting output reference:__ https://unix.stackexchange.com/questions/20469/difference-between-21-output-log-and-21-tee-output-log  

__Reference on du:__ https://www.thegeekstuff.com/2010/07/logrotate-examples/

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
$ cat fruit.txt | sort | uniq | xargs -I {} mkdir -p ~/Desktop {}
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


__Reference on du:__ https://unix.stackexchange.com/questions/140367/finding-all-large-files-in-the-root-filesystem  

__Good webpage:__ [linuxjourney](https://linuxjourney.com/)

__Redirecting output reference:__ https://unix.stackexchange.com/questions/20469/difference-between-21-output-log-and-21-tee-output-log  

__Reference on du:__ https://www.thegeekstuff.com/2010/07/logrotate-examples/

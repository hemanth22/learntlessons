### First script.  

```
bash-4.4# cat script.sh 
# Is a comment line.
echo "Hello world"
```
```
bash-4.4# sh script.sh 
Hello world
```

### Second script.  

```
bash-4.4# cat script2.sh 
#This is second script
pwd
ls -la
```

For variables it is case sensitive & commas, spaces are invalid.  

### input from commandline.  

```
bash-4.4# cat script3.sh
#input shell
echo "Please enter your name"
read my_name
echo "Hello $my_name, It's a fine day, isn't it?"
```

```
bash-4.4# sh script3.sh 
Please enter your name
hemanth
Hello hemanth, It's a fine day, isn't it?
```

### Position parameters  

```
bash-4.4# cat script4.sh
mv $1 $2
```

`bash-4.4# touch hemanth`

`bash-4.4# sh script4.sh hemanth bitra`

```
bash-4.4# ls
bin         home        opt         sbin        script4.sh  usr
bitra       lib         proc        script.sh   srv         var
dev         media       root        script2.sh  sys
etc         mnt         run         script3.sh  tmp
```

#### touch Command to create files with date

```
touch {1..100}.log."$(date +%Y%m%d)"
```

### Filename and arguments  

```
bash-4.4# cat script5.sh 
echo "Provide a filename"
read name
mv $1 $name
cat $name
```

```
bash-4.4# sh script5.sh bitra
Provide a filename
hemanthbitra
bash-4.4# ls
bin           lib           root          script3.sh    tmp
dev           media         run           script4.sh    usr
etc           mnt           sbin          script5.sh    var
hemanthbitra  opt           script.sh     srv
home          proc          script2.sh    sys
```
### More on positional parameters  

```
chmod 744 $1
ls -la $1
```

In terminal
------------

`bash-4.4# set shell scripting is cool!`

```
bash-4.4# echo $1
shell
```

```
bash-4.4# echo $2
scripting
```
```
bash-4.4# echo $3
is
```
```
bash-4.4# echo $4
cool!
```
```
bash-4.4# echo  $*
shell scripting is cool!
```
```
bash-4.4# cat > test
My neighbour's dog is annoying
```
```
bash-4.4# set `cat test`
bash-4.4# echo $*
My neihgbour's dog is annoying
```
### In script  

```
bash-4.4# cat script6.sh 
#Rename a filename to filename.name
name=$1
set `who am i`
mv $name $name.$1
```

```
bash-4.4# sh script6.sh test test.user
script6.sh: line 1: who: not found
HOME='/root'
HOSTNAME='2367c4ef7c0b'
IFS=' 	
'
LINENO=''
OPTIND='1'
PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
PPID='1'
PS1='\w \$ '
PS2='> '
PS4='+ '
PWD='/'
SHLVL='2'
TERM='xterm'
_='/bin/sh'
_BASH_GPG_KEY='7C0135FB088AAF6C66C650B9BB5869F064EA74AB'
_BASH_LATEST_PATCH='23'
_BASH_PATCH_LEVEL='18'
_BASH_VERSION='4.4'
name='test'
bash-4.4# ls
bin           lib           root          script3.sh    sys
dev           media         run           script4.sh    test.test
etc           mnt           sbin          script5.sh    tmp
hemanthbitra  opt           script.sh     script6.sh    usr
home          proc          script2.sh    srv           var
bash-4.4# cat test.test 
My neihgbour's dog is annoying
```
### Shell scripting to count the no of command line arguments using $#  

```
bash-4.4# set this is hemanth bitra
bash-4.4# echo $#
4
```

### Math on integers using 'expr'  

Arithmetic operation  
```
bash-4.4# a=30
bash-4.4# b=15
bash-4.4# echo `expr $a + $b`
45
bash-4.4# echo `expr $a - $b`
15
bash-4.4# echo `expr $a \* $b`
450
bash-4.4# echo `expr $a / $b`
2
bash-4.4# echo `expr $a % $b`
0
```

expr works for integer only, not for float.  

__BODMAS__ is an acronym and it stands for Bracket, Of, Division, Multiplication, Addition and Subtraction.  
In certain regions, PEDMAS (Parentheses, Exponents, Division, Multiplication, Addition and Subtraction) is the synonym of BODMAS.  
It explains the order of operations to solve an expression.  

```
bash-4.4# a=30
bash-4.4# b=15
bash-4.4# c=2
bash-4.4# d=15
```

```
bash-4.4# echo `expr $a\*\($b+$c\)/$d`
30*(15+2)/15
```
### Floating point arithematic  

```
bash-4.4# a=10.5
bash-4.4# b=3.5
bash-4.4# c=`expr $a+$b | bc`
bash-4.4# d=`expr $a-$b | bc`
bash-4.4# e=`expr $a\*$b | bc`
bash-4.4# f=`expr $a/$b | bc`
bash-4.4# echo $c $d $e $f
14.0 7.0 36.7 3
```

### Escape sequence  

```
\n - newline
\r - before line is rubish
\t - horizontal tab acts like tab
\b - backspace it deletes before word
\033[1m for bold this applies to whole terminal
```

### Tput

http://linuxcommand.org/lc3_adv_tput.php  

```
bash-4.4# cat script7.sh 
#tput in-action
tput clear
echo "Total number of rows on screen=\c"
tput lines
echo "Total number of columns on screen=\c"
tput cols
tput cup 12 20
tput bold
echo "This should be in bold"
echo "\033[0m Bye Bye"
```
### If then statement

```
echo "Enter source and target filename."
read source target
if mv $source $target
then
echo "Your file has been successfully renamed."
fi
```
Here fi is like end of if condition;  

### if then else statement  

```
if mv $source $target
then
echo "Your file has been successfully renamed."
else
echo "The file could not be renamed."
fi
```

### If elseif else statement  

```
echo "Enter a number between 10 and 20:\c"
read num
if [ $num -lt 10 ]
then
    echo "That was under the belt partner."
elif [ $num -gt 20 ]
then
    echo "Then went over my head."
else
    echo "Now you are making sense!"
fi
```

Conditions in shell scripting  

```
eq - equal
le - less than or equal
ne - not equal
ge - greater than or equal
lt - less than
gt - greater than
```

### Run checks on file

```
echo 'Enter a name:\c"
read fname
if [ - f $fname ]
then
    echo "You indeed entered a filename."
else
    echo "Don't provide me crazy inputs."
fi
```
if conditions
```
-f for file
-d for directory
-c for character specialfile
-b for block (i.e. like videos, images)
-r for read
-w for write
-x for execute
-s to check whether file size
```

# To check file size

```
echo "Enter a name:\c"
read fname
if [ -s $frame ]
then
    echo "The file size is greater than zero."
else
    echo "Empty file"
fi
```

### Append text to a file through shell script

```
echo "Enter filename:\c"
read fname
if [ -f $fname ]
then
    if [ -w $fname ]
    then
        echo "Type matter to append. To quit press Ctrl+D"
        cat >> $fname
    else
        echo "You do not have permission to write"
    fi
fi
```

### To remove permission

`chmod -rwx`

### To give permission

`chmod +rwx`

### String test shell script

string-test.sh
```
str1 = "Hey you !"
str2 = "What's up ?"
str3 = ""
[ "$str1" = "$str2" ]
echo $?
[ "$str1" != "$str2" ]
echo $?
[ -n "$str1" ] - not equal to zero
echo $?
[ -z "$str3" ] - zero
echo $?
```
### Logic operator

#### AND
```
echo "Enter a numer between 50 & 100:\c"
read num
if [ $num -le 100 -a $num -ge 50 ]
then
    echo "You are within limits."
else
    echo "You are out of limits."
fi
```

#### OR

```
echo "Enter a character:\c"
read var
if [ `echo $vaar | wc -c` -eq 2 ]
then
    echo "You entered a character."
else
    echo "Invalid Input."
fi
```

```
echo "Enter a lowercase character:\c"
read var
if [ `echo $var | wc -c` -eq 2 ]
then
    if [ $var=a -o $var=e -o $var=i -o $var=o -o $var=u ]
    then
        echo "You entered a vowel."
    else
        echo "It's not a vowel."
    fi
else
    echo "Invalid Input"
fi
```
### Case statement

```
echo "Enter a character:\c"
read var
case $var in
[a-z]) 
       echo "You entered a lower case alphabet."
       ;;
[A-Z]) 
       echo "You entered a upper case alphabet."
       ;;
[0-9]) 
       echo "You entered a digit."
       ;;
?) 
   echo "You entered a special symbol."
   ;;
*) 
   echo "You entered more than one characters."
   ;;
esac
```

### Word.sh

```
echo "Enter a word:\c"
read word
case $word in
[aeiou]* | [AEIOU]* )
      echo "The word begins with a vowel."
      ;;
[0-9]*)
        echo "The word begins with a digit."
        ;;
*[0-9])
        echo "The word end with a digit."
        ;;
???) 
     echo "You entered a three letter word."
     ;;
x) 
   echo "I don't know what you have entered"
   ;;
esac   
```
### While loop

```
count = 1
while [ $count -le 10 ]
do
  echo $count
  count = `expr $count + 1`
done
```

### Until loop

```
count = 1
until [ $count -ge 10 ]
do
   echo $count
   count = `expr $count + 1`
done
```

### For loop

```
for item in *
do
  if [ -f $item ]
  then
      echo $item
  if
done
```

### Test
```
a = 4.5
b = 4.5
[ $a -eq $b ]
echo $?
```

This will show error

__Solution:__

```
a = 4.5
b = 4.5
[ "$a" -eq "$b" ]
echo $?
```

### Search pattern using 'grep'

Terminal cmds
```
$ grep money text-file
$ grep -i money text-file
$ grep -i -n money text-file
$ grep -i -n -c money text-file

-i: case insensitive
-n: line number
-c: count

$ grep -i -n -c -v money text-file

-v: number of lines
```
### Passwd file

```
$ cat /etc/passwd

username:passwordencripted:UserID:groupID:ComputerName:/home/user:/bin/bash

for UID or UserID: 0 is default for root & userid is limited for other users from 1 to 99
```

### The internal field seperator

```
$set this is the forthy fifth tutorial
$echo $1
this
```

### ifs.sh

```
line = "Shell:Scripting:is:fun"
IFS=:
set $line
echo $1
echo $2
echo $3
echo $4
```
### Passwd revisit

```
echo "Enter username:\c"
read logname
line = `grep $logname /etc/passwd`
IFS=:
set $line
echo "Username: $1"
echo "User ID: $3"
echo "Group ID: $4"
echo "Comment field: $5"
echo "Home folder: $6"
echo "Default Shell: $7"
```

### Reading from a file

```
echo "Enter a filename:\c"
read fname
if [ -z $fname" ]
then
    exit
fi
terminal = `tty`
exec < $fname
count = 1

while read line
do 
   echo $count.$line
done
exec < $terminal
```

### Sleep.sh
```
echo "Enter a sentence:\c"
read str
for word in $str
do
  echo $word
  sleep 2
done
```

### count of no. of words & sentences in a text file without using 'wc'

count.sh
```
echo "Enter a filename:\c"
read fname
terminal=`tty`
exec < $fname
nol = 0
now = 0
while read line
do
  nol = `expr $nol + 1`
  set $line
  now = `expr $now + $#`
done
echo "No. of lines : $nol"
echo "No. of words : $now"
exec < $terminal
```

### Fetch & redirect main pages of commands using for loop

help.sh
```
for cmd in `cat commandlist`
do
  man $cmd >> helpfile
done
```
### Nested loop

```
a = 1
while [ $a -le 3 ]
do
   b = 1
   while [ $b -le 3 ]
   do
      c = 1
      while [ $c -le 3 ]
      do
         echo $a $b $c
         c = `expr $c + 1`
      done
   b = `expr $b + 1`
   done
 a = `expr $a + 1`
done
```

### break

```
count = 1
while [ $count -le 10 ]
do
   echo $count
   count = `expr $count +1`
done
echo "We are out of the loop."
```

### Loop with break

```
count = 1
while [ $count -le 10 ]
do 
   if [ $count -eq 6 ]
   then
        break
   fi
   echo $count
   count = `expr $count + 1`
done
echo "We are out of loop."
```

### Continue

```
count = 0
while [ $count -le 9 ]
do 
   count = `expr $count + 1`
   if [ $count -eq 5 ]
   then
        continue
   if
   echo $count
done
echo "We are out of the loop'
```

### More on metacharacters

```
ls;cal; banner "Hello"
To execute more than one command ';' should be used between commands
grep -i money text_file > pattern && echo "The task was completed."
```

### Add or removing users

```
who
sudo login
```

### Check loggin

```
echo "Enter username:\c"
read logname
time = 0
while true
do
   who | grep "$logname" > /dev/null
   if [ $? -eq 0 ]
   then
      echo "$logname has logged in"
      if [ $time -ne 0 ]
      then
      echo "$logname was $time minutes late in logging in"
      fi
      exit
else
    time = `expr $time + 1`
    sleep 60
fi
done
```

### Command to communicate with other users

`$write username`

mesg 'shortcut for message'
To enable message user command `$mesg y`

### Create own commands using functions

funch.sh
```
youtube()
{
  echo "Good Morning"
}
byebye()
{
  cal
}
```

To execute above file we don't use sh first change permission to chmod +x

`$chmod +x funch.sh`  
`$. funch.sh` __(Space should be given after .)__  

to remove from terminal  
`unset youtube`  
`unset byebye`  


### Execute multiple scripts

#### Script1.sh
```
banner "Script 1"
sh script2.sh
```
#### Script2.sh
```
banner "Script 2"
sh script3.sh
```
#### Script3.sh
```
banner "Script 3"
```

### Rename script

```rename.sh
echo "[TASK] Renamining .log file to .text"
for x in *.log; do mv "$x" "${x%.log}.text";done
```

__GREP Full Form__: _Globally search for regular expression and print_

### Log purger script.

**vi logpurger_enterprise.sh**
```shell
find / -regextype posix-extended -regex '.*\.log([.-][0-9a-zA-Z]+)+' -exec rm -vf {} \; 1>./success."$(date +%Y%m%d_%H%M%S_%N)".log 2>./error."$(date +%Y%m%d_%H%M%S_%N)".log
#find / -regextype posix-extended -regex '.*\.log([.-][0-9a-zA-Z]+)+' -exec rm -vf {} \; 2>&1> ./log_ent_"$(date +%Y%m%d_%H%M%S_%N)".log
#find /root/logs -regextype posix-extended -regex '.*([0-9]{4})([0-9]{2})([0-9]{2})[.-]log' -type f -exec ls -ltrh {} \;
#find /root/logs -regextype posix-extended -regex '.*([0-9]{4})([0-9]{2})([0-9]{2})[.-]log.gz' -type f -exec ls -ltrh {} \;
```

**vi testlogcreater.sh**
```shell
touch {1..100}.$(date +$Y%m%d).log
touch {1..100}.log.date +%m%d
touch {1..100}.log."$(date +%m%d)"
touch {1..100}.log."$(date +%Y%m%d)"
```
### Log rotate script

**vi precode.sh**
```shell
#!/bin/bash
logfile=$1
#First give filename as parameter
logdir=$2
#Second give file_path as parameter
cd $logdir
#switch to file_path
staticlogfsize=104857600
#Static file : 100MB
logfsize=`du -b $1 | tr -s '\t' ' ' | cut -d' ' -f1`
#Get file size in MB
#/root/logs/hemanth/bitra
#bash.log
#if [ ! -f $logfile ]
#then
  #echo "log file not found $logfile"
  #exit 1
#fi
if [[ ! -f $logfile ]]
then
  echo "log file not found: $logfile"
elif [[ -f $logfile && $logfsize -gt $staticlogfsize ]]
then
    echo "log file is greater than 100M: $logfile"
    timestamp=`date +%Y%m%d.%H%M%S`
    newlogfile=$logfile.$timestamp
    cp -vf $logfile $newlogfile
    cat /dev/null > $logfile
    gzip -f -9 $newlogfile
else
    echo "log file is less than 100M: $logfile"
fi
#./precode.sh bash.log '/root/logs/hemanth/bitra'
#./precode.sh bashy.log '/root/logs/hemanth/bitra'
#./precode.sh basher.log '/root/logs/hemanth/bitra'
```

**vi logscript.sh**
```shell
./precode.sh bash.log '/root/logs/hemanth/bitra' 1>/root/logs/success."$(date +%Y%m%d_%H%M%S_%N)".log 2>/root/logs/error."$(date +%Y%m%d_%H%M%S_%N)".log
./precode.sh bashy.log '/root/logs/hemanth/bitra' 1>/root/logs/success."$(date +%Y%m%d_%H%M%S_%N)".log 2>/root/logs/error."$(date +%Y%m%d_%H%M%S_%N)".log
./precode.sh basher.log '/root/logs/hemanth/bitra' 1>/root/logs/success."$(date +%Y%m%d_%H%M%S_%N)".log 2>/root/logs/error."$(date +%Y%m%d_%H%M%S_%N)".log
```

### Check diskspace

**vi diskspace.sh**
```bash
printf "Used\tAvail\tUsed\tFilesystem\n"
#echo -e "Used\tAvail\tUsed\tFilesystem"
#df -hT | sort -n |grep -vE '^Filesystem' | awk 'BEGIN{OFS="\t"}{ print $6,$5,$4"\t" $1 }'
df -hT | egrep "(100)%"
df -hT | egrep "([90][0-9]|100)%"
df -hT | egrep "([80][0-9])%"
df -hT | egrep "([70][0-9])%"
df -hT | egrep "([60][0-9])%"
df -hT | egrep "([40][0-9])%"
df -hT | egrep "([30][0-9])%"
df -hT | egrep "([20][0-9])%"
df -hT | egrep "([10][0-9])%"
df -hT | egrep "([0-9])%"
```

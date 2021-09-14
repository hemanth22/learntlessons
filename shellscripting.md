__What is Unix ?__  

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

__Hisotory__  

- __1989: Bourne Again Shell (Bash)__  
adds echo, printf, read  
declare, bind, alias  
shell expansions  
shell arithmetic  
extended test construct  

**Reference**:  
https://tiswww.case.edu/php/chet/bash/bashref.html#Major-Differences-From-The-Bourne-Shell  
https://tiswww.case.edu/php/chet/bash/bashtop.html  

## Commands

**Present working directory**

```bash
pwd
```

**List command**
```bash
ls
```
```bash
ls -l
```

**Manual command**
```bash
man ls
```

**Make directory**
```bash
mkdir people
```

**Remove directory**
```bash
rmdir people
```

**clear terminal command**
```bash
clear
```

**Copy command**
```bash
cp maple.txt new_maple.txt
```

**Remove file**
```bash
rm maple.txt
```
**Cat command**
```bash
cat pine.txt
```

**More command**
```bash
more pine.txt
```

**Head command**
```bash
head pine.txt
```

**tail command**
```bash
tail pine.txt
```

## Expansion


**Command to switch back to previous directory**

```bash
cd ~
```
**Command to create empty file**

```bash
touch {apple,banana,cherry,durian}
```

**Command to create file series**

```bash
touch file_{1..1000}
```

**Command to echo 1 to 10**

```bash
echo {1..10}
```

**Command to create empty files by maintain same lenght**

```bash
toouch file_{01..1000}
```

**Command to echo numbers with interpolation**

```bash
echo {1..10..2}
```

```bash
echo {1..10..3}
```

**Command to print AtoZ**

```bash
echo {A..Z}
```

**Command to print a to Z but it doesn't work**

```bash
echo {a..Z}
```

**Command to print Ato z this works**

```bash
echo {A..z}
```

**Command to perform interpolation on alphabets**

```bash
echo {w..d..2}
```

**touch command special**

```bash
touch {apple,banana,cherry,durian}_{01..100}{w..d}
```

**command to count the list**

```bash
ls -l | wc -l
```

## Re_Directions

**list with more command**

```bash
ls | more
```

**make directory**

```bash
mkdir ../otherfolder
chmod 000 *_015*
cp -v * ../otherfolder
```

**Remove command**

```bash
rm ../otherfolder/*
```

**Copy command with verbose**

```bash
cp -v * ../otherfolder 1>../success.txt 2> ../error.txt
```

**Command to redirect both standard output and error**

```bash
cp -v * ../otherfolder &> ../log.txt
```

```bash
more ../log.txt
```

**Re-direct to /dev/null**

```bash
ls > /dev/null
```

## GREP

**grep manual**
```bash
man grep
```

**color grep**
```bash
export GREP_OPTIONS='--color=auto'
```

**grep command to ignore case sensitive**
```bash
grep -i break-in auth.log
```

**Command to print 12th columm**
```bash
grep -i break-in auth.log | awk {'print $12'}
```

**Command to ping**
```bash
ping example.com
```

**Command to grep ping one time**
```bash
ping -c 1 example.com
```

**Commnad to grep time from ping**
```bash
ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4
```

## Syntax

**Bash script syntax**

- Bash refers to the whole shell  
  Usually just one command  

- A script can contain  
  Variable  
  Arguments  
  Flow-control logic  
  
interpreter directive -> `#!` it is also call 'Hashbang' or Shebang'  

## Basic

**vi basic.sh**
```bash
#!/bin/bash
# This is a basic bash script
ls
```
## Echo

**vi basic.sh**
```bash
#!/bin/bash
# This is a basic bash script.
greeting="hello"

echo $greeting, world \(planet\)!

echo '$greeting, world (planet)!'
echo
echo
echo
echo "\$greeting, world (planet)!"
echo "$greeting, world (planet)!"
```
## Variables

**vi basic.sh**
```bash
#!/bin/bash
# This is a basic bash script.
a=Hello
b="Good Morning"
c=16

echo $a
echo $b
echo $c

echo "$b! I have $c apples."
```


**Adding attributes to variables**

```
declare -i d=123       # d is an integer
declare -r e=456       # e is read-only
declare -l f="LOLCats" # f is lolcats
declare -u g="LOLCats" # g is LOLCATS
```
**Built-in variables**

```
echo $HOME
Returns user home directory

Mac: /Users/scott
Linux: /home/scott
```

```
echo $PWD
Returns current directory

Mac: /Users/scott
Linux: /home/scott
```

```
echo $MACHTYPE
Returns machine type

Mac: x86_64-apple-darwin12
Linux: x86_64-pc-linux-gnu
```

```
echo $HOSTNAME
Returns system name

Mac: scott.local
Linux: orion
```

```
echo $BASH_VERSION
Returns version of Bash

Mac: 3.2.48(1)-release
Linux: 4.2.25(1)-release
```

```
echo $SECONDS
Returns the number of seconds the Bash session has run

Handy for timing things
```

**Name of the script**
```
echo $0
Returns the name of the script
```

Hint: https://tldp.org/LDP/abs/html/internalvariables.html

## Command Substitution

**cat cmd_sub.sh**
```bash
#!/bin/bash
# This is a basic bash script.
d=$(pwd)
echo $d
```

**cat cmd_sub1.sh**
```bash
#!/bin/bash
# This is a basic bash script.
a=$(ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4)
echo "The ping was $a"
```

## Arithmetic operations

__Syntax__: `val=$((expression))`  

|Operation|Operator|
|---|---|
|Exponentiation|`$a ** $b`|
|Multiplication|`$a * $b`|
|Division|`$a / $b`|
|Modulo|`$a % $b`|
|Addition|`$a + $b`|
|Subtraction|`$a - $b`|

**vi arthimetic.sh**
```bash
cat arithmetic.sh 
#!/bin/bash
# This is a basic bash script.
d=2
e=$((d+2))
echo $e
((e++))
echo $e
((e--))
echo $e
echo
e+=5
#((e+=5))
echo $e
((e*=5))
echo $e
((e/=5))
echo $e
((e-=5))
echo $e
```

**vi arthimetic1.sh**
```bash
#!/bin/bash
# This is a basic bash script.
f=$((1/3))
echo $f
g=$(echo 1/3 | bc -l)
echo $g
```

```bash
man bc
```

## Comparison operations

```
[[ expression ]]

1: FALSE
0: TRUE
```

|Operation|Operator|
|---|---|
|Less than| `[[ $a < $b]]` |
|Greater than| `[[ $a > $b]]` |
|Less than or equal to| `[[ $a <= $b]]` |
|Greater than or equal to| `[[ $a >= $b]]` |
|Equal| `[[ $a == $b]]` |
|Not equal| `[[ $a != $b]]` |

**cat compare_my.sh**
```
#!/bin/bash
# This is a basic bash script.
[[ "cat" == "cat" ]]
echo $?

[[ "cat" = "dog" ]]
echo $?

[[ 20 > 100 ]]
echo $?
```

**Another type of comparison operations**

|Operation|Operator|
|---|---|
|Less than| `[[ $a -lt $b]]` |
|Greater than| `[[ $a -gt $b]]` |
|Less than or equal to| `[[ $a -le $b]]` |
|Greater than or equal to| `[[ $a -ge $b]]` |
|Equal| `[[ $a -eq $b]]` |
|Not equal| `[[ $a -ne $b]]` |

**cat compare_my1.sh**
```
#!/bin/bash
# This is a basic bash script.
[[ "cat" == "cat" ]]
echo $?

[[ "cat" = "dog" ]]
echo $?

[[ 20 -gt 100 ]]
echo $?
```

**Logic operations**

|Operation|Operator|
|---|---|
|Logical AND| `[[ $a && $b ]]` |
|Logical OR| `[[ $a \|\| $b ]]` |
|Logical NOT| `[[ ! $a ]]` |

**String null value**

|Operation|Operator|
|---|---|
| Is null? | `[[ -z $a ]]` |
| Is not null? | `[[ -n $a ]]` |

**vi compare_my2.sh**
```bash
#!/bin/bash
# This is a basic bash script.
a=""
b="cat"
[[ -z $a && -n $b ]]
echo $?
```

**vi compare_my3.sh**
```bash
#!/bin/bash
# This is a basic bash script.
a=""
b="cat"
[[ -z $a & -n $b ]]
echo $?
```

## Strings

**vi cmd_strings.sh**
```bash
#!/bin/bash
# This is a basic bash script.
a="hello"
b="world"
c=$a$b
echo $c
echo ${#a}
echo ${#c}
d=${c:3}
echo $d
e=${c:3:4}
echo $e
echo ${c: -4}
echo ${c: -4:3}
```

**vi cmd_strings1.sh**
```
#!/bin/bash
# This is a basic bash script.
fruit="apple banana banana cherry"
# Command to string replace
echo ${fruit/banana/durian}

# Command to string replace global
echo ${fruit//banana/durian}

# Command to replace string only if it is in beginning of the string
echo ${fruit/#apple/durian}
echo ${fruit/#banana/durian}

# Command to replace string only if it is in end of the string
echo ${fruit/%cherry/durian}
echo ${fruit/%banana/durian}

# Command to replace
echo ${fruit/c*/durian}
```

## Colors

**color on strings**

```bash
echo -e "\033[34;42mColor Text\033[0m"
```

|Color|Foreground|Background|
|---|---|---|
|Black|30|40|
|Red|31|41|
|Green|32|42|
|Yellow|33|43|
|Blue|34|44|
|Magenta|35|45|
|Cyan|36|46|
|White|37|47|

**Color examples (ANSI)**

|Color|Foreground|
|---|---|
|White on Black|`echo -e '\033[37;40mWhite on Black\033[0m'`|
|Black on Red|`echo -e '\033[30;41mBlack on Red\033[0m'`|
|Green on Black|`echo -e '\033[32;40mGreen on Black\033[0m'`|
|Red on White|`echo -e '\033[31;47mRed on White\033[0m'`|
|Blue on Yellow|`echo -e '\033[34;43mBlue on Yellow\033[0m'`|

**Styled text(ANSI)**

|Style|Value|
|---|---|
|No Style|0|
|Bold|1|
|Low Intensity|2|
|Underline|4|
|Blinking|5|
|Reverse|7|
|Invisible|8|

**vi cmd_colorstring.sh**
```
#!/bin/bash
# This is a basic bash script.
echo -e "\033[5;31;40mERROR: \033[0m\033[31;40mSomething went wrong.\033[m"
```

**vi cmd_colorstring2.sh**
```
#!/bin/bash
# This is a basic bash script.
#echo -e "\033[5;31;40mERROR: \033[0m\033[31;40mSomething went wrong.\033[m"
flashred="\033[5;31;40m"
red="\033[31;40m"
none="\033[0m"
echo -e $flashred"ERROR: "$none$red"Something went wrong."$none
```

**Styled text(tput)**

|Style|Command|
|---|---|
|Foreground|`tput setaf [0-7]`|
|Background|`tput setab [0-7]`|
|No Style|`tput sgv0`|
|Bold|`tput bold`|
|Low Intensity|`tput dim`|
|Underline|`tput smul`|
|Blinking|`tput blink`|
|Reverse|`tput rev`|

**Styled text(tput)**

|Color|setaf|setab|
|---|---|---|
|Black|0|0|
|Red|1|1|
|Green|2|2|
|Yellow|3|3|
|Blue|4|4|
|Magenta|5|5|
|Cyan|6|6|
|White|7|7|

**vi cmd_colorstring3.sh**
```
#!/bin/bash
# This is a basic bash script.
#echo -e "\033[5;31;40mERROR: \033[0m\033[31;40mSomething went wrong.\033[m"
flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0;tput setaf 1)
none=$(tput sgr0)
echo -e $flashred"ERROR: "$none$red"Something went wrong."$none
```

## Helpers

```shell
[root@centos ~]# date
Sun Sep 12 14:53:09 UTC 2021
[root@centos ~]# date +"%d-%m-%Y"
12-09-2021
[root@centos ~]# date +"%H-%M-%S"
14-53-19
[root@centos ~]# printf "Name:\t%s\nID:\t%04d\n" "Scott" "12"
Name:   Scott
ID:     0012
[root@centos ~]# printf "Name:\t%s\nID:\t%04d\n" "Someone Else" "123"
Name:   Someone Else
ID:     0123
```
**vi helper.sh**
```shell
#!/bin/bash
# This is a basic bash script
today=$(date +"%d-%m-%Y")
time=$(date +"%H:%M:%S")
printf -v d "Current User:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
echo "$d"
```

__Hint:__  
https://wiki.bash-hackers.org/  
https://wiki.bash-hackers.org/commands/builtin/printf  

## Arrays

**vi cmd_arrays.sh**
```shell
#!/bin/bash
# This is a basic bash script
a=()
b=("apple" "banana" "cherry")
echo ${b[2]}
b[5]="kiwi"
b+=("mango")
echo ${b[@]}
echo ${b[@]: -1}
```

**vi cmd_arrays2.sh**
```shell
#!/bin/bash
# This is a basic bash script
declare -A myarray
myarray[color]=blue
myarray["office building"]="HQ West"
echo ${myarray["office building"]} is ${myarray[color]}
```

## Files


**Writing data to a file.txt**

```shell
echo "Some text" > file.txt
```

**Print output of file**

```shell
cat file.txt
```

**Empty the output of the file**

```shell
> file.txt
```

```shell
cat file.txt
```
**Writing multiple lines to the file**

```shell
echo "Some text" > file.txt
echo "Some more text" >> file.txt
cat file.txt
```

**Command to get output of file**

```shell
cat < file.txt
```

**Command to get line numbers of text file**

**vi cmd_files.sh**
```shell
#!/bin/bash
# This is a basic bash script
i=1
while read f;
do
    echo "Line $i: $f"
    ((i++))
done < file.txt
```

```
bash cmd_files.sh
```

**Command to work with ftp**

**vi ftp.txt**
```shell
open mirrors.xmission.comm
user anonymous nothinghere
ascii
cd gutenberg
get GUTINDEX.00
```

```shell
ftp -n < ftp.txt
```

## HereDoc

**Command to create end of file**

**vi heredoc.sh**
```shell
#!/bin/bash
# This is a basic bash script
cat << EndOfText
This is a
multiline
text string
EndOfText
```

**vi heredoc1.sh**
```shell
#!/bin/bash
# This is a basic bash script
cat <<- EndOfText
        This is a
        multiline
        text string
EndOfText
```

**vi heredoc1.sh**
```shell
ftp -n <<- DoneWithTheUpdate
        open mirrors.xmission.comm
        user anonymous nothinghere
        ascii
        cd gutenberg
        get GUTINDEX.01
        bye
DoneWithTheUpdate
```

## Challenge

**vi ch2_solution.sh**
```shell
#!/bin/bash
freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
greentext="\033[32m"
bold="\033[1m"
normal="\033[0m"
logdate=$(date +"%Y%m%d")
logfile="$logdate"_report.log

echo -e $bold"Quick system report for "$greentext"$HOSTNAME"$normal
printf "\tSystem type:\t%s\n" $MACHTYPE
printf "\tBash Version:\t%s\n" $BASH_VERSION
printf "\tFree Space:\t%s\n" $freespace
printf "\tFiles in dir:\t%s\n" $(ls | wc -l)
printf "\tGenerated on:\t%s\n" $(date +"%m/%d/%y")
echo -e $greentext"A summary of this info has been saved to $logfile"$normal

cat <<- EOF> $logfile
        This report was automatically generated by my Bash script.
        It contains a brief summary of some system information
EOF

printf "SYS:\t%s\n" $MACHTYPE >> $logfile
printf "BASH:\t%s\n" $BASH_VERSION >> $logfile
```

## 'if' statement

```syntax
if [ expression ]
```

```syntax
if [[ expression ]]
```

```syntax
if expression
then
  echo "True"
else
  echo "False"
fi
```

```syntax
if expression
then
  echo "True"
elif expression2; then
  echo "ex is False, e2 is True"
fi
```

**vi my.sh**

```shell
#!/bin/bash
#This is a basic bash script
a = 5
if [ $a -gt 4]; then
        echo $a is greater than 4!
else
        echo $a is not greater than 4!
fi
```

```output
5 is greater than 4!
```

**vi my2.sh**
```shell
#!/bin/bash
#This is a basic bash script
a=2
if [ $a -gt 4 ]; then
        echo $a is greater than 4!
else
        echo $a is not greater than 4!
fi
```

```output
2 is not greater than 4!
```

**vi my3.sh**
```shell
#!/bin/bash
#This is a basic bash script
a="This is my #1 string!"
if [[ $a =~ [0-9]+ ]]; then
    echo "There are numbers in the string: $a"
else
    echo "There are no numbers in the string: $a"
fi
```

```output
There are no numbers in the string: This is my string!
```

**vi my4.sh**
```shell
#!/bin/bash
#This is a basic bash script
a="This is my #1 string!"
if [[ $a =~ [0-9]+ ]]; then
    echo "There are numbers in the string: $a"
else
    echo "There are no numbers in the string: $a"
fi
```

```output
There are numbers in the string: This is my #1 string!
```

## While script example

**vi cmd_while.sh**
```shell
#!/bin/bash
#This is a basic bash script
i=0
while [ $i -le 10 ]; do
        echo i:$i
        ((i+=1))
done
```

**vi cmd_while1.sh**
```shell
#!/bin/bash
#This is a basic bash script
i=0
while [ $i -le 10 ]; do
        echo i:$i
        ((i+=1))
done

j=0
until [ $j -ge 10 ]; do
        echo j:$j
        ((j+=1))
done
```

## For loop command

**vi cmd_for.sh**
```shell
#!/bin/bash
#This is a basic bash script
for i in 1 2 3
do
    echo $i
done
```

**vi cmd_for1.sh**
```shell
#!/bin/bash
#This is a basic bash script
for i in {1..100}
do
    echo $i
done
```

**vi cmd_for2.sh**
```shell
#!/bin/bash
#This is a basic bash script
for i in {1..100..2}
do
    echo $i
done
```


**vi cmd_for3.sh**
```shell
#!/bin/bash
#This is a basic bash script
for (( i=1; i<=10; i++ ))
do
    echo $i
done
```

**vi cmd_for4.sh**
```shell
#!/bin/bash
#This is a basic bash script
arr=("apple" "banana" "cherry")
for i in ${arr[@]}
do
    echo $i
done
```


**vi cmd_for5.sh**
```shell
#!/bin/bash
#This is a basic bash script
declare -A arr
arr["name"]="Scott"
arr["id"]="1234"
for i in "${!arr[@]}"
do
    echo "$i: ${arr[$i]}"
done
```

**vi cmd_for6.sh**
```shell
#!/bin/bash
#This is a basic bash script
for i in $(ls)
do
    echo "$i"
done
```

## Case

**vi cmd_case.sh*
```shell
#!/bin/bash
#This is a basic bash script
#a="dog"
#a="cat"
a="bird"
case $a in
        cat) echo "Feline";;
        dog|puppy) echo "Canine";;
        *) echo "No match!";;
esac
```

## Function

**vi cmd_func.sh**

```shell
#!/bin/bash
#This is a basic bash script
function greet {
    echo "Hi there!"
}

echo "And now, a greeting!"
greet
```


**vi cmd_func.sh**

```shell
#!/bin/bash
#This is a basic bash script
function greet {
    echo "Hi there!"
}

echo "And now, a greeting!"
greet
```


**vi cmd_func1.sh**

```shell
#!/bin/bash
#This is a basic bash script
function greet {
    echo "Hi, $1! What a nice $2!"
}

echo "And now, a greeting!"
greet Scott Morning
greet Everybody Evening
```

**vi cmd_func2.sh**

```shell
#!/bin/bash
#This is a basic bash script
function numberthings {
        i=1
        for f in $@; do
                echo $i: $f
                ((i+=1))
        done
}

numberthings $(ls)

numberthings pine birch maple spruce
```

## Arguments

**vi cmd_arrg.sh**
```shell
#!/bin/bash
#This is a basic bash script
echo $1
```

```shell
[root@centos ~]# ./cmd_arrg.sh Apple
Apple
```

**vi cmd_arrg1.sh**
```shell
#!/bin/bash
#This is a basic bash script
echo $1
echo $2
```

```shell
[root@centos ~]# ./cmd_arrg1.sh Apple Orange
Apple
Orange
```

```shell
./cmd_arrg1.sh "Red Apple" "Orange Orange"
Red Apple
Orange Orange
```

**vi cmd_arrg2.sh**
```shell
#!/bin/bash
#This is a basic bash script
for i in $@
do
    echo $i
done

echo "There were $# arguments."
```

```shell
[root@centos ~]# ./cmd_arrg2.sh apple orange banana kiwi lemon
apple
orange
banana
kiwi
lemon
There were 5 arguments.
```

## Flags

**vi cmd_flags.sh**

```shell
#!/bin/bash
#This is a basic bash script
while getopts :u:p:ab option; do
        case $option in
                u) user=$OPTARG;;
                p) pass=$OPTARG;;
                a) echo "Got the A flag";;
                b) echo "Got the B flag";;
                ?) echo "I don't know what $OPTARG is !";;
        esac
done

echo "User: $user / Pass: $pass"
```

```shell
[root@centos ~]# ./cmd_flag.sh -u scott -p secret
User: scott / Pass: secret
[root@centos ~]# ./cmd_flag.sh -p secret -u scott
User: scott / Pass: secret
[root@centos ~]# ./cmd_flag.sh -p secret -u scott -a
Got the A flag
User: scott / Pass: secret
[root@centos ~]# ./cmd_flag.sh -p secret -u scott -a -b
Got the A flag
Got the B flag
User: scott / Pass: secret
[root@centos ~]# ./cmd_flag.sh -p secret -u scott -a -b -z
Got the A flag
Got the B flag
I don't know what z is !
User: scott / Pass: secret
```

## Options

**vi cmd_options.sh**
```shell
#!/bin/bash
#This is a basic bash script
echo "What is your name?"
read name

echo "What is your password?"
read -s pass

read -p "What's your favorite animal? " animal

echo name: $name, pass: $pass, animal: $animal
```

__Output__
```shell
[root@centos ~]# /bin/bash "/root/cmd_options.sh"
What is your name?
Scott
What is your password?
What's your favorite animal? Cat
name: Scott, pass: secret, animal: Cat
```
__Hint:__ https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html  

**vi cmd_options1.sh**
```shell
#!/bin/bash
#This is a basic bash script
select animal in "cat" "dog" "bird" "fish"
do
        echo "You selected $animal!"
        break
done
```

__Output__
```shell
[root@centos ~]# /bin/bash "/root/cmd_options1.sh"
1) cat
2) dog
3) bird
4) fish
#? 3
You selected bird!
```

**vi cmd_options2.sh**
```shell
#!/bin/bash
#This is a basic bash script
select option in "cat" "dog" "quit"
do
        case $option in
                cat) echo "Cats like to sleep.";;
                dog) echo "Dogs like to play catch.";;
                quit) break;;
                *) echo "I'm not sure what that is.";;
        esac
done
```

__Output__
```shell
[root@centos ~]# /bin/bash "/root/cmd_options2.sh"
1) cat
2) dog
3) quit
#? 1
Cats like to sleep.
#? 2
Dogs like to play catch.
#? 3
```

## Ensuring


Your First Day with PowerShell
==============================

Lab link: https://github.com/pluralsight/PS-AutoLab-Env.git

### Diving into powershell

Command to get process info
```
Get-Process
```
Powershell version
```
$psversiontable
```

### Powershell help

Help Command
```
help get-service
```

Command to download full help document
```
update-help -force
```

Command to get help on service
```
help get-service
```
Command to get-services
```
get-service bits,winrm
```
or
```
get-service -name bits,winrm
```
or
```
get-service -name bits,winrm -computername localhost
```

Command get event logs
```
get-eventlog
```
Command get help on parameter
```
help get-eventlog -parameter logname
```
command to get help in window
```
help get-service -showwindow
```
Command to check all the files
```
help about*
```
Command to check remote related help files
```
help *remoting*
```
or
```
help about*remote*
```
Help command on parameters
```
help get-eventlog -Parameter logname
```
Get eventlogs of system
```
get-eventlog system -newest 5
```
Command to get eventlogs of powershell
```
get-eventlog 'Windows PowerShell'
```
Command to get application event logname
```
Get-eventlog Application -newest 10
```
Command to get information of Noun
```
get-command -Noun process
```
Command to get information of verb
```
get-command -verb restart
get-command -verb block
```
Command to list verbs
```
get-verb
```
command to netstat
```
netstat -n
netstat /?
```
net user Command
```
net user
```
ip configuration details
```
ipconfig
ipconfig.exe /all
```
Netshell Command
```
netsh
netsh>?
netsh>show
```
arp Command
```
arp -g
```
proess Command
```
ps
```
command to get alias
```
get-alias dir
get-alias -Definitio get-childitem
get-alias -Definitio get-alias
```
command gsv
```
gsv
```
help show Command
```
help show-command
```
show command example
```
show-commnd get-eventlog
get-eventlog -list
get-eventlog -LogName system -EntryType Error -newest 3
```
some other example commands
```
get-command mkdir
get-psprovider
help registry
cd hklm:
HKLM:\>dir
HKLM:\>cd .\SYSTEM\
HKLM:\>dir
HKLM:\>cd c:
```

Command to get drive information
```
get-psdrive
```
Command to environment
```
cd env:
Env:\>dir
Env:\>dir windir
Env:\>$env:windir
Env:\>dir $env:windir
Env:\>dir $env:windir\system32\*.msc
Env:\>help dir -Examples
Env:\>cd cert:
cert:\>dir
cert:\>help dir -Examples
cert:\>c:
c:\cls
```

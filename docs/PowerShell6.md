# PowerShell on the Network

## Traditional Remoting

### Demo: Network diagnostics

```powershell
ping bitroid.in
```


```powershell
help test-connection
```

```powershell
help test-connection -param computername
```

```powershell
test-connection bitroid.in
```

```powershell
test-connection bitroid.in -Count 1 -Protocol DCOM
```

```powershell
"bitroid.in","google.co.in" | where { Test-Connection -Quiet -ComputerName $_ -count 1 }
```

```powershell
Test-Connection -ComputerName servername
```

```powershell
'srv2','srv3' | foreach {test-netconnection -ComputerName $_ -CommonTCPPort SMB }
```

```powershell
'dom1','srv1' | foreach {test-netconnection -ComputerName $_ -port 53 }
```

```powershell
'dom1','srv1' | where {test-netconnection -ComputerName $_ -port 53 -InformationLevel Quiet -WarningAction SilentlyContinue }
```

```powershell
test-netconnection -ComputerName wwww.pluralsgiht.com -CommonTCPPort HTTP -InformationLevel Detailed
```

```powershell
help Resolve-DnsName
```

```powershell
Resolve-DnsName www.pluralsight.com
```

```powershell
Resolve-DnsName srv4.company.pri | select *
```

```powershell
Resolve-DnsName srv4.company.pri -DnsOnly
```

### Demo: Basic Remote Management

```powershell
help get-service -Parameter computername
```

```powershell
get-service -computername srv2
```

```powershell
get-service -name bits -computername srv1,srv2,dom1 | select Name,Status,Machine
```

```powershell
get-service -name bits -computername srv1,srv2,dom1 | restart-service -Force -PassThru | select machinename,status.displayname
```

```powershell
help get-process -parameter computername
```

```powershell
get-process lsass -ComputerName dom1
```

```powershell
get-process lsass -ComputerName dom1,srv1,srv2 | select machinename,id,name,handles,VM,WS | sort handles,machinename -Descending | format-table
```

```powershell
help get-eventlog -Parameter computername
```

```powershell
get-eventlog -list -ComputerName dom1
```

```powershell
get-eventlog -list -ComputerName dom1,srv1,srv2,win10 |
where log -eq 'system' |
format-table -GroupBy Log -Property @{Name="Computername";Expression={$_.MachineName}},
OverFlowAction,
@{Name="MaxKB";Expression={$_.MaximumKilobytes}},
@{Name="Retain";Expression={$_.MinimumRetentionDays}},
@{Name="RecordCount";Expression={$_.entries.count}}
```

```powershell
get-eventlog -list -computername dom1,srv1,srv2 |
where {$_.Entries.count -gt 0 } | Sort Machinename,Log |
format-table -groupby @{Name="Computername";Expression={$_.Machinename.toUpper()}}
```

```powershell
Get-command -CommandType Cmdlet -ParameterName Computername
```

### Demo: Firewall Management

```powershell
get-command -noun netfirewallrule
```

```powershell
get-netfirewallrule | Out-GridView -Title "FW Rules"
```

```powershell
get-netfirewallrule -Enabled True | 
Select Name,Displayname,Description,Profile,DisplayGroup,Direction,Action |
more
```
```powershell
get-netfirewallrule -Name FPS* |
where profile -contains 'domain' |
select name,enabled,Direction,Action
```

```powershell
Disable-netfirewallrule FPS-ICMP6* -WhatIf
```

```powershell
get-netfirewallrule -Enabled false | where profile -contains 'domain' |
Select name,description
```

```powershell
get-netfirewallrule remote* | 
where {$_.profile -contains 'domain' -AND $_.enabled -eq 'false'} |
Enable-NetFirewallRule -WhatIf
```

```powershell
help Get-NetFirewallRule -Parameter cimsession
```

```powershell
Get-NetFirewallRule remote* -Cimsession srv2 | select Name,DisplayName,Profile,Enabled,PSComputername
```

## Powershell Remoting

### PowerShell Remoting 

- Disabled by default on clients and older servers  
- Remoting configurations can be implemented via GPO  
- You need remoting to manage via PowerShell  
- Works best with minimal effort in a domain environment  

### Demo: Basic Remoting configurations

```powershell
get-aduser $env:username -Properties memberof,displayname
```

Command to disable PS Remoting

```powershell
Disable-PSRemoting -force
```
Command to stop service

```powershell
stop-service winrm
```

Command to disable start of service
 
```powershell
set-service winrm -StartupType Disabled
```

Command to get netfirewallrule

```powershell
get-netfirewallrule *winrm* |
Select Name,Enabled,Profile,Direcction,Action | 
format-table
```

```powershell
Disable-netfirewallrule winrm-http-in-TCP*
```

```powershell
Enable-PSRemoting
```

```powershell
test-wsman
```

```powershell
test-wsman -ComputerName srv1
```

```powershell
test-wsman -ComputerName srv1 -Credential $cred -Authentication Default
```

```powershell
get-service winrm -comp dom1,srv1,srv2 | select machinename,name,status,StartType
```

### Demo: Interactive Remoting

```powershell
help Enter-PSSession
```

```powershell
Enter-PSSession -ComputerName srv1
```

```powershell
get-process -IncludeUserName
```

```powershell
get-eventlog -list
```

```powershell
find-module iseremotetab
```

```powershell
get-command -module iseremotetab
```

```powershell
New-ISERemoteForm
```

### Demo: One to Many Remoting

```powershell
help invoke-command
```

```powershell
$r = Invoke-Command -scriptblock {
get-item HKLM:\SYSTEM\CurrentControlSet\Control\BitlockerStatus
} -ComputerName srv1
```

```powershell
$r
```

```powershell
$r | Get-Member
```

```powershell
Invoke-Command -scriptblock {
Get-process | Sort WS -Descending | Select -first 5
} -ComputerName Srv1,srv2,dom1 -Credential company\admin
```

```powershell
Invoke-Command {$x=123} -ComputerName srv1
```

```powershell
Invoke-Command {$x+$x} -ComputerName srv1
```

```powershell
$sessions = New-PSSession -ComputerName srv1,srv2,dom1
```

```powershell
$sessions
```

```powershell
$s1=get-PSSession | where ComputerName -eq srv1
```

```powershell
$s1
```

```powershell
Invoke-Command {$x=123} -session $1
```

```powershell
Invoke-Command {$x+$x} -session $1
```

```powershell
Invoke-Command { get-service bits } -session $sessions
```

```powershell
$sb = {
$fso = new-object -com scripting.filesystemobject
$fso.drivs | where drivetype -eq 2 | Select Path,
@{Name="SizeGB";Expression={$_.TotalSize/1GB -as [int]}},
@{Name="FreeGB";Expression={$_.FreeSpace/1GB}},
@{Name="AvailGB";Expression={$_.AvailableSpace/1GB}},
@{Name="Computername";Expression = {$env:computername}}
}
```

```powershell
Invoke-command -scriptblock $sb -Session $sessions
```

```powershell
Invoke-command -scriptblock $sb -Session $sessions -HideComputerName | 
select * -ExcludeProperty runspaceid
```

```powershell
ise c:\scripts\fsoreport.ps1
```

```powershell
$params = @{
FilePath = "c:\scripts\fsoreport.ps1"
argumentlist = @("C:","MB")
session = $sessions
HideComputerName = $true
}
```

```powershell
$report = invoke-command @params | Select * -ExcludeProperty run*
```

```powershell
$report
```

```powershell
$report[0].rootfiles
```

```powershell
$report | export-clixml c:\work\creport.xml
```
### Demo: Non-domain Remoting


```powershell
test-wsman -ComputerName srv3 -Credential $cred -Authentication Negotiate
```

```powershell
Get-Item -Path WSMan:\localhost\Client\TrustedHosts
```

```powershell
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -value SRV3
```

```powershell
dir WSMan:\localhost\Client
```

```powershell
test-wsman -ComputerName srv3 -Credential $cred -Authentication Negotiate
```


```powershell
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value "" -force
```

## Windows Management Instrument (WMI)

### Demo: Get-WmiObject

```powershell
help Get-WmiObject
```

```powershell
get-WmiObject -list -class win32* | more
```

```powershell
start "http://bing.com/search?q=win32_operatingsystem"
```

```powershell
get-WmiObject -ClassName win32_operatingsystem
```

```powershell
get-WmiObject -ClassName win32_operatingsystem | select * | more
```

```powershell
$computers = "dom1","srv1","srv2"
```

```powershell
get-WmiObject win32_operatingsystem -computername $computers |
select PSComputername,Caption,OSArchitecture,ServicePackMajorVersion,InstallDate
```

```powershell
get-WmiObject win32_operatingsystem -computername $computers |
select PSComputername,Caption,OSArchitecture,ServicePackMajorVersion,
@{Name="Installed";Expression={$_.ConvertToDatetime($_.InstallDate)}}
```

### Demo: Filtering with Get-WmiObject

```powershell
get-wmiobject win32__process -computerName srv2 | Select Name,Processid,WorkingSetSize
```

```powershell
get-wmiobject win32__process -computerName srv2 | where { $_.name -eq 'lsass.exe'}
```

```powershell
get-wmiobject -query "select * from win32__process where Name ='lsass.exe'" -ComputerName srv2 | 
Select Name,Processid,WorkingSetSize
```

```powershell
get-wmiobject win32__process -filter "name='lsass.exe'" -ComputerName srv2 | 
Select Name,Processid,WorkingSetSize
```

### Demo: Alternate Credentials with Get-WmiObject

```powershell
$cred = Get-Credential company\administrator
```

```powershell
get-wmiobject win32_logicaldisk -filter "deviceid='c:'" -ComputerName $computers -credential $cred |
select PSComputername,Caption,Size,Freespace
```


```powershell
get-wmiobject win32_logicaldisk -filter "deviceid='c:'" -ComputerName $computers -credential $cred |
select PSComputername,Caption,@{Name="SizeGB";
Expression={($_Size/1gb) -as [int]}},
@{Name="FreeGB";Expression={$_.Freespace/1gb}},
@{Name="PctFree";Expression={ ($_freespace/$_.size)*100}}
```

```powershell
get-wmiobject win32__processor -comp srv3 -credential srv3\administrator
```

### Demo: Using Wbemtest

```powershell
wbemtest
```

```powershell
gwmi -query "select * from win32_service"
```

```powershell
gwmi win32_service -filter "state='stopped'"
```

### Demo: Exploring WMI

```powershell
[wmi]"\\.\root\cimv2:win32_logicaldisk.deviceid='c:'"
```

```powershell
$c = Get-WmiObject -list win32_service
```

```powershell
$c.properties | select Name,Type,Qualifiers | more
```

```powershell
$c.properties | where {$_.qualifiers.name -contains 'key'}
```

```powershell
[wmi]"\\.\root\cimv2:win32_service.name='bits'"
```

```powershell
$search = [wmisearcher]"select * from win32_service where name ='bits'"

$search
```

```powershell
$search.query
```

```powershell
$search.get()
```

```powershell
get-WmiObject win32_service -filter "name='bits'"
```

```powershell
$ns = "root\microsoft\windows\storage"
```

```powershell
Get-wmiobject -Namespace $ns -list -Class msft* | more
```

```powershell
Get-wmiobject -Namespace $ns -Class msft_disk | more
```

```powershell
c:\scripts\WmiExplorer.ps1
```

### Demo: WMI Methods

```powershell
$c = [wmiclass]"win32_share"
```

```powershell
$c.methods
```

```powershell
start http://bit.ly/CreateWin32_Share
```

```powershell
$c.Create("c:\work","work",0,$null,"my demo share")
```

```powershell
$work = get-wmiobject win32_share -filter "name = 'work'"
```

```powershell
$work
```

```powershell
$work | get-member -MemberType Method
```

```powershell
$work.Delete()
```

```powershell
help Invoke-WmiMethod
```

```powershell
$c.GetMethodParameters("Create")
```

```powershell
Invoke-WmiMethod -Class win32_share -Name Create -ArgumentList @($null,"My work files",$null,"Work",$null,"c:\work",0)
```

```powershell
Get-WmiObject win32_share -filter "name='work'" |
Invoke-WmiMethod -Nme Delete
```

### Demo: WMI jobs

```powershell
help Get-WmiObject -Parameter asjob
```

```powershell
$j = Get-WmiObject win32_logicaldisk -filter "deviceid='c:'" -ComputerName 'srv1','srv2','dom1' -asjob
```

```powershell
wait-job $j
```

```powershell
$j | receive-job -keep
```

```powershell
receive-job $j -keep | select PSComputername,DeviceID,Size,Freespace
```

```powershell
start-job { Get-WmiObject win32_operatingsystem -computername srv1,srv2,dom1} -name OS
```

```powershell
wait-job OS
```

```powershell
receive-job OS -keep | select CSName,Caption,InstallDate
```

```powershell
invoke-command {
get-WmiObject win32_operatingsystem |
Select @{Name="ComputerName";Expression={$_.CSName}},
Caption,Version,
@{Name='Installed';Expression={$_.Converttodatetime($_.Installdate)}}
} -ComputerName srv1,srv2,dom1 -HideComputerName -asjob  -JobName GetOS
```

```powershell
Wait-Job GetOS
```

```powershell
receive-job GetOS -keep
```
### Demon: WMI and PowerShell at Work

```powershell
ise c:\scripts\New-SystemReport.ps1
```

```powershell
c:\scripts\New-SystemReport.ps1
```

```powershell
c:\scripts\New-SystemReport.ps1 -computername srv1,srv2 -HTML |
Out-file c:\work\report.html
```

```powershell
invoke-item c:\work\report.html
```

```powershell
get-wmiobject win32_operatingsystem -computer srv1 | invoke-wmimethod -name Reboot -whatif
```

```powershell
help Restart-Computer
```

```powershell
restart-computer -ComputerName srv1 -whatif
```

```powershell
Get-wmiobject win32_share
```

```powershell
Get-SmbShare
```

```powershell
New-SmbShare -Name work -Path C:\work -FullAccess "company\domain admins" -FolderEnumerationMode AccessBased
```

```powershell
Get-SmbShareAccess -Name work
```

```powershell
dir \\win10\work
```

```powershell
Remove-SmbShare -Name work
```

```powershell
help about_WMI
```

## The CIM Cmdlets

### Demo: Get-CimInstance

```powershell
help Get-CimClass
```

```powershell
get-cimclass -class win32* | more
```

```powershell
help Get-CimInstance
```

```powershell
Get-CimInstance -ClassName win32_operatingsystem
```

```powershell
Get-WmiObject win32_operatingsystem
```

```powershell
get-CimInstance win32_operatingsystem | get-member | more
```

```powershell
get-ciminstance win32_operatingsystem | select * | more
```

```powershell
$computers = "dom1","srv1","srv2"
```

```powershell
get-CimInstance win32_logicaldisk -ComputerName $computers |
select PSComputername,Caption,OSArchitecture,InstallDate
```

```powershell
get-ciminstance -query "Select * from win32_process where Name = 'lsass.exe'" -ComputerName srv2 |
Select Name,Processid,workingSetSize
```

```powershell
get-ciminstance win32_process -filter "name='lsass.exe'" -ComputerName srv2 |
Select Name,Processid,workingSetSize
```

```powershell
get-ciminstance win32_volume -filter "bootvolume='true'" -ComputerName $computers |
Select PSComputername,Name,Capacity,Freespace,Compressed,QuotasEnabled
```

### Demo: CIM Sessions  

### Demo: CIM Sessions

```powershell
about new-cimsession
```

```powershell
New-Cimsession -ComputerName srv1,srv2,dom1 -credential company\administrator
```

```powershell
help new-cimsessionoption
```

```powershell
$opt = New-CimSessionOption -Protocol DCom
```

```powershell
$s3 = New-CimSession -ComputerName srv3 -Credential srv3\administrator -SessionOption $opt
```

```powershell
Get-CimInstance win32_computersystem -CimSession $s3
```

```powershell
get-cimsession |  get-ciminstance win32_logicaldisk -filter "deviceid='c:'" |
Select @{Name="ComputerName";Expression={$_.PSComputername.toUpper()}},
Caption,@{Name="SizeGB";
Expression={($_.Size/1gb) -as [int]}},
@{Name="FreeGB";Expression={[math]::round($_.Freespace/1gb,2)}},
@{Name="PctFree";Expression={[math]::Round(($_.freespace/$_.size)*100,2)}}
Sort PctFree | Format-Table
```

```powershell
Get-CimSession | Remove-CimSession
```

```powershell
Get-CimSession
```

### Demo: Exploring CIM Namespaces and Classes  

```powershell
$ns = "root\microsoft\windows\storage"
```

```powershell
Get-CimClass -Namespace $ns -Class msft* | more
```

```powershell
Get-CimClass -Namespace $ns -Class msft_disk | more
```

```powershell
Get-CimClass -Namespace $ns -Class msft_disk | Select *
```

```powershell
Get-Disk | Select *
```

```powershell
Get-Disk | Get-Member | More
```

```powershell
get-command get-disk 
```

```powershell
get-typedata -TypeName *cim* | where {$_.typename -notmatch 'win32'} | sort typename | More
```

```powershell
get-command -noun *healthaction*
```

### Demo : Using CIM Methods

```powershell
$c = Get-CimClass win32_share

$c
```

```powershell
$c.CimClassMethods
```

```powershell
$c.CimClassMethods["Create"]
```

```powershell
get-ciminstance win32_share | get-member -MemberType Method
```

```powershell
Get-WmiObject win32_process | get-member terminate
```

```powershell
about Invoke-CimMethod
```

```powershell
$c.CimClassMethods["Create"].Parameters | Select name,cimtype
```

```powershell
$hash = @{
Name = "workFiles"
Description = "My  work folder"
Type = [uint32]0
Path = "c:\Work"
}
```

```powershell
Invoke-CimMethod -Class win32_share -Name Create -Arguments $hash
```

```powershell
$w = Get-CimInstance  win32_share -filter "name='workfiles'"

$w
```

```powershell
$w | get-member delete
```

```powershell
Get-CimInstance  win32_share -filter "name='workfiles'" |
Invoke-CimMethod -MethodName Delete -Confirm
```

```powershell 
get-command -noun "*share" | more
```

```powershell
help new-smbshare
```

```powershell
invoke-command { get-item c:\scripts} -ComputerName srv1,srv2
```

```powershell
$params = @{
Description = "Company scripts"
Name = 'Scripts$'
FullAccess = "Company\Domain Admins"
Path = "C:\scripts"
CimSession = 'srv1','srv2'
}
```

```powershell
New-smbshare @params
```

```powershell
get-smbshare -CimSession srv1
```

```powershell
Remove-SmbShare -Name 'scripts$' -CimSession srv1,srv2
```

```powershell
get-command -ParameterName cimsession | more
```

### Demo: CIM Background Jobs

```powershell
help Get-CimInstance -Parameter asjob
```

```powershell
start-job { get-CimInstance win32_service  -filter "startmode='auto' AND state <> 'running'" -computername srv1,srv2,dom1 } -Name SvcCheck
```

```powershell
wait-job svccheck
```

```powershell
receive-job svccheck -Keep | 
Select SystemName,Name,Displayname,State,Startmode |
Format-Table
```

```powershell
Invoke-command { Get-CimInstance win32_service  -filter "startmode='auto' AND state <> 'running'" |
Select Name,Displayname,State,Startmode
} -jobName SvcCheck2 -Computename srv1,srv2,dom1 -asjob
```

```powershell
wait-job SvcCheck2
```

```powershell
receive-job SvcCheck2 -Keep | Select * -ExcludeProperty run* | format-table
```

```powershell
$pssess = New-PSSession -ComputerName srv1,srv2,dom1
```

```powershell
invoke-command {
start-job { Get-CimInstance win32_service  -filter "startmode='auto' AND state <> 'running'" } -name check
} -session $pssess
```

```powershell
invoke-command { wait-job check } -session $pssess
```

```powershell
invoke-command {
Receive-job check -keep | Select Name,Displayname,State,Startmode 
} -session $pssess | Select * -ExcludeProperty run*
```

```powershell
remove-pssession $pssess
```

### Demo: PowerShell and CIM in Action

```powershell
$names = (Get-ADComputer -filter "OperatingSystem -like '*server*'").Name
```

```powershell
$names
```

```powershell
$servers = $names | where { Test-wsman $_}
```

```powershell
$servers
```

```powershell
ise c:\scripts\diskreporthtml.ps1
```

```powershell
c:\scripts\diskreporthtml.ps1 -computer $servers -path c:\scripts\diskreport.html
```

```powershell
Restart-computer srv1 -Force -Wait -For WinRM
```

```powershell
Get-CimInstance -ClassName win32_operatingsystem -ComputerName $servers -Property LastBootUptime |
Select @{Name="Computername";expression={$_.PSComputername}},
LastBootUptime,
@{name="Runtime";Expression={(get-date) - $_.lastbootuptime}}
```

```powershell
get-hotfix -ComputerName $servers
```

```powershell
Get-CimInstance win32_QuickFixEngineering -ComputerName $servers
```

```powershell
(Get-CimInstance win32_QuickFixEngineering).cimclassproperties | Select Name
```

```powershell
Get-CimInstance win32_QuickFixEngineering -ComputerName $servers |
Select CSName,HotfixID,Installed*,Description,Caption |
Out-GridView -title "HotFix List"
```

### Demo: Scripting with CIM

```powershell
Get-CimInstance win32_operatingsystem -ComputerName srv1 |
Select-Object -property @{Name="Computername";Expression={$_.CSName}},
@{Name="FullName";Expression={ $_.Caption}},
version,BuildNumber,InstallDate,OSArchitecture
```

```powershell
ise c:\scripts\Get-MyOS.ps1
```

```powershell
help get-myos 
```

```powershell
get-myos win10
```

```powershell
get-myos srv2
```

```powershell
ise c:\scripts\sysreport.ps1
```

```powershell
c:\scripts\Sysreport.ps1 -computername dom1 -Path c:\work\dom1.htm
```

```powershell
invoke-item c:\work\dom1.htm
```

```powershell
help cim
```

## PowerShell and the web  

### Demo: Invoke-WebRequest

```powershell
$a = Invoke-WebRequest -uri 'http://www.icanhazip.com' -UseBasicParsing
```

```powershell
$a.Content
```

```powershell
(Invoke-WebRequest -uri 'http://www.icanhazip.com' -UseBasicParsing).content
```

```powershell
$url = 'https://git-scm.com/download/win'
```

```powershell
start $uri
```

```powershell
$page = Invoke-WebRequest -Uri $uri -UseBasicParsing -DisableKeepAlive
```

```powershell
$page | more
```

```powershell
$page.links
```

```powershell
$dl = $page.links | where-Object outerhtml =match 'git-.*-64-bit.exe' | Select-Object -first 1 *
```

```powershell
$dl | format-list *
```

```powershell
$filename = split-path $dl.href -leaf
```

```powershell
$filename
```

```powershell
$out = Join-Path -Path c:\work -ChildPath $filename
```

```powershell
Invoke-WebRequest -uri $dl.href -OutFile $out -UseBasicParsing -DisableKeepAlive
```

```powershell
dir c:\work\git*
```

```powershell
start https://www.ssa.gov/OACT/babynames/index.html
```

```powershell
ise c:\scripts\get-babynames.ps1
```

```powershell
c:\scripts\get-babynames.ps1
```

### Demo: Invoke-RestMethod

```powershell
help Invoke-RestMethod
```

```powershell
$r = invoke-restmethod https://api.github.com/users/jdhitsolutions/repos?per_page=50
```

```powershell
$r.count
```

```powershell
$r[0] | more 
```

```powershell
$r | where { -not $_.fork } |
Select Name,Description,Updated_at,html_url,*count |
Out-GridView -title "Jeff's GitHub"
```

```powershell
start https://www.arin.net/resources/whoisrws/whois_api.html
```

```powershell
$baseURL = 'http://whois.arin.net/rest'
```

```powershell
$uri = "$baseurl/ip/52.27.12.198"
```

```powershell
$who = Invoke-Restmethod $uri 
```

```powershell
$who
```

```powershell
$who.net
```

```powershell
$s = Invoke-RestMethod $uri -Headers @{"Accept"="application/json"}
```

```powershell
$s
```

```powershell
$s.net
```

```powershell
Invoke-RestMethod $uri -Headers @{"Accept"="text/plain"}
```

```powershell
$uri = 'http://feeds.feedburner.com/brainyquote/QUOTEBR'
```

```powershell
$data = Invoke-RestMethod -Uri $uri
```

```powershell
$data
```

```powershell
$data[0]
```

```powershell
$quote = "{0} - {1}" -f $data[0].description,$data[0].title
```

```powershell
write-host $quote -ForegroundColor yellow
```

```powershell
ise c:\scripts\Get-RSSv4.ps1
```

```powershell
. c:\scripts\Get-RSSv4.ps1
```

```powershell
get-rssfeed | sort Published
```

```powershell
help New-WebServiceProxy
```

```powershell
$uri = "http://srv2/mywebservices/firstservice.asmx"
```

```powershell
$px = New-WebServiceProxy -uri $uri
```

```powershell
$px
```

```powershell
$px | Get-Member Add,SayHello
```

```powershell
$px.add.OverloadDefinitions
```

```powershell
$px.add(123,456)
```

```powershell
$px.SayHello()
```

### Demo: New-WebServiceProxy

```powershell
$px = New-WebServiceProxy "http://www/webservicex.net/geoipservice.asmx"
```

```powershell
$px | Get-Member -MemberType Method
```

```powershell
$IPAddress="208.67.220.220"
```

```powershell
$px.GetGeoIP($IPAddress)
```

```powershell
$px.GetGeoIP($IPAddress) | Select IP,Country*
```

```powershell
$ips = Get-Content c:\scripts\ips.txt
```

```powershell
$ips | foreach { $px.GetGeoIP($) } | Sort CountryCode | Select IP,Country*
```

### Advanced Application

```powershell
$name = "odatademo"
$base = "C:\Program Files\WindowsPowerShell\Modules"
$outpath = Join-path -Path $base -ChildPath $Name
mkdir $outpath
```

```powershell
Export-ODataEndpointProxy -Uri http://services.odata.org/OData/OData.svc/ -AllowUnsecureConnecton -OutputModule $outpath -force
```

Putting PowerShell to Work
==========================

### SnapIn 

```powershell
> Get-PSSnapin
```
Command to check registered Snap in

```powershell
> Get-PSSnapin -Registered
```
Command to add the Snap in
```powershell
> Add-PSSnapin quest*
```

Command to check the modules of snapin
```powershell
> Get-Command -Module quest* | More
```
Command to check about objects of snapin
```powershell
> get-pssnapin quest* | select-object *
```

Command to fetch the modules of powershell
```powershell
> Get-Modulue
```

```powershell
> Get-Modulue -ListAvailable | more
```

Command to get Smbshare List  
```powershell
> Get-SmbShare
```

Command to get smbshare in detail.  
```powershell
> Get-Module smbshare | select-object * | more
```

Command to check ps module path  
```powershell
> $env:psmodulepath
```

```powershell
> $env:psmodulepath -split ";"
```

```powershell
> dir $pshome\modules | more
```

```powershell
> dir $pshome\modules\SmbShare
```

Command to import module

```powershell
> import-module storage
```

```powershell
> get-command -module storage | select-object *
```

Command to remove module

```powershell
> remove-module storage
```

Command to fetch commands
```powershell
> Get-Command -module PowerShellGet | more
```

Command to check repository
```powershell
> Get-PSRepository
```

Command to get help on module
```powershell
> help find-module
```

Command to display tags
```powershell
> Find-Module -tag sqlserver 
```

Command to display about sqlserver objects
```powershell
> find-module sqlserver | Select-Object *
```

Command to install sqlserver module
```powershell
> install-module sqlserver
```

Command to get sqlserver module available
```powershell
> get-module sqlserver -ListAvailable
```

Command to get module
```powershell
> get-command -module sqlserver | more
```

command to get backup sql database module
```powershell
> help backup-sqldatabase
```

command to get noun modules
```powershell
> get-command -noun module
```

command to get save module sqlhelper
```powershell
> save-module sqlhelper -Path c:\save
```

Command to check saved module
```powershell
> dir C:\save -recurse | more
```

command to check module with ise

```powershell
> ise C:\save\SQLHelper\1.1.0.3\SQLHelper.psm1
```

command to move save module path
```powershell
> move -path C:\save\sqlhelper -Destination 'C:\Program Files\windowspowershell\modules'
```

command to get sqlhelper availability
```powershell
> get-module sqlhelper -ListAvailable
> get-command -Module sqlhelper
```
## Understanding Objects

- PowerShell works with objects in a pipeline
- Cmdlets output objects
- Cmdlets can accept objects as input
- PowerShell has cmdlets to work with objects

__Objects have properties__  

- Describe the object  
- Some may be read-only
- Some may be modifiable
- Often exposed via parametes  
- Not every property is displayed by default

__Objects have methods__  

- Actions the object can do
- Actions you can do to the object
- May user parameters
- Often exposed via cmdlets
- But can be manually invoked on a per object basis

#### Powershell objects cmdlets  

- Cmdlets are agnostic
- Doesn't matter if it is a file or an Active Directory user
- You still need to understand the objects in the pipeline

```
Select-Object
Sort-Object
Group-Object
Where-Object
Measure-Object
```

#### Demonstration: Object Basics

Command to find the module
```powershell
> find-module psteachingtools
```

Command to install module
```powershell
> install-module psteachingtools
```
Command to get noun of the module
```powershell
> get-command -noun vegetable
```
Command to display the vegetables
```powershell
Get-Vegetable
```
Command to display members of get vegetables
```powershell
Get-Vegetable | Get-Member
```
```powershell
Get-Vegetable | Get-Member -MemberType Properties
```
```powershell
Get-Vegetable | Get-Member -MemberType Method
```
__Demonstration: Select Objects__  

```powershell
> Get-Vegetable | Select -property Name
```

```powershell
> Get-Vegetable | Select Name,Count,State
```

```powershell
> Get-Vegetable | Get-Member
```

```powershell
> Get-Vegetable | Select Name,Count,CookedState,IsRoot
```

```powershell
> Get-Vegetable | Select Name,C*
```

```powershell
> Get-Vegetable -RootOnly | Select -First 1
```

```powershell
> Get-Vegetable | Select -First 1 -Property *
```

```powershell
> Get-Vegetable | Select Name -Unique
```

```powershell
> Get-Vegetable | Select Name -Unique -ExpandProperty Name
```

__Demonstration: Sort Objects__  

```powershell
> Get-Vegetable | Sort Count
```

```powershell
> Get-Vegetable | Sort Count -Descending
```

```powershell
> Get-Vegetable | Sort Count -Descending | Select Count,Name
```

```powershell
> Get-Vegetable | sort color -Unique
```

```powershell
> Get-Vegetable | Select Name, Color, @{Name="ColorValue";Expression={$_.color.value__}} | sort Color
```

```powershell
> Get-Vegetable | sort {$_.color.tostring()} -Unique
```
__Demonstration: Group Objects__  

```powershell
> Get-Vegetable | Group-Object -Property color
```

```powershell
> Get-Vegetable | Group color | sort count -Descending
```

```powershell
> Get-Vegetable | Group color | sort count -Descending | select -first 1 -ExpandProperty group
```

```powershell
> Get-Vegetable | group cookedstate -NoElement
```
__Demonstration: Filtering Objects__  

```powershell
> Get-Vegetables
```

```powershell
> Get-Vegetables corn
```

```powershell
> Get-Vegetables --RootOnly
```

```powershell
> Get-Vegetables | Where-Object -property color -eq yellow
```

```powershell
> Get-Vegetables | Where {$_.color -eq yellow }
```

```powershell
> Get-Vegetables | Where {$psitem.color -eq yellow }
```

```powershell
help about_comparison_operators
```

```powershell
> 1 -eq 1
True
```

```powershell
> 1 -lt 5
True
```

```powershell
> 1 -gt 5
False
```

```powershell
> 'jeff' -eq 'Jeff'
True
```

```powershell
> 'jeff' -ceq 'Jeff'
False
```

```powershell
> 'jeff' -like 'je*'
True
```

```powershell
> 'jeff' -notlike 'je*'
False
```

```powershell
> 'jeff' -match "^J"
True
```

```powershell
> 'srv03' -match "\w+\d{1,3}"
True
```

```powershell
> Get-Vegetable | where count -gt 10
```

```powershell
> Get-Vegetable | where count -gt 10 -and color -eq green
```

```powershell
> Get-Vegetable | where {$._count -gt 10 -and $._color -eq 'green' } | sort count -Descending
```

```powershell
> Get-Vegetable | where {$._IsRoot -OR $._color -eq 'green' } | select name,color,isroot
```

```powershell
> Get-Vegetable | where {$._isroot -eq $False } | select name,color,isroot
```

```powershell
> Get-Vegetable | where {-Not ($._isroot)} | select name,isroot
```

```powershell
> measure-command {dir C:\Windows\System32 -recurse | where { $_.Extension -eq '.exe'}}
```

```powershell
> measure-command {dir C:\Windows\System32 -recurse -filter *.exe }
```
__Demonstration: Measure-Object__  

```powershell
> help Measure-Object
```

```powershell
> Get-Vegetable -RootOnly | Measure-Object -Property count -Sum
```

```powershell
> Get-Vegetable -RootOnly | Measure count -sum | get-member
```

```powershell
> Get-Vegetable -RootOnly | Measure count -sum | select -ExpandProperty sum
```

```powershell
> dir c:\windows\notepad.exe | select *
```

```powershell
> dir c:\windows\*.exe | measure length -Sum -Average -Maximum -Minimum
```

```powershell
> get-process | get-member -MemberType Properties | more
```

```powershell
> get-process | measure workingset,peakworkingset -Sum -Average
```

__Demonstration: Practical Example__  

```powershell
> Get-Process
```

```powershell
> Get-Process lsass | get-member | more
```

```powershell
> Get-Process lsass | select PSResources
```

```powershell
> Get-Process | Sort WS -Descending | Select -first 5
```

```powershell
> Get-Process | Sort WS -Descending | Select -first 5 ID,Name,WS,Handles
```

```powershell
> help get-eventlog
```

```powershell
> get-eventlog -LogName system -Newest 10 -EntryType Error
```

```powershell
> get-eventlog -LogName system -Newest 10 -EntryType Error | Select Time,Source,Message
```

```powershell
> get-eventlog -LogName system -Newest 1 | get-member
```

```powershell
> get-eventlog -LogName system -Newest 10 -EntryType Error | Select TimeGenerated,Source,Message
```

```powershell
> get-eventlog -LogName system -Newest 10 -EntryType Error | Select TimeGenerated,Source,Message | format-list
```

```powershell
> get-eventlog system | Group Source
```

```powershell
> get-eventlog system | Group Source -NoElement | Sort Count -Descending | Select -first 10
```

```powershell
> get-eventlog system | Group Source -NoElement | Sort Count -Descending | Select -first 10 | Out-GridView
```

```powershell
> help get-service
```

```powershell
> get-service
```

```powershell
> get-service | Select *
```

```powershell
> get-service | Where status -eq 'stopped'
```

```powershell
> get-service | Where status -eq 'stopped' | Select Displayname,Name,StartType
```

```powershell
> get-service | where {$_.status -ne 'running' -AND $_.StartType -eq 'Automatic'}
```

```powershell
> get-service | where {$_.status -ne 'running' -AND $_.StartType -eq 'Automatic'} | start-service -PassThru
```

## Objects and the pipeline  

### Pipeline Principals  

__Pipeline Exceptions__  

- Normally, we let cmdlets do their thing  
- Pipelines are typically better for managing at scale  
- But sometimes you need to process objects individually  

### Using ForEach-object  

- cmdlet emits a bunch of objects  
- For each object do something  
- Results go down the pipeline  
- Out into Powershell  

__Process Objects One at a time__  

```powershell
dir -file | where {$_.length -ge 1mb -AND $_.extension -notmatch ".zip|.exe"} | 
Foreach-Object {
Compress-Archive -path $_.fullname
-DestinationPath "$($_.directory)\$($_.basename).zip"
-CompressionLevel Optimal
}
```
- Don't confuse the ForEach alias with the ForEach enumerator  
- $\_represents current object in the pipeline  
- Use a semi-colon (;) to seperate commands on the same line  

### Advanced Stuff  

```powershell
-Begin{}
```
commands that run once before anything is processed.  

```powershell
-Process{}
```
commands that run once for each incoming object.__Default__  
```powershell
-End{}
```
commands that run once after everything is processed.  

```powershell
dir c:\work -directory | foreach -begin { $h=@{} ; $results=@() }
-process {
$stat = dir $_.FullName -file -Recurse |
Measure-Object -Property length -sum ;
$h.Path = $_.fullname ; $h.Files = $stat.count ;
$h.TotalSize =$stat.sum ;
$results+=[pscustomobject]$h
}
-end {
$results
}
```
__ForEach Enumerator__  

**_For each thing in a collection of things, run these commands_**

```powershell
$numbers = 1..10
foreach ($n in $numbers) {
$max = Get-Random -minimum 50 -maximum 500
Set-Content -value (1..$max) -path "TestFile-$n.txt"
}
```
__Does not write to the pipeline after the scriptblock__  

### Demonstration: ForEach-object  

```powershell
> help ForEach-Object
```

```powershell
> 1..10
```

```powershell
> 1..10 | foreach-object -process {$_ * 2}
```

```powershell
> 1..10 | foreach {$_ * 2}
```

```powershell
> 1..10 | foreach {$PSItem *2}
```

```powershell
> Get-Vegetable | Get-Member
```

```powershell
> Get-Vegetable -RootOnly | Select Name,IsPeeled
```

```powershell
> Get-Vegetable -RootOnly | foreach {$_.peel() ; get-vegetable $_.name | Select Name,IsPeeled }
```

```powershell
> Get-Vegetable | foreach { Export-Clixml -InputObject $_ -path "$($_.name).xml" }
```

```powershell
> dir *.xml
```

```powershell
> dir c:\work -file -Recurse | where {$_.length -ge 500 -AND $_.extension -notmatch ".zip|.exe"}
```
Compressing old files.  

```powershell
> dir c:\work -file -Recurse |
where {$_.length -ge 500 -AND $_.extension -notmatch ".zip|.exe"} | Foreach {
$file = Join-Path -path $_.Directory -ChildPath "$($_.BaseName).zip"
Compress-Archive -path $_.fullname -DestinationPath $file -CompressionLevel Optimal -Force
}
```

```powershell
> dir c:\work\*.zip -Recurse 
```

```powershell
> dir c:\work -Directory |
foreach -begin { $h=@{} ; $results=@{} } -process {
$stat = dir $_.FullName -file -Recurse | Measure-Object -Property length -sum
$h.Path = $_.fullname
$h.Files = $stat.count
$h.TotalSize = $stat.sum
$results+=[pscustomobject]$h
} -end {
$results
}
```

```powershell
> get-service | get-member -MemberType Methods
```

```powershell
> get-service lanmanworkstation,winmgmt,vmicvss | foreach { $_.Pause()}
```

```powershell
> get-service lanmanworkstation,winmgmt,vmicvss 
```

```powershell
> get-service -noun service
```

```powershell
> get-service lanmanworkstation,winmgmt,vmicvss | resume-service -PassThru
```

### Demonstration: ForEach Enumerator  

```powershell
$numbers = 1..10
Foreach ($n in $numbers) {
$max = Get-Random -Minimum 50 -Maximum 500
$filename = Join-path -Path c:\work -ChildPath "TestFile-$n.txt"
Set-Content -value (1..$max) -path $filename
Get-item $filename
}
```
```powershell
$r = foreach ($n in $numbers) {$n+3}
```
```powershell
$r | sort -Descending
```
```powershell
$numbers | foreach-object {$_+3} | sort -Descending
```

## Out Options  
```powershell
Out-File
Out-GridView
Out-Printer
```
## Demonstration: The out Cmdlets  

```powershell
Get-Command -verb out
```

```powershell
Get-Service | sort status,name
```

```powershell
Get-Service | sort status,name | out-file c:\work\services.txt
```
Below command helps in preventing override of the file.
```powershell
Get-Service | sort status,name | out-file c:\work\services.txt -NoClobber
```

```powershell
Get-Service | out-file c:\work\services.txt -Append
```

```powershell
Get-Service | sort status,name | out-file c:\work\services.txt -Append
```

```powershell
Get-Service | Out-GridView
```

```powershell
Get-Service | where status -e 'running' | Out-GridView -PassThru
```

```powershell
Get-Service | where status -e 'running' |
Out-GridView -Title "Select services to restart" -PassThru |
foreach {
Write-Host "Restarting $($_.DisplayName)" -ForegroundColor green
$_ | Restart-Service -PassThru -Force
}
```

```powershell
Get-Printer
```

```powershell
get-eventlog system -Newest 10 -EntryType error | Select TimeGenerated,Source,Message | Out-Printer "Microsoft Print to PDF"
```

```powershell
invoke-item 'C:\Users\vagrant\Documents\System.pdf'
```

```powershell
get-eventlog system -Newest 50 -EntryType error | Select TimeGenerated,Source,Message | Format-List | Out-Printer "Microsoft Print to PDF"
```

### Demonstration: Practical Example

```powershell
> $logs = Get-Eventlog -list | select LogDisplayName |
Out-GridView -Title "Select one or more logs" -OutputMode Multiple
```

```powershell
> $count = 1,10,25,50 | Out-GridView -Title "How many entries ?" -OutputMode Single
```

```powershell
> $printer = Get-Printer | Select Name | Out-GridView -Title "select a printer" -OutputMode Single
```

```powershell
> $logs | foreach {
$_.LogDisplayName
Get-Eventlog -LogName $_.LogDisplayName -Newest $count -EntryType Error |
Select TimeGenerated,Source,Message | Format-List |
Out-Printer $printer.Name
}
```

### Demonstration: Using Tee-object

```powershell
help Tee-object
```

```powershell
get-process | sort ws -descending | select -first 10 | Tee-Object -FilePath C:\Users\vagrant\Desktop\proc.txt
```

```powershell
get-process | sort ws -descending | select -first 10 | Tee-Object -FilePath C:\Users\vagrant\Desktop\proc.txt | Out-Printer "Microsoft Print to PDF"
```

## Pipeline in depth.

### Demonstration: Parameter Binding

```powershell
help restart-service -Parameter name
```

```powershell
'bits' 'winrm' | restart-service -PassThru
```

```powershell
help restart-service -Parameter inputobject
```

```powershell
get-service winrm | restart-service -PassThru
```

```powershell
Trace-command -name ParameterBinding -Expression { get-service winrm | restart-service } -PSHost
```

```powershell
help Test-NetConnection -Parameter computername
```

```powershell
get-content c:\work\computers.txt
```
__Output__
```powershell
pluralsight.com
bitroid.in
```

```powershell
get-content c:\work\computers.txt | Test-NetConnection -InformationLevel Detailed
```

```powershell
help Test-NetConnection -Parameter port
```

```powershell
import-csv c:\work\computerdata.csv
```

```powershell
import-csv c:\work\computerdata.csv | Test-NetConnection
```

```powershell
help about_pipeline
```
### Creating Custom Properties

__Sample syntax__

```powershell
@{Name = 'something' ; Expression = { <your code>  }}
```

Use `$_` to reference current object in the pipeine

```powershell
Get-Process | Select ID,Name,WS,StartTime,@{Name='Runtime';Expression={(Get-Date) - $_.starttime}}
```

### Expanding Object Properties

```powershell
Get-Service winrm | Select -ExpandProperty RequiredServices
```

Properties can only expand one property at a time.

### Demonstration: Custom Properties

```powershell
Get-Process | Sort cpu -Descending | select -first 10 -property ID,Name,CPU,StartTime, @{Name="Runtime";Expression={(Get-Date)-$.starttime}}
```

```powershell
get-service bits -computername win10ent | select *
```

```powershell
get-service -computername win10ent | select Displayname,status,@{Name="Computername";Expression={$_.machinename}} | Out-GridView -title "Services"
```

```powershell
dir -Path c:\work -file -Recurse | Select Name,@{Name="SizeKB";Expression={[math]::round($_.length/1kb,2)}},
@{Name="Modified";Expression={$_.lastwritetime}},
@{Name="ModifiedAge";Expression={(Get-Date) - $_lastwriteime}},
@{Name="Path";Expression={$_.fullname}},
@{Name="Computername";Expression={$env.computername}}
```

### Demonstration: Expanding Properties

```powershell
Get-Vegetable | Select Name -Unique
```

```powershell
Get-Vegetable | Select Name -Unique | out-file c:\Veglist.txt
```

```powershell
Get-Vegetable | Select -expandproperty Name -Unique
```

```powershell
Get-Vegetable | Select -expandproperty Name -Unique | out-file c:\Veglist.txt
```

```powershell
help Get-Vegetable -Parameter name
```

```powershell
Get-Content c:\Veglist.txt | where {$_ -Like "c*"} | Get-Vegetable
```

```powershell
(Get-Vegetable).name
```

```powershell
(Get-Vegetable | where status -eq running).DisplayName | Sort | more
```

### Practical Example

```powershell
Get-NetIPAddress | more
```

```powershell
Get-NetAdapter
```

```powershell
help Get-NetAdapter -param interface*
```

```powershell
Get-NetAdapter | Select interface*
```

```powershell
Get-NetAdapter | Get-NetIPAddress -AddressFamily IPv4
```

```powershell
get-eventlog application -EntryType Error,warning | Group Source | foreach {
$file = Join-Path -path c:\ -ChildPath "$($_.name).txt"
"$($_.count) entries" | Out-File -FilePath $file
$_.group | foreach {
$_ | Select TimeGenerated,EntryType | Out-File -FilePath $file -Append
$_ | Select -ExpandProperty Message | Out-File -FilePath $file -Append
}
Get-Item $file
}
```
## PowerShell Formatting

### Formatting Process

PowerShell follows a simple rule:  

- If less than 5 properties display a table  
- If 5 or more, display a list  

You can override with the Format cmdlets  

### Formatting cmdlets

- Format-Table
- Format-Wide
- Format-List
- Format-Custom  

### Demonstration: Formatting Basics

```PowerShell
get-service bits
```

```PowerShell
get-service | get-member name
```

```PowerShell
dir $pshome\DotNetTypes.format.ps1xml
```

```PowerShell
dir $pshome\DotNetTypes.format.ps1xml |
Select-String system.serviceprocess.servicecontroller -Context 0,30 | More
```

```PowerShell
get-service bits | format-table
```

```PowerShell
get-service bits | format-list
```

```PowerShell
import-csv C:\work\computerdata.csv | get-member -MemberType Properties
```

```PowerShell
import-csv C:\work\computerdata2.csv | format-table
```

### Demonstration: Format-table

```PowerShell
help format-table | more
```

```PowerShell
get-alias -definition format-table
```

```PowerShell
dir C:\work\*.dat | format-table -property Fullname,length,lastwritetime
```

```PowerShell
dir C:\work\*.dat | format-table -property Fullname,Name,
@{Name="Size";Expression={$_.length}},lastwritetime,
@{Name="Age(Days)";Expression = {(Get-Date)-$_.lastwritetime | Select -ExpandProperty TotalDays }}
```

```PowerShell
get-vegetable | format-table -GroupBy color
```

```PowerShell
get-vegetable | sort color | format-table -GroupBy color -Property UPC,Count,Name,IsRoot
```

```PowerShell
dir C:\work -file -recurse | Group Extension |
select count,Name,
@{Name="TotalKB";Expression={$_.group | measure length -sum | Select -ExpandProperty sum}} |
format-table -group Name -Property Count,TotalKB
```

### Demonstration: Format-table Better Output

```Powershell
Get-netadapter
```

```Powershell
Get-netadapter | ft
```

```Powershell
Get-netadapter | ft -AutoSize
```

```Powershell
get-event application -newest 5
```

```Powershell
get-event application -newest 5 | ft TimeGenerated,Source,EntryType,Message -Wrap
```

```Powershell
get-event application -newest 5 | select TimeGenerated,Source,EntryType,Message | ft -Wrap
```

### Demonstration: Format-table Views

```Powershell
set-clipboard system.diagnostics.process
```

```Powershell
notepad $pshome\DotNetTypes.format.ps1xml
```

```Powershell
get-process -IncludeUserName
```

```Powershell
get-process | format-table -view priority
```

```Powershell
get-process | format-table -view starttime
```

```Powershell
get-process | sort starttime | format-table -view starttime
```

```Powershell
get-service | format-table -view service
```

### Demonstration: Format-table View

```Powershell
get-vegetable | get-member
```

```Powershell
get-vegetable | format-table | get-member
```

```Powershell
get-vegetable | sort color | format-table Name,Color,IsRoot
```

```Powershell
get-vegetable | sort color | format-table Name,Color,IsRoot | Out-file C:\work\v.txt
```

```Powershell
get-content C:\work\v.txt
```

```Powershell
get-vegetable | select Name,Color,IsRoot | Out-GridView
```

### Demonstration: Format-list

```Powershell
help format-list
```

```Powershell
get-alias -definition format-list
```

```Powershell
get-vegetable | format-list
```

```Powershell
get-vegetable corn | fl *
```

```Powershell
get-vegetable c* | fl name,count,cookedstate
```

```Powershell
get-vegetable c* | fl name,count,@{Name="Status";Expression={$_.cookedstate}}
```

```Powershell
Get-vegetable | sort color | fl -GroupBy color Name,Count,IsRoot
```

```Powershell
dir C:\work\*.dat
```

```Powershell
dir C:\work\*.dat | format-list
```

```Powershell
notepad $pshome\Certificate.format.ps1xml
```

```Powershell
dir Cert:\LocalMachine\Authroot | format-list -view thumbprintlist
```

```Powershell
dir Cert:\LocalMachine\Authroot | format-list -view pathonly
```

```Powershell
dir Cert:\LocalMachine | format-list -view pathonly
```

### Demonstration: Format-Wide

```Powershell
help format-wide
```

```Powershell
get-alias -definition format-wide
```

```Powershell
get-vegetable | format-wide
```

```Powershell
get-vegetable | format-wide -Column 4
```

```Powershell
get-vegetable | format-wide -AutoSize
```

```Powershell
get-service | fw -Column 3
```

```Powershell
get-service | fw Displayname -AutoSize
```

```Powershell
dir C:\windows -Directory | fw -AutoSize
```

```Powershell
dir C:\work -file | sort extension | fw -GroupBy extension -AutoSize
```

```Powershell
dir C:\work | sort {$_.GetType().Name} | fw -GroupBy {$_.GetType().Name} -AutoSize
```

### Demonstration: Format-custom

```Powershell
help format-custom
```

```Powershell
get-alias -definition format-custom
```

```Powershell
Get-vegetable | format-custom
```

```Powershell
get-process Powershell | fc
```

```Powershell
Get-TypeDate -TypeName system.diagnostics.process |
select -expand defaultdisplaypropertyset
```

```Powershell
Get-Process powershell | fc -Property *
```

```powershell
dir C:\work\TestData-1.dat | fc -Property fullname,name,length | more
```

```powershell
get-content C:\scripts\mycustom.format.ps1xml | more
```

```powershell
update-formatdata -AppendPath C:\scripts\mycustom.format.ps1xml
```

```powershell
dir C:\work -file | fc | more
```

## Powershell Background Jobs

### Background Job Fundamentals

Command to start any script block or script

```powershell
Start-Job {Get-Eventlog -logname system} -name syslog
```

Command to check job status

```powershell
Get-job syslog
```

Command to get job result

```powershell
Receive-Job syslog
```

Command to get job result without wiping the data
```powershell
Receive-Job syslog -keep
```
Other job sources

```powershell
Invoke-Command
```

```powershell
Get-WMIObject
```

### Demonstration: Creating Background

```powershell
help about_jobs
```

```powershell
get-command -noun job
```

```powershell
help start-job
```

```powershell
start-job -ScriptBlock { Get-Vegetable } | tee -variable j
```

```powershell
$net = start-job {netstat -an}
```

```powershell
> $net

Id     Name            PSJobTypeName   State         HasMoreData     Location
--     ----            -------------   -----         -----------     --------
5      Job5            BackgroundJob   Completed     True            localhost
```

```powershell
start-job {dir $env:temp -file -Recurse | measure length -sum} -Name tempsize
```

```powershell
start-job {Param($status) Get-Service | where status -eq $status} -Name svc -ArgumentList @('running')
```

```powershell
help start-job -Parameter filepath
```

Command to pass multiple variable and execute one script using jobs
```powershell
"c:\work","c:\scripts",$env:temp | foreach {
start-job -FilePath c:\scripts\DirReport.ps1 -Name report -ArgumentList $_
}
```
Output

```powershell
PS C:\> "c:\work","c:\scripts",$env:temp | foreach {
>> start-job -FilePath c:\scripts\DirReport.ps1 -Name report -ArgumentList $_
>> }

Id     Name            PSJobTypeName   State         HasMoreData     Location
--     ----            -------------   -----         -----------     --------
1      report          BackgroundJob   Running       True            localhost
3      report          BackgroundJob   Running       True            localhost
5      report          BackgroundJob   Running       True            localhost
```

Code of DirReport.ps1
```powershell
[cmdletbinding()]
Param(
[Parameter(Position=0)]
[string]$Path="."
)

#resolve path name to a complete name
$dir = Convert-Path $path
if (Test-Path $dir) {
    Get-Childitem -Path $dir -file -Recurse |
    Measure-Object length -sum -Average |
    Select-Object -property @{Name="Path";Expression={$dir}},Count,
    @{Name="SumKB";Expression={[math]::Round($_.sum/1kb,4)}},
    @{Name="AvgKB";Expression={[math]::Round($_.average/1kb,4)}}
}
else {
    Write-Warning "Can't find $dir"
}
```

```powershell
start-job {get-content c:\foo.txt | select-string unicorn } -Name unicorn
``

```powershell
start-job {get-foo} -name foo
```

### Demonstration: Managing Jobs

```powershell
help get-job
```

```powershell
get-job
```

```powershell
Get-job tempsize
```

```powershell
get-job report
```

```powershell
Get-job -State Running
```

```powershell
Get-job -State Completed
```

```powershell
get-job -State failed
```

```powershell
get-job | group state
```

```powershell
get-job tempsize -IncludeChildJob
```

### Demonstration: Working with Job Results

```powershell
$net
```

```powershell
$net | receive-job
```

```powershell
$j
```

```powershell
receive-job $j
```

```powershell
receive-job tempsize -keep
```

```powershell
receive-job tempsize -keep | get-member
```

```powershell
receive-job svc -keep
```

Command to keep first 3 lines output

```powershell
receive-job svc -keep | select -first 3
```

```powershell
$r = receive-job report -keep
```

```powershell
$r
```

```powershell
$r | sort count -descending | select * -ExcludeProperty runspaceid | format-table
```

```powershell
get-job unicorn
```


```powershell
receive-job unicorn -keep
```

Demonstration: Waiting and Clearing Jobs

```powershell
help wait-job
```

```powershell
start-job {1..10 | foreach { $_;sleep -milliseconds 500}} -name n
```

```powershell
get-job n | wait-job
```

```powershell
get-job n | wait-job | receive-job -Keep
```

```powershell
help remove-job
```

Command to remove the jobs based on name of the job.
```powershell
remove-job unicorn
```

Command to remove based on state of the job.
```powershell
remove-job -State Failed
```

Command to remove all the jobs.
```powershell
get-job | remove-job
```

### Demonstration: Invoke-Command with Jobs

```powershell
help invoked-command -Parameter asjob
```

```powershell
hostname
```

```powershell
invoke-command -ScriptBlock { get-eventlog -list | where {$_.entries.count -gt 0}} -ComputerName DESKTOP-7M2DQ9U -AsJob
```

```powershell
get-job | wait-job | receive-job -keep
```

```powershell
$t = invoke-command -FilePath C:\scripts\DirReport.ps1 -ArgumentList C:\Windows\Temp -ComputerName DESKTOP-7M2DQ9U -AsJob
```

```powershell
get-job
```

```powershell
receive-job $t
```

```powershell
$a = invoke-command -ScriptBlock {param([string]$svc) get-service $svc } -ComputerName DESKTOP-7M2DQ9U,foo,bar -AsJob -ArgumentList 'bits'
```

```powershell
$a
```

```powershell
$a | get-job -IncludeChildJob
```

```powershell
$a | receive-job -keep
```

```powershell
help about_remote_jobs
```

### Demonstration: WMI jobs

```powershell
help get-wmiobject -param asjob
```

```powershell
get-wmiobject -class win32_process -asjob
```
__Output__

```powershell
Id     Name            PSJobTypeName   State         HasMoreData     Location
--     ----            -------------   -----         -----------     --------
31     Job31           WmiJob          Running       True            localhost
```

```powershell
get-job -Newest 1
```

```powershell
$b = get-wmiobject win32_service -ComputerName DESKTOP-7M2DQ9U,foo -AsJob
```

```powershell
$b | wait-job | receive-job -keep | select -last 5 | format-table
```

```powershell
start-job { get-ciminstance win32_volume -ComputerName DESKTOP-7M2DQ9U,foo } -Name voljob
```

```powershell
wait-job voljob | receive-job -keep
```

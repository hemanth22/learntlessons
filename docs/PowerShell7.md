# Automation with PowerShell Scripts

## PowerShell Scripting Fundamentals

### PowerShell Scripting Security

__Execution Policy__  

- [x] Restricted
- [x] RemoteSigned
- [x] AllSigned
- [x] Unrestricted
- [x] ByPass


```powershell
Set-ExecutionPolicy RemoteSigned
```

__Execution Policy__  

Run in an elevated session.  

Only needsto be set once per machine.  

Can also be set via Group Policy.  

```powershell
Get-ExecutionPolicy
```

PowerShell will tell you if you can't run a script   


```powershell
help about_Execution_Policies
```

### Demonstration: Scripting Security  

```powershell
Set-ExecutionPolicy RemoteSigned
```

```powershell
Get-ExecutionPolicy
```

```powershell
get-content sample.ps1

get-eventlog -LogName System -Newest 100 | Group-Object -Property source -NoElement | 
Sort-Object -Property count,Name -Descending
```

Below command will throw error

```powershell
sample.ps1
```

Below command will work

```powershell
.\sample.ps1
```


```powershell
.\sample.ps1 | Format-Table -AutoSize
```

```powershell
Set-ExecutionPolicy restricted
```

```powershell
Get-ExecutionPolicy
```

Below command will not executed saying unauthoried as ExecutionPolicy is restricted
```powershell
.\sample
```

```powershell
Set-ExecutionPolicy allsigned -Force
```

Below command will not executed saying unauthoried as ExecutionPolicy is set to execute only signed scripts
```powershell
.\sample
```

This command allow to run any script.
```powershell
Set-ExecutionPolicy unrestricted -Force
```

Recommended ExecutionPolicy

```powershell
Set-ExecutionPolicy remotesigned -Force
```

Command to similar to `nautilus .`

```powershell
invoke-item .
```

Command to unblock file.

```powershell
unblock-file c:\scripts\downloaded.ps1
```

### PowerShell Scope 


- [x] Global
- [x] Script
- [x] Private
- [x] Numbered Scope

### Demonstration: Understanding Scope  

```powershell
get-content c:\scripts\setx.ps1

write-host "I am running a script" -ForegroundColor Green
if ($x) {
    Write-host "Found an existing variable with a value of $x" -ForegroundColor yellow
}
[int32]$x = Read-host "Enter a new value forx"
Write-Host "Setting $x to $x" -ForegroundColor Green

#do something with $x
$x+$x
```

```powershell
c:\scripts\setx.ps1
```

By default powershell doesn't store the variable after script execution
```powershell
$x
```

```powershell
$x = 42
```
When you execute below command, it will throw warning saying existing variable found.

```powershell
c:\scripts\setx.ps1
```

```powershell
get-content c:\scripts\setx2.ps1

write-host "I am running a script" -ForegroundColor Green
if ($x) {
    Write-Host "Found an existing variable with a value of $x" -ForegroundColor yellow
}
#do something with $x
$x+$x
```

```powershell
c:\scripts\setx2.ps1
```

```powershell
$x = "abc"
```

```powershell
c:\scripts\setx2.ps1
```

```powershell
help about_scopes
```

### Demonstration: PowerShell Profiles

```powershell
$profile
```

```powershell
$profile | Select *host* | format-list
```

```powershell
new-item $profile -Force
```

```powershell
add-content -Value 'cd c:\scripts' -Path $profile
```

```powershell
add-content -Value '$var = 123' -Path $profile
```

```powershell
add-content -Value '$host.privatedata.errorforegroundcolor="green"' -Path $profile
```

```powershell
add-content -Value 'Write-Host "Hello Art. Have a nice day" -foregroundcolor magenta' -path $profile
```

```powershell
new-item $profile.CurrentUserAllHosts -Force
```

```powershell
add-content -Value "set-alias np Notepad" -Path $profie.CurrentUserAllHosts
```

```powershell
help about_profile
```

```powershell
$profile
```

```powershell
$profile.CurrentUserCurrentHosts
```

```powershell
$profile.CurrentUserAllHosts
```

```powershell
$profile.AllUsersAllHosts
```

```powershell
$profile.AllUsersCurrentHost
```

## Put it in Writing 

### Why Scripts ?

- [x] Automate repetitive and low value tasks
- [x] Ensure consistency
- [x] Manage at scale
- [x] Enhance your career

- A basic script is a text file with a .ps1 file extension.
- Use `#` or `<#..#>` to indicate comments
- Runs from start to finish
- Runs with your credentials


### Demonstration: Creating a Basic Script

```powershell
Get-Eventlog System -EntryType Error -Newest 1000
```

```powershell
basicscript.ps1

#get a breakdown of error sources in the System eventlog

#start with a command that works in the console
$computername = $env:computername
$data = Get-Eventlog System -EntryType Error -Newest 1000 -ComputerName $Computername |
Group -Property Source -NoElement 

#create an HTML report
$title = "System Log Analysis"
$footer = "<h5>report run $(Get-Date)</h5>"
$css = "http://jdhitsolutions.com/sample.css"

$data | Sort -Property Count,Name -Descending |
Select Count,Name | 
ConvertTo-Html -Title $Title -PreContent "<H1>$Computername</H1>" -PostContent $footer -CssUri $css |
Out-File c:\work\systemsources.html

# Invoke-Item c:\work\systemsources.html
```

### Adding Script Parameters

- [x] Avoid hard-coding values
- [x] Provide flexibility to the user
- [x] You can set defaults

__Use Param() at beginning of your script__
__Define a variable for each parameter__
  - Separated by a comma 
__You can set a default value__

### Demonstration: Creating a Parameterized Script


```powershell
paramscript.ps1

#get a breakdown of error sources in the System eventlog

Param(
    [string]$Log = "System",
    [string]$Computername = $env:COMPUTERNAME,
    [int32]$Newest = 500,
    [string]$ReportTitle = "Event Log Report",
    [Parameter(Mandatory,HelpMessage = "Enter the path for the HTML file.")]
    [string]$Path
)

#get event log data and group it
$data = Get-Eventlog -logname $Log -EntryType Error -Newest $newest -ComputerName $Computername |
    Group-object -Property Source -NoElement 

#create an HTML report
$footer = "<h5><i>report run $(Get-Date)</i></h5>"
$css = "http://jdhitsolutions.com/sample.css"
$precontent = "<H1>$Computername</H1><H2>Last $newest error sources from $Log</H2>"

$data |Sort-Object -Property Count, Name -Descending |
    Select-Object Count, Name | 
    ConvertTo-Html -Title $ReportTitle -PreContent $precontent  -PostContent $footer -CssUri $css |
    Out-File -FilePath $Path
# Invoke-Item c:\work\systemsources.html
```

```powershell
help .\paramscript.ps1
```

```powershell
.\paramscript.ps1 -Computername srv1 -Log application -Path c:\work\b.html
```

## Scripting Techniques

### If Statements

```powershell

If (<some condition is true>) {
 <do something>
}
```

Run code or do something IF a condition is true  
You will need to know how to use comparison operators  
No End If required  

```powershell

If (<some condition is true>) {
 <do something>
}
Else
{
 <do something else if it isn't true>
}
```
You can include an Else option  
Powershell doesn't care about {} positions  
But be consistent  

```powershell
If (<some condition is true>) {
 <do something>
}
ElseIf (<some condition is true>)
{
 <do something else if it isn't true>
Else {
 <do something else if none of the tests are true>
 }
}
```
You can include an ElseIf option  
  - Use as many as you want  
PowerShell runs code for first matching condition  
Final Else is option  


```powershell
if (Test-Path c:\files\data.txt) {
    $data = Get-Content c:\files\data.txt
}
else {
    Write-Warning "Can't find c:\files.data.txt"
}

#Script continues....
```

```powershell
$age = 42
if ($age -ge 55) {
    $category = "alpha"
}
elseif ($age -ge 40) {
    $category = "bravo"
}
elseif ($age -ge 25) {
    $category = "gamma"
}
else {
    $category = "omega"
}
```

### Enumerations  

- ForEach-Object
- ForEach 

```powershell
2,5,6,8,9 | ForEach { $_ * 3 }
```
__ForEach-Object__  
Has an alias of 'ForEach'  
Use when you want to process pipelined objects one at a time  
Use when parameter binding won't work  

```powershell
Get-Content computers.txt | Foreach-Obect{
Get-Smbshare -CimSession $_ | Where ( -Not $_.special )
} | Select PSComputername,Name,Path,Description
```
__ForEach Enumerator__  
For each something in a group of things, run these commands  
You can use whatever variable you want  
Does not pass objects down the pipeline  

```powershell
$n = 1..10  
foreach ($item in $n) {
    $file = "TestFile-$item.txt"
    New-Item $file
}
```

### Arrays  

An array is a collection of things  
- Created automatically  
- `$arr = @()`  

Typically the same object but not required  
Powershell wil automatically "unroll" an array  
But you can reference items by index number  
- 0 based index  
- -1 to start at the end  

```powershell
C:\> $n = 1..5 -> The variable N is an array of numbers
```

```powershell
C:\> $n.count -> Count the number of elements in the array
```

```powershell
C:\> $n -> PowerShell unrolls the array
1
2
3
4
5
```

```powershell
C:\> $n[1] -> Access an item by index number
2
```

```powershell
C:\> $s = Get-Service -> Create an array of services
```

```powershell
C:\> $s[-1].Name -> You can also use an index number starting to the end
```

```powershell
help about_arrays -> read the help
```

```powershell
$arr = @() -> Create an empty array
```

```powershell
$arr += 100 -> Add an item to the array
```

```powershell
$b = "jeff","jason","don","tim","adam" -> Comma seperated items are treated as an array
```

```powershell
$b -is [array] -> Test if something is an array
```

### Hashables  

- Collection of Key/Value pairs  
- AKA dictionary object  
- Used extensively in PowerShell  

```powershell
PS C:\> $hash=@{Name="jeff"} -> @{key = Vaule}
```

```powershell
PS C:\> $hash=@{Name="jeff";
Color="green"; Version =
$PSVersionTable.PSVersion}  -> Seperate entries with ; or new line 
```

```powershell
$hash
```

```powershell
PS C:\> $hash.Add("foo",1)
PS C:\> $hash.Color = "red"
```

```powershell
$h = [ordered]@{
  Name = 'Jeff'
  Color = 'green'
  Version = $psversiontable.psversion
}
```

__Ordered hashtable__  

Entries displayed in order entry  
Use [ordered] accelerator  
Entries added later will be displayed in entry order  

```powershell
$params = @{
  Computername = 'Server01'
  Classname = 'win32_logicaldisk'
  Filter = "deviceid='C:'"
  Verbose = $True
}
Get-CimInstance @params
```
__Splatting__  

Define a hashtable ofparameter names and values  
"Splat" the hashtable to the command  
Use the @ symbol to reference the hashtable  

### Objects in the pipeline  

 - Select-Object
 - New-Object  
 - [pscustomobject]

 ```powershell
dir c:\work -file |
Select-Object Name,LastWriteTime,
@{Name="Size";
Expression={$_.Length}},
@{Name="Age";Expression={(Get-Date) - $_.lastwritetime}} |
Sort Age -Descending | 
Select-Object -first 10
 ```

 ```powershell
$f = dir c:\work -file
$n = Get-Date
foreach ($file in $f) {
  $h=@{
    Name     = $file.name
    Modified = $file.LastWriteTime
    Size     = $file.length  
    Age      = $n - $file.lastwritetime
  }
  New-Object psobject -Property $h
}
 ```

 ```powershell
dir c:\work -file |
foreach-object {
  [pscustomobject]@{
  Name = $_.Name
  Size = $_.length
  Modified = $_.LastWriteTime
  Age = (Get-Date)-$_.LastWriteTime
  }
}
 ```

 ### Understanding Try/Catch  

 Try {
  <some code>
 }
 Catch {
  <the exception object: $_ >
 }

 __Try/Catch__  

 Try to run some command that will create a terminating exception  
 - ErrorAction Stop  
 Catch and handle any errors  

 There is an optional Finall block that runs regardless of error  

 ```powershell
$computername = "foo"
Try {
Get-Service bits -computername
$computername -ErrorAction Stop
}
Catch {
Write-Warning "Failed to get service from $computername.$($_.exception.message)"
}
```

```powershell
help about_try_catch_finally
```

### Demonstration: Scripting Techniques

```powershell
$a = 1..10
```

```powershell
$a.count
```

```powershell
$a -is [array]
```

```powershell
$a | Get-Member
```

```powershell
$a
```

```powershell
$a[0]
```

```powershell
$a | foreach-object { $_ *2 }
```

 ```powershell
$a | foreach-object { $_ *2 } | measure-object -sum
 ```

 ```powershell
foreach ($number in $a) { $number * 2}
 ```

 ```powershell
foreach ($number in $a) { $number * 2} | measure-object -sum
 ```

 ```powershell
$sum = 0
foreach ($number in $a) {$sum+= $number * 2}
$sum
 ```

 ```powershell
get-process | where starttime | 
select Name,ID,@{Name='Run';Expression={(Get-Date)-$_.starttime}} |
sort Run -Descending | Select -first 5
 ```

```powershell
get-process | where starttime | foreach {
[pscustomobject]@{
Name=$_.Name
ID=$_.Id
Run=((Get-Date)-$_Starttime)
}
} | Sort-Object Run -descending | Select -first 5
```

```powershell
ise c:\scripts\getdiskhistory.ps1
```
### Demonstration: Scripts in Action

```powershell
get-content GetDiskHistory.ps1

#get disk usage information and export it to a CSV file for trend reporting

Param(
    [string[]]$Computername = $env:COMPUTERNAME
)

#path to CSV file is hard coded because I always want to use this file
$CSV = "c:\work\diskhistory.csv"

#initialize an empty array
$data = @()

#define a hashtable of parameters to splat to Get-CimInstance
$cimParams = @{
    Classname   = "Win32_LogicalDisk"
    Filter      = "drivetype = 3" 
    ErrorAction = "Stop"
}

Write-Host "Getting disk information from $Computername" -ForegroundColor Cyan
foreach ($computer in $Computername) {
    Write-Host "Getting disk information from $computer." -ForegroundColor Cyan
    #update the hashtable on the fly
    $cimParams.Computername = $Computer
    Try {
        $disks = Get-CimInstance @cimparams

        $data += $disks | 
            Select-Object @{Name = "Computername"; Expression = {$_.SystemName}},
        DeviceID, Size, FreeSpace,
        @{Name = "PctFree"; Expression = { ($_.FreeSpace / $_.size) * 100}},
        @{Name = "Date"; Expression = {Get-Date}}
    } #try
    Catch {
        Write-Warning "Failed to get disk data from $($computer.toUpper()). $($_.Exception.message)"
    } #catch
} #foreach

#only export if there is something in $data
if ($data) {
    $data | Export-Csv -Path $csv -Append -NoTypeInformation
    Write-Host "Disk report complete. See $CSV." -ForegroundColor Green
}
else {
    Write-Host "No disk data found." -ForegroundColor Yellow
}

#sample usage
# .\GetDiskHistory.ps1 -Computername DOM1,FOO,Srv1,srv2
```
### Demonstration: Scripts in Action Part 2

```powershell
get-content DiskReport.ps1 
#run the daily disk report

Param (
    [string]$Path = "C:\Work\DiskHistory.csv",
    [string]$ReportPath = "C:\work"
)

#import CSV data
#verify the file exists
if (Test-Path -path $Path) {
    #everything imported into a CSV is a string so rebuild as an object
    #with properties of the correct type
    $data = Import-CSV -Path $path | foreach-object {
        [pscustomobject]@{
            Computername = $_.Computername
            DeviceID     = $_.DeviceID
            SizeGB       = ($_.size / 1GB) -as [int32]
            FreeGB       = ($_.freespace / 1GB)
            PctFree      = $_.PctFree -as [double]
            Date         = $_.Date -as [datetime]
        }
    }
    #group the history data by computername
    $grouped = $data | Group-Object -Property Computername
}
else {
    #if Test-Path fails, display a warning and exit the script
    Write-Warning "Can't find $Path."
    #bail out of the script
    Return
}

#save the results to a text file report

<#
 $header is a here string. This is a great way
 to create a multi-line string. The closing "@
 must be left justified 
#>

$header = @"
Disk History Report $((Get-Date).ToShortDateString())
******************************
Data Source = $Path

*************
Latest Check
*************
"@

#get a timestamp value. -Format value is case-sensitive
$timestamp = Get-Date -format yyyyMMdd
$OutputFile = "$timestamp-diskreport.txt"
$OutputPath = Join-Path -path $ReportPath -ChildPath $OutputFile

#define a hashtable of parameters for Out-File. 
#this will be splatted.
$outParams = @{
    FilePath = $OutputPath
    Encoding = "ASCII"
    Append   = $True
    Width    = 120
}

#splat the parameter hashtable
$header | Out-File @outParams

#get the last entry for each computer

$latest = foreach ($computer in $grouped) {
    #need to report for each deviceID on each computer
    $devices = $computer.Group  | Group-Object -Property DeviceID
    $devices | foreach-object {
        $_.Group | Sort-Object Date -Descending |  Select-object -first 1
    }    
}

#normally you wouldn't use Format cmdlets in a script. This is
#an exception because I want nicely formatted output in the text file.
$latest | Sort-Object -property Computername | 
    Format-Table -AutoSize | Out-file @outParams

#report on servers with low disk space
$header = @"
*******************
Low Diskpace <=30%
*******************
"@

$header | Out-File @outParams
$latest | Where-Object {$_.PctFree -le 30} | 
    Sort-Object -Property Computername |
    Format-Table -AutoSize | 
    Out-File @outParams

#report trending
#need to report for each deviceID on each computer
#group the data by a custom property. This may be a little advanced.
$all = $data | Group-object -property {"$($_.Computername) $($_.DeviceID)"}

$header = @"
**************************************
Change Percent between last 2 reports
**************************************
"@
$header | Out-File @outParams

$all | ForEach-Object {
    #get the 2 most recent entries for each device
    $checks = $_.group | 
    Sort-Object -Property date -Descending |
        Select-Object -first 2
        
    #calculate a percent change between the two entries
    "$($checks[0].Computername) Drive $($checks[0].DeviceID) had a change of $(($checks[0].PctFree - $checks[1].PctFree) -as [int32])%"
} | Out-File @outParams

$header = @"


*******************************
Percent Free Average Over Time
*******************************
"@
$header | Out-File @outParams

foreach ($computer in $all) {
    $stat = $computer.group | Measure-Object -property pctFree -Average
    "$($computer.name) = $($stat.Average -as [int32])%" | Out-File @outParams
} 

#write the report file to the pipeline
Get-Item -Path $OutputPath

#sample usage
# .\DiskReport
# open file to view
```

## PowerShell Fun

### Demonstration: Working with Strings

```PowerShell
$s = "powershell rocks!"
```

```powershell
$s | Get-Member | more
```

```powershell
$s.Length
```

```powershell
$s.ToUpper()
```

```powershell
$s | get-member substring
```

```powershell
$s.Substring.OverloadDefinitions
```

```powershell
$s.Substring(5)
```

```powershell
$s.Substring(1,4)
```

```powershell
$s.IndexOf("s")
```

```powershell
$s.LastIndexOf("s")
```

```powershell
$s.Replace("e","3")
```

```powershell
$name = $s.Replace("p","P").Replace("s","S")
```

```powershell
$name
```

```powershell
$t = 'a,b,c,d,e,f,g'
```

```powershell
$t
```

```powershell
$t -is [array]
```

```powershell
$split = $t.Split(",")
```

```powershell
$split
```

```powershell
$split -is [array]
```

```powershell
$alpha = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'
```

```powershell
$num = 0..9
```

```powershell
$char = '!,),@,(,/,*,$,&,^,%,[,],>,<'
```

```powershell
$arr = @()
```

```powershell
$arr+=$alpha.split(',') | Get-Random -count 5
```

```powershell
$arr[0] = $arr[0].toupper()
```

```powershell
$arr[-1] = $arr[-1].toupper()
```

```powershell
$arr += $num | Get-Random -count 2
```

```powershell
$arr += $char.split(',') | Get-Random -count 3
```

```powershell
($arr | Get-Random -Count $arr.count) -join ""
```

### Demonstration: Working with Dates  


```powershell
$now = Get-Date
```

```powershell
$now | get-member | more
```

```powershell
$now | select *
```

```powershell
$now.DayOfWeek
```

```powershell
$now.ToShortDateString()
```

```powershell
$now.ToShortTimeString()
```

```powershell
$now.ToUniversalTime()
```

```powershell
Get-Date -Format ddMMyyyy
```

```powershell
Get-Date -Format ddMMyyyy_hhmmss
```

```powershell
$now.AddDays(42)
```

```powershell
$now.AddDays(500)
```

```powershell
$now.AddDays(-60)
```

```powershell
"6/1/2018 9:10am" -as [datetime]
```

```powershell
Get-Date "6/1/2018 9:10AM"
```

```powershell
dir \\srv1\public -File
```

```powershell
$cutoff = (Get-Date).AddDays(-180).Date
```

```powershell
dir \\srv1\public -File | Where {$_.LastWriteTime -le $cutoff }
```

### Demonstration: Math Tricks

```powershell
[math]
```

```powershell
[math].GetMembers() | Select Name,MemberType -unique | sort MemberType,Name | more
```

```powershell
[math]::PI
```

```powershell
[math]::E
```

```powershell
[math]::pow.OverlaodDefinitions
```

```powershell
[math]::Pow(3,2)
```

```powershell
[math]::Sqrt(144)
```

```powershell
$n = 1234.5678
```

```powershell
[math]::Truncate($n)
```

```powershell
[math]::Round($n,2)
```

```powershell
$n -as [int]
```

```powershell
dir $env:temp -file -Recurse | Measure-Object Length -sum |
Select Count,@{Name="SumMB";Expression = {[math]::round($_.sum/1mb,3)}}
```

```powershell
Get-CimInstance win32_operatingsystem | Select *member*
```

```powershell
Get-CimInstance Win32_OperatingSystem -ComputerName $env:computername |
Select PSComputername,@{Name="TotalMemGB";Expression={$_.totalvisiblememorysize/1MB -as [int]}},
@{Name="FreeMemGB";Expression={[math]::Round(($_.freephysicalmemory/1Mb),4)}},
@{Name="PctFreeMem";Expression = {[math]::Round(($_.freephysicalmemory/$_.totalvisiblememorysize)*100,2
)}}
```

### Demonstration: Other Fun

```powershell
$wsh = new-object -com wscript.shell
```

```powershell
$wsh.Popup.OverloadDefinitions
```

```powershell
$wsh.Popup("Isn't this fun?",10,"PowerShell Automation",0+64)
```

```powershell
$wsh.Popup("Failed to do something. Do you want to try again?",-1,"Script Error",4+32)
```

```powershell
$host.ui.RawUI.WindowTitle
```

```powershell
$saved = $host.ui.RawUI.WindowTitle
```

```powershell
"dom1","srv1","srv2","win10" |
foreach-object{
$host.ui.RawUI.WindowTitle = "Querying uptime from $($_.toUpper())"
start-sleep -Seconds 2
Get-CimInstance win32_OperatingSystem -Computername $_ |
Select PSComputername,LastBootUpTime,
@{Name="Uptime";Expression={(Get-Date) - $_.LastBootUpTime}}
}
```

```powershell
$host.ui.RawUI.WindowTitle = $saved
```

```powershell
$host.ui.RawUI
```

```powershell
$host.ui.RawUI.backgroundColor = "black"
```

```powershell
$fg = $host.ui.RawUI.ForegroundColor
```

```powershell
get-service | foreach {
if ($_.status -eq 'stopped'){
$host.ui.RawUI.ForegroundColor = "red"
} else {
$host.ui.RawUI.ForegroundColor = $fg
}
$
}
```

```powershell
$host.ui.RawUI.ForegroundColor = $fg
```

```powershell
$host.ui.RawUI.backgroundColor = "darkmagenta"
```

```powershell
get-eventlog -Newest 10
```

```powershell
$PSDefaultParameterValues.Add("get-eventlog:logname","system")
$PSDefaultParameterValues.Add("get-CimInstance:verbose","$True")
$PSDefaultParameterValues
```

```powershell
get-eventlog -Newest 10
```

```powershell
get-eventlog -LogName application -Newest 10
```

```powershell
get-CimInstance Win32_NetworkAdapter
```

```powershell
$PSDefaultParameterValues.Remove("get-CimInstance:verbose")
```


```powershell
$PSDefaultParameterValues.Clear()
```

### Demonstration: A Practical Application  

```powershell
get-content Create-newADUser.ps1 
#create a temporary user in Active Directory
#This requires the ActiveDirectory PowerShell module from RSAT

Param(
    [Parameter(Mandatory, HelpMessage = "Enter the user name like 'Al Fredo'")]
    [String]$Name,
    [string]$Title,
    [string]$Description,
    [string]$Department
)

Write-Host "Creating temporary AD Account for $Name." -ForegroundColor Cyan
#split the name into first and last name
$first = $name.split(' ')[0]
$last = $name.split(' ')[1]

#create the samaccountname
if ($last.Length -gt 13) {
    $accountname = "$($first[0])$($last.Substring(0,13))"
}
else {
    $accountname = "$($first[0])$last"   
}
$upn = "$accountname@company.pri"

#create a password
#use these characters as the source
#no o(scar) or l(arry) characters to avoid confusing with zero and one.
$seed = "abcdefghijkmnpqrstuvwxyz0192837465)!(@*#&$^"
#get 9 random characters
$random9 = $seed.ToCharArray() | get-random -count 9
#join back to a string
$randomstring = $random9 -join ""

#this is a regular expression pattern to match on any character from a to z
[regex]$rx = "[a-z]"
#get the first matching alphabet character
$firstalpha = $rx.match($randomstring).value
#replace the first alphabet character with its upper case version
$plaintext = $randomstring.Replace($firstalpha, $firstalpha.toUpper())

#convert the password to a secure string for the New-ADUser cmdlet
$password = ConvertTo-SecureString -String $plaintext -AsPlainText -Force

#define a hashtable of parameter values to splat to New-ADUser
$new = @{
    DisplayName           = $Name
    GivenName             = $first
    Surname               = $last
    Name                  = $accountName
    samaccountname        = $accountName
    UserPrincipalName     = $upn
    enabled               = $True
    AccountExpirationDate = (Get-Date).AddDays(180).Date
    AccountPassword       = $password
    path                  = "OU=Employees,DC=company,DC=pri"
    Title                 = $Title
    Department            = $Department
    Description           = $Description
    ErrorAction           = "Stop"
}

Try {
    New-ADUser @new
    Write-Host "Created user $accountname that expires $($new.AccountExpirationDate). Password is $plaintext." -ForegroundColor Green
}
Catch {
    $wsh = new-object -com wscript.shell
    $msg = "Failed to create user $Name. $($_.exception.message)"
    #display a popup warning and force user to click ok
    $wsh.Popup($msg, -1, "New User", 0 + 48)
}
Finally {
    Write-Host "Finished $($myinvocation.MyCommand)" -ForegroundColor Cyan
}


<#
demo usage

$p = @{
    Name = "Matilda Fuzziwick" 
    Title = "Shipping Clerk" 
    Department = "Sales"
    Description = "Seasonal hire"
}
 
.\Create-newADUser.ps1 @p
 
get-aduser mfuzziwick -Properties title,department,description

#try to create the user again

#reset demo
 get-aduser mfuzziwick | remove-aduser -confirm:$false

#>
```

```powershell
$p = @{
Name = "Matilda Fuzziwick"
Title = "Shipping Clerk"
Department = "Sales"
Description = "Seasonal hire"
}
```

```powershell
.\Create-newADUser.ps1 @p
```

```powershell
get-aduser mfuzziwick -Properties title,department.description
```

## Walkthrough: Creating a Process Controller Script  

__Controller Script__  

A PowerShell script that orchestrates or runs other  
PowerShell commands, functions and scripts    

### Demonstration: Starting with a Command

```powershell
get-content demo1.ps1 
#region start with a basic command

Get-Volume -DriveLetter C -CimSession $env:computername |
Select-object PSComputername,DriveLetter,Size,SizeRemaining,
@{Name="PctFree";Expression={($_.SizeRemaining/$_.size)*100}}

#endregion

#region Fine tune the output

Get-Volume -CimSession $env:computername |
Where-Object {$_.DriveLetter} |
Select-Object @{Name="Computername";Expression={$_.PSComputername}},
DriveLetter,FileSystem,
@{Name="SizeGB";Expression={$_.size/1gb -as [int32]}},
@{Name="FreeGB";Expression={[math]::Round($_.SizeRemaining/1gb,2)}},
@{Name="PctFree";Expression={[math]::Round(($_.SizeRemaining/$_.size)*100,2)}}

#that's a lot to type!
#what else is a challenge?

#endregion

```

### Demonstration: Controller Scripts  

```powershell
get-content DriveReport.ps1 
#requires -version 5.0
#requires -module Storage

Param(
    [string[]]$Computername = $env:COMPUTERNAME
)

foreach ($computer in $Computername) {
    #verify computer is online
    if (Test-Connection -ComputerName $Computer -Count 2 -Quiet) {

        #still using Try/Catch because a computer may be online, but there
        #might be other issues connecting such as invalid credentials.
        Try {
            Write-Host "Getting volume data from $($computer.toUpper())" -ForegroundColor Cyan
            #get all volumes that have a DriveLetter assigned
            Get-Volume -CimSession $computer -ErrorAction Stop | Where-Object {$_.DriveLetter} |
                Select-Object @{Name = "Computername"; Expression = {$_.PSComputername.ToUpper()}},
            @{Name = "Drive"; Expression = {$_.DriveLetter}}, 
            FileSystem,
            @{Name = "SizeGB"; Expression = {$_.size / 1gb -as [int32]}},
            @{Name = "FreeGB"; Expression = {[math]::Round($_.SizeRemaining / 1gb, 2)}},
            @{Name = "PctFree"; Expression = {[math]::Round(($_.SizeRemaining / $_.size) * 100, 2)}}
        }
        Catch {
            Write-Warning "Can't get volume data from $($Computer.ToUpper()). %($_.Exception.Message)."
        }
    } #if test is ok
    else {
        Write-Warning "Can't ping $($Computer.ToUpper())."
    }
} #foreach computer
```

```powershell
.\DriveReport.ps1 
```

```powershell
.\DriveReport.ps1 -Computername srv2
```

```powershell
get-content RunReport.ps1 
#requires -version 5.0

#this script assumes all the other files are in the same directory 
#and your location is set to that directory

#Notice the full use of cmdlet and parameter names as well
#as my use of comments and code formatting.

#define a filename using the date
$filename = "$(Get-Date -Format "yyyyddMM")-VolumeReport.txt"

#construct a full path name using the current directory
$report = Join-Path -path . -ChildPath $filename

#verify computers.txt can be found
if (Test-Path -Path .\computers.txt) {

    #get the list of computers
    $computers = Get-Content -Path .\computers.txt

    #run the DriveReport script against the list of computers
    $data = .\DriveReport.ps1 -Computername $computers
  
    #only create the report if data is captured
    if ($data) {
        #Create a report header and save to the report file
        "Volume Report: $(Get-Date)" | Out-File -FilePath $filename
        "Run by: $($env:USERNAME)" | Out-File -FilePath $filename -append
        "**********************************" | Out-File -FilePath $filename -Append
  
        #Sort the volume data and format the results which are then
        #saved to the file. This is an exception case where using a
        #format cmdlet is acceptable.
        $data | 
            Sort-Object -Property Computername, Drive |
            Format-Table -GroupBy Computername -Property Drive, FileSystem, SizeGB, FreeGB, PctFree |
            Out-File -FilePath $report -Append

        #save missed computers to a separate text file
        $found = $data.computername | Select-Object -Unique
        $missed = $computers | Where-Object {$found -notcontains $_} 
        $missed | Out-File -filepath .\Offline.txt

        "Missed computers" |  Out-File -FilePath $filename -append
        $missed | foreach-object {$_.toUpper()} | Out-File -FilePath $filename -append

        Write-Host "Report finished. See $report." -ForegroundColor Green
    } #if $data
    else {
        Write-Warning "Failed to capture any volume information. Is DiskReport.ps1 in the same folder as this script?"
    }
}
else {
    Write-Warning "Can't find computers.txt."
}


```

```powershell
psedit filename.txt
```
## What's Next 

### Your PowerShell Action Plan 

```powershell
about_scripts
```

```powershell
about_scriptinghelp
```

```powershell
about_scripting_best_practices
```

```powershell
about_do
```

```powershell
about_while
```

```powershell
about_for
```

```powershell
about_switch
```

```powershell
about_*operators
```

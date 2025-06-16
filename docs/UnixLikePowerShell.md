# Unix Like PowerShell Commands

### Listing Files and Directories

Unix:
```shell
ls 
```
Powershell:
```powershell
Get-ChildItem
```

### Changing Directory

Unix:
```shell
cd
```
Powershell:
```powershell
Set-Location
```

### Copying Files/Directories

Unix:
```shell
cp
cp -R Tools ~/
```
Powershell:
```powershell
Copy-Item
Copy-Item -Path '.\Tools\' -Destination $env:USERPROFILE -Recurse
```

### Moving/Renaming Files/Directories

Unix:
```shell
mv
```
Powershell:
```powershell
Move-Item or Rename-Item
```

### Creating a New Directory

Unix:
```shell
mkdir
```
Powershell:
```powershell
New-Item -ItemType Directory -Name 'MyNewFolder'
```

### Creating a New file

Unix:
```shell
touch
touch MyFile{1..4}
```
Powershell:
```powershell
New-Item -ItemType File -Name "MyFile"
1..4 | ForEach-Object { New-Item -ItemType File -Name "MyFile$_" }
```

### Removing Files/Directories:

Unix:
```shell
rm
```
Powershell:
```powershell
Remove-Item
```

### Displaying File Contents

Unix:
```shell
cat
```
Powershell:
```powershell
Get-Content
```

### Environment Variables

Unix:
```shell
export 
echo $VARNAME
```
Powershell:
```powershell
$Env:VARNAME
echo $Env:VARNAME
```

### Getting Help

Unix:
```shell
man
```
Powershell:
```powershell
Get-Help
```

### Checking Process Status

Unix:
```shell
ps
```
Powershell:
```powershell
Get-Process
```

### Killing a Process

Unix:
```shell
kill
```
Powershell:
```powershell
Stop-Process
```

### System Information

Unix:
```shell
uname,lsb_release,df,free
```
Powershell:
```powershell
Get-WmiObject, Get-ComputerInfo
```

### Network Information:

Unix:
```shell
ifconfig,ping,netstat
```
Powershell:
```powershell
Get-NetAdapter, Test-Connection, Get-NetTCPConnection
```

### Tail logs

Unix:
```shell
tail -n7 ./MyFile1
```
Powershell:
```powershell
Get-Content -Tail 7 .\MyFile1
```

### Grep Commands

Unix:
```shell
grep 'Failed' ./Windows/iis.log
```
Powershell:
```powershell
Select-String -Path 'C:\Windows\iis.log' -Pattern 'Failed'
```

### uname commands

Unix:
```shell
uname -a
```
Powershell:
```powershell
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize
```

### Ping Commands

Unix:
```shell
ping -c 4 google.com
```
Powershell:
```powershell
Test-Connection google.com | Format-Table -AutoSize
```

### Find Commands

Unix:
```shell
find . -type f -iname "azure"
```
Powershell:
```powershell
Get-ChildItem -Filter "*azure*" -Recurse -File
```

### Grep Command with star search

Unix:
```shell
grep "5963" *
```
Powershell:
```powershell
Select-String -Path * -Pattern "5963"
```

### Grep to search recursively and list it 

Unix:
```shell
grep -Rl "5963" *
```
Powershell:
```powershell
Get-ChildItem -Path * -File | ForEach-Object {
    $file = $_
    if (Get-Content -Path $file.FullName | Select-String -Pattern "5963" -Quiet) {
        $file.FullName
    }
}
```

### cat and grep together

Unix:
```shell
cat filename.log | grep -i error
```

Powershell:
```powershell
Get-Content filename.log | Select-String -Pattern "error" -CaseSensitive:$false
```

### Zgrep combination

```powershell
function zgrep {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position=0)] [string]$Pattern,
        [Parameter(Mandatory, Position=1)] [string]$Path,
        [switch]$CaseSensitive
    )

    $reader = [IO.StreamReader]::new(
        [IO.Compression.GzipStream]::new(
            [IO.File]::OpenRead($Path),
            [IO.Compression.CompressionMode]::Decompress
        )
    )
    $reader.ReadToEnd() |
        Select-String -Pattern $Pattern -CaseSensitive:$CaseSensitive.IsPresent
}

# usage
zgrep error .\filename.log.gz              # like zgrep -i
zgrep error .\filename.log.gz -CaseSensitive  # like grep (case-sensitive)
```

__1 liner__

```powershell
# in any PowerShell
[IO.StreamReader]::new(
    [IO.Compression.GzipStream]::new(
        [IO.File]::OpenRead('filename.log.gz'),
        [IO.Compression.CompressionMode]::Decompress
    )
).ReadToEnd() |
    Select-String -Pattern 'error' -CaseSensitive:$false
```

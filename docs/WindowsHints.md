# Windows Hints

## Shortcuts for Run

```terminal
shell:startup
```

```terminal
shell:Programs
```

```terminal
shell:Common Programs
```

## Shortcuts for finding extension source

```terminal
cmd /c assoc .appx
```

```terminal
cmd /c ftype (cmd /c assoc .appx).Split('=')[1]
```

```powershell
$ext="C:\Prgram Files(x86)\APPX\appx-launcher-1.1\APPX.exe"
$file="C:\users\hemanth\AppData\Local\xyzapps\bitroidgui\hello-world.appx"
& $exe $file 2>&1 | Tee-Object C:\temp\appx.log
```

```powershell
$FileName="hello-world.appx"
$SearchPath="C:\Users\hemanth\

Get-ChildItem -Path $SearchPath -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq $FileName } | Select-Object FullName, Length, LastWriteTime
```

```powershell
cd C:\Users\%username%\AppData\Local
```

```powershell
certutil -dump ".\Desktop.lnk" | tee-object C:/temp/desktop_certutil_dump.log
```

```powershell
Format-Hex ".\Desktop.lnk" | tee-object C:/temp/desktop_hex_dump.log
```

## Command to launch JAVA based execution file, if enough logs are not captured

```powershell
& "C:\Program Files (x86)\APPX\appx-launcher-1.1\APPX.exe" 2>&1 | Tee-Object C:\temp\appx.log
```
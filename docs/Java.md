## Java commands

#### Command to Open Java Cache viewer

```shell
javaws -viewer
```

#### Command to clear cache for java webstart

```shell
javaws --uninstall
```

#### Command to import an app sliently

```shell
javaws -import https://example.com/app.jnlp
```

#### Command to clear all Java Web Start Cache

```shell
javaws -Xclearcache
```

#### Command to run an application without splash screen

```shell
javaws -Xnosplash https://example.com/app.jnlp
```

#### Java command to start with specific Memory

```shell
java -Xms<size> -Xmx<size> -jar your-application.jar
java -Xms512m -Xmx2g -jar myapp.jar
```

__-Xms<size>__: Initial memory the JVM starts with  
__-Xmx<size>__: Maximum memory the JVM is allowed to use.  

#### Windows bat script for java applet installation

```cmd
@echo off
set APPURL=http://example.com/app/prod-app.jnlp

echo DULS: Removing App
javaws -wait -uninstall %APPURL%

@echo DULS: Reinstalling APP
javaws -wait -import -shortcut -silent %APPURL%

@echo DULS: Starting APP
javaws %APPURL%
```


## ITRS Geneos

### What is ITRS Geneos

1. Infrastructure & Hardware Monitoring
2. Process Monitoring, i.e. Batch jobs, Information flow
3. Application Monitoring
4. Latency and feed handling
5. Database Monitoring
6. Network Monitoring
7. OS Monitoring
8. Market Data
9. and many more, splot over 130 plug-ins & 270 Flavours

It has a 3 Tier Architecture
-----------------------------

1. Visualization -> Through Active Console
2. Consolidation -> Gateways
3. Instrumentation -> Net Probes

## Geneos Architecture

__NetProbe:__ Runs as a process on the box  
__Dataviews:__ Which are simple tables of string  
__Samplers/Plugins:__ Thees terms are transposable  
__Gateways:__ Runs as a process on the box and dataviews are sent to the gateway

## Geneos Architecture Rule

```shell
if %processorTime > 90 then
    severity critical
    run "Geneos Alert"
elseif %processorTime > 80
    severity warning
else
    severity ok
endif
```

|Severity|Numeric Value|Colour|
|---|---|---|
|undefined|0|Grey|
|ok|1|green|
|warning|2|yellow|
|critical|3|red|

__Active Console:__ A standard windows application, run from .exe  
Provides a visualization on your environment in configurable GUI

## Geneos Architecture: Other Outputs

Gateways as follows below.

1. E-mail
2. SMS
3. Scripts
4. webpages
5. Databse(Not required for monitoring, just recording)

## Geneos Architecture: Setup and Persistence

Active Console -> Gateway Setup Editor

1. Edit & commit
2. Runtime Reconfiguration
3. Save the new setup
4. The gateway reconfigures the net probes

Example gateway"

```xml
<xmldoc>
  <gateway>
  </gateway>
</xmldoc>
```

##  3-Tier Architecture in details

__Visualization__ -> __Active Console__
1. Dockables
2. Dashboards

__Consolidation__ -> __Gateways__
1. Rules
2. Severity
3. Managed Entities

__Instrumentation__ -> __NetProbes__
1. Plugins
2. Samplers
3. Dataviews

## What is the default port for gateway

Connection Port: __7039__  
Listen Port: __7040__  

## How to download ITRS

1. Visit website: https://www.itrsgroup.com/
2. sign up and sign in
3. Download below files

geneos-desktop-activeconsole.windwos.SG.zip for windows  
gateway2.linux.GA.tar.gz for linux gateway  
netprobe.linux.GA.tar.gz  

## How to install gateway for active console

1. First create a folder with gateway

```shell
mkdir gateway
```

2. copy the download gatway zip file to folder

```shell
cp gateway*.gz gateway
```

3. extract the file inside folder

```shell
tar xvfz *gz
```

4. under templates folder there will be startup scripts templates, copy the start template script.

```shell
cp templates/start_gateway2.tmpl start_gateway
```

5. Edit start gateway script and make changes as below.  

**vi start_gateway__**
```shell
#./gateway.linux
nohup ./gateway.linux -log gateway2.log &
```

6. Later copy gateway setup templates

```shell
cp templates/gateway.setup.withdefaults.xml.templ gatway.setup.xml
```

7. edit gateway.setup.xml file

**vi gateway.setup.xml**
```xml
<gatewayName>SYSMON</gatewayName>
<listenport>7023</listenport>
```

8. Change permission and start the script.

```
chmod a+x start_gateway
```

```
./start_gateway
```

## How to install nodeprobe

1. create a folder netprobe

```shell
mkdir netprobe
```
2. copy the gzip file to folder

```shell
cp netprobe*gz netprobe/
```

3. Extract the gzip files

```shell
tar xvfz *gz
```

4. First setup gateway password.

```shell
cd ../gateway
```

5. create encrypted password

```shell
./gateway2.linux -pw itrsgroup
```

6. create startup script for netprobe with template

```shell
cp templates/start_netprobe.tmpl start_netprobe
```
7. edit the start up script

**vi start_netprobe**
```
setenv ENCODED_PASSWORD passwordhere
setenv NET_PORT 7024
setenv NAME sysmon_probe
commnt on all foreground netprobe
uncomment on all background netprobe

setenv LOG_FILENAME netprobe.log
switch($OS)
    case:
        nohup ./netprobe.sh &
```

8. Execute below script to start

```shell
./start_netprobe
```

## File Keyword Monitor (FKM)



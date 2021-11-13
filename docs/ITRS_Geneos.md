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


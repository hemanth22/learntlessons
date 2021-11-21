Powershell: Getting started
===========================

__3 important command__  

- `Get-Command`  
- `Get-Help`  
- `Get-Member`  

## Introduction to PowerShell  

Command to get services info

`Get-Service | More`  

Command to get services info which are stopped.

`Get-Service | Where-Object Status -eq 'Stopped'`  


Command to get services info which are stopped and brief information.  

`Get-Service | Where-Object Status -eq 'Stopped' | Select-Object Name, Status`  

Command to get services info and store.  

`$data = get-service | where-object Status -eq 'Stopped' | select-object Name,Status`  

Command to display stored data.  

  `$data`  
  
Command to write stored data to csv file.  

  `$data | out-file .\services.csv`  

Command to display output of the file.  

  `type .\services.csv`  

Command to export to excel csv format.  

  `$data | export-csv .\services.csv`  

Command to display content of the csv format file.  

  `Get-Content .\services.csv | More`  

Command to check powershell version.  

`$PSVersionTable`

```
Name                           Value
----                           -----
PSVersion                      5.1.17763.771
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.17763.771
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
```
Command to get count of commands available in powershell

```
PS C:\Users\Administrator> (get-command).count
8985
```

__RSAT__: `Remote Server Administration Tools`  


Command to find some commands.  

```
PS C:\Users\Administrator> get-command -Name *DHCP*

CommandType     Name                                               Version    S
                                                                              o
                                                                              u
                                                                              r
                                                                              c
                                                                              e
-----------     ----                                               -------    -
Cmdlet          Get-EC2DhcpOption                                  4.0.2.0    A
Cmdlet          New-EC2DhcpOption                                  4.0.2.0    A
Cmdlet          Register-EC2DhcpOption                             4.0.2.0    A
Cmdlet          Remove-EC2DhcpOption                               4.0.2.0    A
```
## PowerShell Basics  

### Command Basics  

```
Verb-Noun
Do something-To something
Get-Verb
```
Example parameter(-)  
```
Get-Service -ComputerName Client01
```
Find some specific verb.  

`Get-Verb -verb set | more`

Print verb specific information in a format.  

```
PS C:\Users\Administrator> Get-Verb -verb set | format-list


Verb  : Set
Group : Common
```

Print psversion in a format.  

```
PS C:\Users\Administrator> $PSVersionTable | Format-List


Name  : PSVersion
Value : 5.1.17763.771

Name  : PSEdition
Value : Desktop

Name  : PSCompatibleVersions
Value : {1.0, 2.0, 3.0, 4.0...}

Name  : BuildVersion
Value : 10.0.17763.771

Name  : CLRVersion
Value : 4.0.30319.42000

Name  : WSManStackVersion
Value : 3.0

Name  : PSRemotingProtocolVersion
Value : 2.3

Name  : SerializationVersion
Value : 1.1.0.1
```

Print a group info in a specific format.  

```
Get-Version -Group Security | Format-List
```

Command to launch the browser with link.  

```
start https://aka.ms/psverbs
```

### Working with Aliases

Command to check m* services.  

```
Get-Service -Name M* -ComputerName Client01,DC01
```
Command to get alias list.  
```
Get-Alias | More
```
Command to get definition of alias.  
```
get-alias -Definition *service*
```
Alias command with gsv.  
```
gsv -Name M* -ComputerName Client01,DC01
```
Help command example.
```
help gsv
```
Get-Command Examples
```
Get-Command -Verb Get -Noun *DNS*
Get-Command -Name *Fire* -CommandType Function
```
Get-Help Examples
```
Get-Help -Name Get-Command -Detailed
man -Name Get-Command -Detailed
Get-Help -Name *DNS*
```

Get-Help commands
```
Get-Help | More
```
Search help command
```
Get-Help *Service*
```
Help command
```
help get-service
```
Example command Help
```
help get-service -Examples
```
Example command help with full details
```
help get-service -full
```
command to display help on the command
```
help get-command
```
command to display help on the get-command with Examples
```
help get-command -Examples
```
command to take count of the objects
```
get-command -CommandType Function | measure-object
```
command to search with Name of the commands.
```
get-command -Name *Ip*
```
command to search with Name and module of the commands
```
get-command -Name *Ip* -Module NetTCPIP
```
Output:
```
PS C:\Users\Administrator> get-command -Name *Ip* -Module NetTCPIP

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           gip -> Get-NetIPConfiguration                      1.0.0.0    NetTCPIP
Function        Get-NetIPAddress                                   1.0.0.0    NetTCPIP
Function        Get-NetIPConfiguration                             1.0.0.0    NetTCPIP
Function        Get-NetIPInterface                                 1.0.0.0    NetTCPIP
Function        Get-NetIPv4Protocol                                1.0.0.0    NetTCPIP
Function        Get-NetIPv6Protocol                                1.0.0.0    NetTCPIP
Function        New-NetIPAddress                                   1.0.0.0    NetTCPIP
Function        Remove-NetIPAddress                                1.0.0.0    NetTCPIP
Function        Set-NetIPAddress                                   1.0.0.0    NetTCPIP
Function        Set-NetIPInterface                                 1.0.0.0    NetTCPIP
Function        Set-NetIPv4Protocol                                1.0.0.0    NetTCPIP
Function        Set-NetIPv6Protocol                                1.0.0.0    NetTCPIP
```
command for help on Get-NetIpaddress
```
help Get-NetIpAddress
```
Ip address command
```
Get-NetIpAddress
```
Get Ip address in format
```
PS C:\Users\Administrator> Get-NetIpAddress | Format-Table

ifIndex IPAddress                                       PrefixLength PrefixOrigin SuffixOrigin AddressState PolicyStore
------- ---------                                       ------------ ------------ ------------ ------------ -----------
4       fe80::2441:11f7:d540:2d57%4                               64 WellKnown    Link         Preferred    ActiveStore
1       ::1                                                      128 WellKnown    WellKnown    Preferred    ActiveStore
4       10.0.5.215                                                24 Dhcp         Dhcp         Preferred    ActiveStore
1       127.0.0.1                                                  8 WellKnown    WellKnown    Preferred    ActiveStore
```
command to make directory
```
md C:\Users\Username\hemanth
```
Command for help on history
```
help Get-History
```
command to invoke command from history
```
invoke-history -id 24
```
command to save output of history
```
Get-History | Out-File .\transcripts\history.txt
```
Command to clear history
```
Clear-History
```
command for transcript
```
PS C:\Users\Administrator> Start-Transcript -path .\Desktop\hemanth.txt -append
Transcript started, output file is .\Desktop\hemanth.txt
PS C:\Users\Administrator> Get-Service | Where-Object -Property Status -eq Stopped

Status   Name               DisplayName
------   ----               -----------
Stopped  AJRouter           AllJoyn Router Service
Stopped  ALG                Application Layer Gateway Service
Stopped  AppIDSvc           Application Identity
Stopped  AppMgmt            Application Management
Stopped  AppReadiness       App Readiness
Stopped  AppVClient         Microsoft App-V Client
Stopped  AppXSvc            AppX Deployment Service (AppXSVC)
Stopped  AudioEndpointBu... Windows Audio Endpoint Builder
Stopped  Audiosrv           Windows Audio
Stopped  AxInstSV           ActiveX Installer (AxInstSV)
Stopped  BITS               Background Intelligent Transfer Ser...
Stopped  BTAGService        Bluetooth Audio Gateway Service
Stopped  BthAvctpSvc        AVCTP service
Stopped  bthserv            Bluetooth Support Service
Stopped  camsvc             Capability Access Manager Service
Stopped  CaptureService_... CaptureService_210330
Stopped  cbdhsvc_210330     Clipboard User Service_210330
Stopped  cfn-hup            CloudFormation cfn-hup
Stopped  ClipSVC            Client License Service (ClipSVC)
Stopped  COMSysApp          COM+ System Application
Stopped  ConsentUxUserSv... ConsentUX_210330
Stopped  CscService         Offline Files
Stopped  defragsvc          Optimize drives
Stopped  DeviceAssociati... Device Association Service
Stopped  DeviceInstall      Device Install Service
Stopped  DevicePickerUse... DevicePicker_210330
Stopped  DevicesFlowUser... DevicesFlow_210330
Stopped  DevQueryBroker     DevQuery Background Discovery Broker
Stopped  diagnosticshub.... Microsoft (R) Diagnostics Hub Stand...
Stopped  DiagTrack          Connected User Experiences and Tele...
Stopped  DmEnrollmentSvc    Device Management Enrollment Service
Stopped  dmwappushservice   Device Management Wireless Applicat...
Stopped  DoSvc              Delivery Optimization
Stopped  dot3svc            Wired AutoConfig
Stopped  DsmSvc             Device Setup Manager
Stopped  DsSvc              Data Sharing Service
Stopped  Eaphost            Extensible Authentication Protocol
Stopped  EFS                Encrypting File System (EFS)
Stopped  embeddedmode       Embedded Mode
Stopped  EntAppSvc          Enterprise App Management Service
Stopped  FrameServer        Windows Camera Frame Server
Stopped  GraphicsPerfSvc    GraphicsPerfSvc
Stopped  hidserv            Human Interface Device Service
Stopped  HvHost             HV Host Service
Stopped  icssvc             Windows Mobile Hotspot Service
Stopped  IKEEXT             IKE and AuthIP IPsec Keying Modules
Stopped  InstallService     Microsoft Store Install Service
Stopped  KPSSVC             KDC Proxy Server service (KPS)
Stopped  KtmRm              KtmRm for Distributed Transaction C...
Stopped  lfsvc              Geolocation Service
Stopped  lltdsvc            Link-Layer Topology Discovery Mapper
Stopped  MapsBroker         Downloaded Maps Manager
Stopped  MSiSCSI            Microsoft iSCSI Initiator Service
Stopped  msiserver          Windows Installer
Stopped  NcaSvc             Network Connectivity Assistant
Stopped  Netlogon           Netlogon
Stopped  Netman             Network Connections
Stopped  NetSetupSvc        Network Setup Service
Stopped  NetTcpPortSharing  Net.Tcp Port Sharing Service
Stopped  NgcCtnrSvc         Microsoft Passport Container
Stopped  NgcSvc             Microsoft Passport
Stopped  PerfHost           Performance Counter DLL Host
Stopped  PhoneSvc           Phone Service
Stopped  PimIndexMainten... Contact Data_210330
Stopped  pla                Performance Logs & Alerts
Stopped  PolicyAgent        IPsec Policy Agent
Stopped  PrintNotify        Printer Extensions and Notifications
Stopped  PrintWorkflowUs... PrintWorkflow_210330
Stopped  PushToInstall      Windows PushToInstall Service
Stopped  QWAVE              Quality Windows Audio Video Experience
Stopped  RasAuto            Remote Access Auto Connection Manager
Stopped  RasMan             Remote Access Connection Manager
Stopped  RemoteAccess       Routing and Remote Access
Stopped  RemoteRegistry     Remote Registry
Stopped  RmSvc              Radio Management Service
Stopped  RpcLocator         Remote Procedure Call (RPC) Locator
Stopped  RSoPProv           Resultant Set of Policy Provider
Stopped  sacsvr             Special Administration Console Helper
Stopped  SCardSvr           Smart Card
Stopped  ScDeviceEnum       Smart Card Device Enumeration Service
Stopped  SCPolicySvc        Smart Card Removal Policy
Stopped  seclogon           Secondary Logon
Stopped  SecurityHealthS... Windows Security Service
Stopped  SEMgrSvc           Payments and NFC/SE Manager
Stopped  Sense              Windows Defender Advanced Threat Pr...
Stopped  SensorDataService  Sensor Data Service
Stopped  SensorService      Sensor Service
Stopped  SensrSvc           Sensor Monitoring Service
Stopped  SgrmBroker         System Guard Runtime Monitor Broker
Stopped  SharedAccess       Internet Connection Sharing (ICS)
Stopped  shpamsvc           Shared PC Account Manager
Stopped  smphost            Microsoft Storage Spaces SMP
Stopped  SNMPTRAP           SNMP Trap
Stopped  sppsvc             Software Protection
Stopped  SSDPSRV            SSDP Discovery
Stopped  ssh-agent          OpenSSH Authentication Agent
Stopped  SstpSvc            Secure Socket Tunneling Protocol Se...
Stopped  stisvc             Windows Image Acquisition (WIA)
Stopped  svsvc              Spot Verifier
Stopped  swprv              Microsoft Software Shadow Copy Prov...
Stopped  tapisrv            Telephony
Stopped  TieringEngineSe... Storage Tiers Management
Stopped  TrustedInstaller   Windows Modules Installer
Stopped  tzautoupdate       Auto Time Zone Updater
Stopped  UevAgentService    User Experience Virtualization Service
Stopped  UnistoreSvc_210330 User Data Storage_210330
Stopped  upnphost           UPnP Device Host
Stopped  UserDataSvc_210330 User Data Access_210330
Stopped  VaultSvc           Credential Manager
Stopped  vmicguestinterface Hyper-V Guest Service Interface
Stopped  vmicheartbeat      Hyper-V Heartbeat Service
Stopped  vmickvpexchange    Hyper-V Data Exchange Service
Stopped  vmicrdv            Hyper-V Remote Desktop Virtualizati...
Stopped  vmicshutdown       Hyper-V Guest Shutdown Service
Stopped  vmictimesync       Hyper-V Time Synchronization Service
Stopped  vmicvmsession      Hyper-V PowerShell Direct Service
Stopped  vmicvss            Hyper-V Volume Shadow Copy Requestor
Stopped  VSS                Volume Shadow Copy
Stopped  WaaSMedicSvc       Windows Update Medic Service
Stopped  WalletService      WalletService
Stopped  WarpJITSvc         WarpJITSvc
Stopped  WbioSrvc           Windows Biometric Service
Stopped  WdiServiceHost     Diagnostic Service Host
Stopped  WdiSystemHost      Diagnostic System Host
Stopped  Wecsvc             Windows Event Collector
Stopped  WEPHOSTSVC         Windows Encryption Provider Host Se...
Stopped  wercplsupport      Problem Reports and Solutions Contr...
Stopped  WerSvc             Windows Error Reporting Service
Stopped  WiaRpc             Still Image Acquisition Events
Stopped  wisvc              Windows Insider Service
Stopped  wlidsvc            Microsoft Account Sign-in Assistant
Stopped  wmiApSrv           WMI Performance Adapter
Stopped  WMPNetworkSvc      Windows Media Player Network Sharin...
Stopped  WPDBusEnum         Portable Device Enumerator Service
Stopped  WSearch            Windows Search
Stopped  wuauserv           Windows Update


PS C:\Users\Administrator> Stop-Transcript
Transcript stopped, output file is C:\Users\Administrator\Desktop\hemanth.txt
```
Transcript output
```
PS C:\Users\Administrator> type .\Desktop\hemanth.txt
**********************
Windows PowerShell transcript start
Start time: 20200125091923
Username: EC2AMAZ-PRBTS2H\Administrator
RunAs User: EC2AMAZ-PRBTS2H\Administrator
Configuration Name:
Machine: EC2AMAZ-PRBTS2H (Microsoft Windows NT 10.0.17763.0)
Host Application: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
Process ID: 4292
PSVersion: 5.1.17763.771
PSEdition: Desktop
PSCompatibleVersions: 1.0, 2.0, 3.0, 4.0, 5.0, 5.1.17763.771
BuildVersion: 10.0.17763.771
CLRVersion: 4.0.30319.42000
WSManStackVersion: 3.0
PSRemotingProtocolVersion: 2.3
SerializationVersion: 1.1.0.1
**********************
Transcript started, output file is .\Desktop\hemanth.txt
PS C:\Users\Administrator> Get-Service | Where-Object -Property Status -eq Stopped

Status   Name               DisplayName
------   ----               -----------
Stopped  AJRouter           AllJoyn Router Service
Stopped  ALG                Application Layer Gateway Service
Stopped  AppIDSvc           Application Identity
Stopped  AppMgmt            Application Management
Stopped  AppReadiness       App Readiness
Stopped  AppVClient         Microsoft App-V Client
Stopped  AppXSvc            AppX Deployment Service (AppXSVC)
Stopped  AudioEndpointBu... Windows Audio Endpoint Builder
Stopped  Audiosrv           Windows Audio
Stopped  AxInstSV           ActiveX Installer (AxInstSV)
Stopped  BITS               Background Intelligent Transfer Ser...
Stopped  BTAGService        Bluetooth Audio Gateway Service
Stopped  BthAvctpSvc        AVCTP service
Stopped  bthserv            Bluetooth Support Service
Stopped  camsvc             Capability Access Manager Service
Stopped  CaptureService_... CaptureService_210330
Stopped  cbdhsvc_210330     Clipboard User Service_210330
Stopped  cfn-hup            CloudFormation cfn-hup
Stopped  ClipSVC            Client License Service (ClipSVC)
Stopped  COMSysApp          COM+ System Application
Stopped  ConsentUxUserSv... ConsentUX_210330
Stopped  CscService         Offline Files
Stopped  defragsvc          Optimize drives
Stopped  DeviceAssociati... Device Association Service
Stopped  DeviceInstall      Device Install Service
Stopped  DevicePickerUse... DevicePicker_210330
Stopped  DevicesFlowUser... DevicesFlow_210330
Stopped  DevQueryBroker     DevQuery Background Discovery Broker
Stopped  diagnosticshub.... Microsoft (R) Diagnostics Hub Stand...
Stopped  DiagTrack          Connected User Experiences and Tele...
Stopped  DmEnrollmentSvc    Device Management Enrollment Service
Stopped  dmwappushservice   Device Management Wireless Applicat...
Stopped  DoSvc              Delivery Optimization
Stopped  dot3svc            Wired AutoConfig
Stopped  DsmSvc             Device Setup Manager
Stopped  DsSvc              Data Sharing Service
Stopped  Eaphost            Extensible Authentication Protocol
Stopped  EFS                Encrypting File System (EFS)
Stopped  embeddedmode       Embedded Mode
Stopped  EntAppSvc          Enterprise App Management Service
Stopped  FrameServer        Windows Camera Frame Server
Stopped  GraphicsPerfSvc    GraphicsPerfSvc
Stopped  hidserv            Human Interface Device Service
Stopped  HvHost             HV Host Service
Stopped  icssvc             Windows Mobile Hotspot Service
Stopped  IKEEXT             IKE and AuthIP IPsec Keying Modules
Stopped  InstallService     Microsoft Store Install Service
Stopped  KPSSVC             KDC Proxy Server service (KPS)
Stopped  KtmRm              KtmRm for Distributed Transaction C...
Stopped  lfsvc              Geolocation Service
Stopped  lltdsvc            Link-Layer Topology Discovery Mapper
Stopped  MapsBroker         Downloaded Maps Manager
Stopped  MSiSCSI            Microsoft iSCSI Initiator Service
Stopped  msiserver          Windows Installer
Stopped  NcaSvc             Network Connectivity Assistant
Stopped  Netlogon           Netlogon
Stopped  Netman             Network Connections
Stopped  NetSetupSvc        Network Setup Service
Stopped  NetTcpPortSharing  Net.Tcp Port Sharing Service
Stopped  NgcCtnrSvc         Microsoft Passport Container
Stopped  NgcSvc             Microsoft Passport
Stopped  PerfHost           Performance Counter DLL Host
Stopped  PhoneSvc           Phone Service
Stopped  PimIndexMainten... Contact Data_210330
Stopped  pla                Performance Logs & Alerts
Stopped  PolicyAgent        IPsec Policy Agent
Stopped  PrintNotify        Printer Extensions and Notifications
Stopped  PrintWorkflowUs... PrintWorkflow_210330
Stopped  PushToInstall      Windows PushToInstall Service
Stopped  QWAVE              Quality Windows Audio Video Experience
Stopped  RasAuto            Remote Access Auto Connection Manager
Stopped  RasMan             Remote Access Connection Manager
Stopped  RemoteAccess       Routing and Remote Access
Stopped  RemoteRegistry     Remote Registry
Stopped  RmSvc              Radio Management Service
Stopped  RpcLocator         Remote Procedure Call (RPC) Locator
Stopped  RSoPProv           Resultant Set of Policy Provider
Stopped  sacsvr             Special Administration Console Helper
Stopped  SCardSvr           Smart Card
Stopped  ScDeviceEnum       Smart Card Device Enumeration Service
Stopped  SCPolicySvc        Smart Card Removal Policy
Stopped  seclogon           Secondary Logon
Stopped  SecurityHealthS... Windows Security Service
Stopped  SEMgrSvc           Payments and NFC/SE Manager
Stopped  Sense              Windows Defender Advanced Threat Pr...
Stopped  SensorDataService  Sensor Data Service
Stopped  SensorService      Sensor Service
Stopped  SensrSvc           Sensor Monitoring Service
Stopped  SgrmBroker         System Guard Runtime Monitor Broker
Stopped  SharedAccess       Internet Connection Sharing (ICS)
Stopped  shpamsvc           Shared PC Account Manager
Stopped  smphost            Microsoft Storage Spaces SMP
Stopped  SNMPTRAP           SNMP Trap
Stopped  sppsvc             Software Protection
Stopped  SSDPSRV            SSDP Discovery
Stopped  ssh-agent          OpenSSH Authentication Agent
Stopped  SstpSvc            Secure Socket Tunneling Protocol Se...
Stopped  stisvc             Windows Image Acquisition (WIA)
Stopped  svsvc              Spot Verifier
Stopped  swprv              Microsoft Software Shadow Copy Prov...
Stopped  tapisrv            Telephony
Stopped  TieringEngineSe... Storage Tiers Management
Stopped  TrustedInstaller   Windows Modules Installer
Stopped  tzautoupdate       Auto Time Zone Updater
Stopped  UevAgentService    User Experience Virtualization Service
Stopped  UnistoreSvc_210330 User Data Storage_210330
Stopped  upnphost           UPnP Device Host
Stopped  UserDataSvc_210330 User Data Access_210330
Stopped  VaultSvc           Credential Manager
Stopped  vmicguestinterface Hyper-V Guest Service Interface
Stopped  vmicheartbeat      Hyper-V Heartbeat Service
Stopped  vmickvpexchange    Hyper-V Data Exchange Service
Stopped  vmicrdv            Hyper-V Remote Desktop Virtualizati...
Stopped  vmicshutdown       Hyper-V Guest Shutdown Service
Stopped  vmictimesync       Hyper-V Time Synchronization Service
Stopped  vmicvmsession      Hyper-V PowerShell Direct Service
Stopped  vmicvss            Hyper-V Volume Shadow Copy Requestor
Stopped  VSS                Volume Shadow Copy
Stopped  WaaSMedicSvc       Windows Update Medic Service
Stopped  WalletService      WalletService
Stopped  WarpJITSvc         WarpJITSvc
Stopped  WbioSrvc           Windows Biometric Service
Stopped  WdiServiceHost     Diagnostic Service Host
Stopped  WdiSystemHost      Diagnostic System Host
Stopped  Wecsvc             Windows Event Collector
Stopped  WEPHOSTSVC         Windows Encryption Provider Host Se...
Stopped  wercplsupport      Problem Reports and Solutions Contr...
Stopped  WerSvc             Windows Error Reporting Service
Stopped  WiaRpc             Still Image Acquisition Events
Stopped  wisvc              Windows Insider Service
Stopped  wlidsvc            Microsoft Account Sign-in Assistant
Stopped  wmiApSrv           WMI Performance Adapter
Stopped  WMPNetworkSvc      Windows Media Player Network Sharin...
Stopped  WPDBusEnum         Portable Device Enumerator Service
Stopped  WSearch            Windows Search
Stopped  wuauserv           Windows Update


PS C:\Users\Administrator> Stop-Transcript
**********************
Windows PowerShell transcript end
End time: 20200125092115
**********************
```
### Objects in powershell.

- Powershell is based on object oriented which contains properties and methods.  
- Powershell treats data as object.  


Command to get members of the service.  
```
PS C:\Users\Administrator> Get-Service | Get-Member


   TypeName: System.ServiceProcess.ServiceController

Name                      MemberType    Definition
----                      ----------    ----------
Name                      AliasProperty Name = ServiceName
RequiredServices          AliasProperty RequiredServices = ServicesDependedOn
Disposed                  Event         System.EventHandler Disposed(System.Object, System.EventArgs)
Close                     Method        void Close()
Continue                  Method        void Continue()
CreateObjRef              Method        System.Runtime.Remoting.ObjRef CreateObjRef(type requestedType)
Dispose                   Method        void Dispose(), void IDisposable.Dispose()
Equals                    Method        bool Equals(System.Object obj)
ExecuteCommand            Method        void ExecuteCommand(int command)
GetHashCode               Method        int GetHashCode()
GetLifetimeService        Method        System.Object GetLifetimeService()
GetType                   Method        type GetType()
InitializeLifetimeService Method        System.Object InitializeLifetimeService()
Pause                     Method        void Pause()
Refresh                   Method        void Refresh()
Start                     Method        void Start(), void Start(string[] args)
Stop                      Method        void Stop()
WaitForStatus             Method        void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus), void WaitForStatus(System.ServiceProcess.ServiceControllerStatus de...
CanPauseAndContinue       Property      bool CanPauseAndContinue {get;}
CanShutdown               Property      bool CanShutdown {get;}
CanStop                   Property      bool CanStop {get;}
Container                 Property      System.ComponentModel.IContainer Container {get;}
DependentServices         Property      System.ServiceProcess.ServiceController[] DependentServices {get;}
DisplayName               Property      string DisplayName {get;set;}
MachineName               Property      string MachineName {get;set;}
ServiceHandle             Property      System.Runtime.InteropServices.SafeHandle ServiceHandle {get;}
ServiceName               Property      string ServiceName {get;set;}
ServicesDependedOn        Property      System.ServiceProcess.ServiceController[] ServicesDependedOn {get;}
ServiceType               Property      System.ServiceProcess.ServiceType ServiceType {get;}
Site                      Property      System.ComponentModel.ISite Site {get;set;}
StartType                 Property      System.ServiceProcess.ServiceStartMode StartType {get;}
Status                    Property      System.ServiceProcess.ServiceControllerStatus Status {get;}
ToString                  ScriptMethod  System.Object ToString();
```
Pipeline in powershell example.  
```
get-service | where-object status -eq "Stopped" | start-service
```
Command to get service with limited objects output
```
Get-Service | Select-Object Name,MachineName,Status
```
Command to get services and it's object.
```
PS C:\Users\Administrator> Get-Service | Select-Object Name,MachineName,Status | Get-Member


   TypeName: Selected.System.ServiceProcess.ServiceController

Name        MemberType   Definition
----        ----------   ----------
Equals      Method       bool Equals(System.Object obj)
GetHashCode Method       int GetHashCode()
GetType     Method       type GetType()
ToString    Method       string ToString()
MachineName NoteProperty string MachineName=.
Name        NoteProperty string Name=AJRouter
Status      NoteProperty ServiceControllerStatus Status=Stopped
```
Command to get service using where object.  

```
Get-Service | Where-Object status -eq "Stopped" | More
```

Command to get stopped services in computer.  

```
Get-Service -ComputerName Client01,DC01 | Where-Object status -eq "Stopped" | Select-Object Name,MachineName,Status | Sort-Object -Property MachineName | More
```

## Gathering information with powershell.  

Command to find the Fir related Command

```
PS C:\Users\Administrator> Get-Command -Name *Fir*
```
Output:
```
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Copy-NetFirewallRule                               2.0.0.0    NetSecurity
Function        Disable-NetFirewallRule                            2.0.0.0    NetSecurity
Function        Enable-NetFirewallRule                             2.0.0.0    NetSecurity
Function        Get-NetFirewallAddressFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallApplicationFilter                   2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceFilter                     2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceTypeFilter                 2.0.0.0    NetSecurity
Function        Get-NetFirewallPortFilter                          2.0.0.0    NetSecurity
Function        Get-NetFirewallProfile                             2.0.0.0    NetSecurity
Function        Get-NetFirewallRule                                2.0.0.0    NetSecurity
Function        Get-NetFirewallSecurityFilter                      2.0.0.0    NetSecurity
Function        Get-NetFirewallServiceFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallSetting                             2.0.0.0    NetSecurity
Function        Get-StorageFirmwareInformation                     2.0.0.0    Storage
Function        New-NetFirewallRule                                2.0.0.0    NetSecurity
Function        Remove-NetFirewallRule                             2.0.0.0    NetSecurity
Function        Rename-NetFirewallRule                             2.0.0.0    NetSecurity
Function        Set-NetFirewallAddressFilter                       2.0.0.0    NetSecurity
Function        Set-NetFirewallApplicationFilter                   2.0.0.0    NetSecurity
Function        Set-NetFirewallInterfaceFilter                     2.0.0.0    NetSecurity
Function        Set-NetFirewallInterfaceTypeFilter                 2.0.0.0    NetSecurity
Function        Set-NetFirewallPortFilter                          2.0.0.0    NetSecurity
Function        Set-NetFirewallProfile                             2.0.0.0    NetSecurity
Function        Set-NetFirewallRule                                2.0.0.0    NetSecurity
Function        Set-NetFirewallSecurityFilter                      2.0.0.0    NetSecurity
Function        Set-NetFirewallServiceFilter                       2.0.0.0    NetSecurity
Function        Set-NetFirewallSetting                             2.0.0.0    NetSecurity
Function        Show-NetFirewallRule                               2.0.0.0    NetSecurity
Function        Update-StorageFirmware                             2.0.0.0    Storage
Cmdlet          Confirm-CGIPForgotPassword                         4.0.1.1    AWSPowerShell
Cmdlet          Confirm-CGIPUserRegistration                       4.0.1.1    AWSPowerShell
Cmdlet          Confirm-CGIPUserRegistrationAdmin                  4.0.1.1    AWSPowerShell
Cmdlet          Confirm-CPJob                                      4.0.1.1    AWSPowerShell
Cmdlet          Confirm-CPThirdPartyJob                            4.0.1.1    AWSPowerShell
Cmdlet          Confirm-DCConnection                               4.0.1.1    AWSPowerShell
Cmdlet          Confirm-DCDirectConnectGatewayAssociationProposal  4.0.1.1    AWSPowerShell
Cmdlet          Confirm-DCPrivateVirtualInterface                  4.0.1.1    AWSPowerShell
Cmdlet          Confirm-DCPublicVirtualInterface                   4.0.1.1    AWSPowerShell
Cmdlet          Confirm-DCTransitVirtualInterface                  4.0.1.1    AWSPowerShell
Cmdlet          Confirm-DSSharedDirectory                          4.0.1.1    AWSPowerShell
Cmdlet          Confirm-EC2EndpointConnection                      4.0.1.1    AWSPowerShell
Cmdlet          Confirm-EC2ProductInstance                         4.0.1.1    AWSPowerShell
Cmdlet          Confirm-EC2ReservedInstancesExchangeQuote          4.0.1.1    AWSPowerShell
Cmdlet          Confirm-EC2TransitGatewayVpcAttachment             4.0.1.1    AWSPowerShell
Cmdlet          Confirm-GDInvitation                               4.0.1.1    AWSPowerShell
Cmdlet          Confirm-GMLMatch                                   4.0.1.1    AWSPowerShell
Cmdlet          Confirm-IOTCertificateTransfer                     4.0.1.1    AWSPowerShell
Cmdlet          Confirm-IOTTopicRuleDestination                    4.0.1.1    AWSPowerShell
Cmdlet          Confirm-ORGHandshake                               4.0.1.1    AWSPowerShell
Cmdlet          Confirm-PINPhoneNumber                             4.0.1.1    AWSPowerShell
Cmdlet          Confirm-RAMResourceShareInvitation                 4.0.1.1    AWSPowerShell
Cmdlet          Confirm-RDSDTransaction                            4.0.1.1    AWSPowerShell
Cmdlet          Confirm-SecureBootUEFI                             2.0.0.0    SecureBoot
Cmdlet          Confirm-SESDomainDkim                              4.0.1.1    AWSPowerShell
Cmdlet          Confirm-SESDomainIdentity                          4.0.1.1    AWSPowerShell
Cmdlet          Confirm-SESEmailAddress                            4.0.1.1    AWSPowerShell
Cmdlet          Confirm-SESEmailIdentity                           4.0.1.1    AWSPowerShell
Cmdlet          Confirm-SHUBInvitation                             4.0.1.1    AWSPowerShell
Cmdlet          Confirm-SNSSubscription                            4.0.1.1    AWSPowerShell
Cmdlet          Send-CGIPConfirmationCode                          4.0.1.1    AWSPowerShell
Application     cofire.exe                                         10.0.17... C:\Windows\system32\cofire.exe
Application     Firewall.cpl                                       10.0.17... C:\Windows\system32\Firewall.cpl
```
Commmand to find Get command of Fir. 
```
PS C:\Users\Administrator> Get-Command -Name Get-*Fir*
```
Output:
```
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-NetFirewallAddressFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallApplicationFilter                   2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceFilter                     2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceTypeFilter                 2.0.0.0    NetSecurity
Function        Get-NetFirewallPortFilter                          2.0.0.0    NetSecurity
Function        Get-NetFirewallProfile                             2.0.0.0    NetSecurity
Function        Get-NetFirewallRule                                2.0.0.0    NetSecurity
Function        Get-NetFirewallSecurityFilter                      2.0.0.0    NetSecurity
Function        Get-NetFirewallServiceFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallSetting                             2.0.0.0    NetSecurity
Function        Get-StorageFirmwareInformation                     2.0.0.0    Storage
```
Command to find NetFir.  

```
PS C:\Users\Administrator> Get-Command -Name Get-NetFir*
```
Output:
```
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-NetFirewallAddressFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallApplicationFilter                   2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceFilter                     2.0.0.0    NetSecurity
Function        Get-NetFirewallInterfaceTypeFilter                 2.0.0.0    NetSecurity
Function        Get-NetFirewallPortFilter                          2.0.0.0    NetSecurity
Function        Get-NetFirewallProfile                             2.0.0.0    NetSecurity
Function        Get-NetFirewallRule                                2.0.0.0    NetSecurity
Function        Get-NetFirewallSecurityFilter                      2.0.0.0    NetSecurity
Function        Get-NetFirewallServiceFilter                       2.0.0.0    NetSecurity
Function        Get-NetFirewallSetting                             2.0.0.0    NetSecurity
```
Command to get NetFirewallRule in get-member
```
PS C:\Users\Administrator> Get-Command Get-NetFirewallRule | gm
```
Output
```

   TypeName: System.Management.Automation.FunctionInfo

Name                MemberType     Definition
----                ----------     ----------
Equals              Method         bool Equals(System.Object obj)
GetHashCode         Method         int GetHashCode()
GetType             Method         type GetType()
ResolveParameter    Method         System.Management.Automation.ParameterMetadata ResolveParameter(string name)
ToString            Method         string ToString()
CmdletBinding       Property       bool CmdletBinding {get;}
CommandType         Property       System.Management.Automation.CommandTypes CommandType {get;}
DefaultParameterSet Property       string DefaultParameterSet {get;}
Definition          Property       string Definition {get;}
Description         Property       string Description {get;set;}
HelpFile            Property       string HelpFile {get;}
Module              Property       psmoduleinfo Module {get;}
ModuleName          Property       string ModuleName {get;}
Name                Property       string Name {get;}
Noun                Property       string Noun {get;}
Options             Property       System.Management.Automation.ScopedItemOptions Options {get;set;}
OutputType          Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.PSTypeName] OutputType {get;}
Parameters          Property       System.Collections.Generic.Dictionary[string,System.Management.Automation.ParameterMetadata] Parameters {get;}
ParameterSets       Property       System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.CommandParameterSetInfo] ParameterSets {get;}
RemotingCapability  Property       System.Management.Automation.RemotingCapability RemotingCapability {get;}
ScriptBlock         Property       scriptblock ScriptBlock {get;}
Source              Property       string Source {get;}
Verb                Property       string Verb {get;}
Version             Property       version Version {get;}
Visibility          Property       System.Management.Automation.SessionStateEntryVisibility Visibility {get;set;}
HelpUri             ScriptProperty System.Object HelpUri {get=$oldProgressPreference = $ProgressPreference...

```
Command for NetFirewallRule.  

```
Get-NetFirewallRule
Get-NetFirewallRule -Name *Remote*
Get-NetFirewallRule -Name *RemoteDesktop*
```
Command to display Get-NetFirewallRule in format table
```
PS C:\Users\Administrator> Get-NetFirewallRule -Name *RemoteDesktop* | FT
```
Output:
```
Name                          DisplayName                         DisplayGroup               Enabled Profile                 Direction Action
----                          -----------                         ------------               ------- -------                 --------- ------
RemoteDesktop-UserMode-In-TCP Remote Desktop - User Mode (TCP-In) Remote Desktop             True    Domain, Private, Public Inbound   Allow
RemoteDesktop-UserMode-In-UDP Remote Desktop - User Mode (UDP-In) Remote Desktop             True    Domain, Private, Public Inbound   Allow
RemoteDesktop-Shadow-In-TCP   Remote Desktop - Shadow (TCP-In)    Remote Desktop             True    Domain, Private, Public Inbound   Allow
RemoteDesktop-In-TCP-WS       Remote Desktop - (TCP-WS-In)        Remote Desktop (WebSocket) False   Any                     Inbound   Allow
RemoteDesktop-In-TCP-WSS      Remote Desktop - (TCP-WSS-In)       Remote Desktop (WebSocket) False   Any                     Inbound   Allow
```
Command to display and set NetFirewallRule
```
PS C:\Users\Administrator> Get-NetFirewallRule -Name *RemoteDesktop* | Set-NetFirewallRule -Enabled 'True' -WhatIf
What if: Set-NetFirewallRule DisplayName: RemoteDesktop-Shadow-In-TCP
What if: Set-NetFirewallRule DisplayName: RemoteDesktop-UserMode-In-UDP
What if: Set-NetFirewallRule DisplayName: RemoteDesktop-UserMode-In-TCP
What if: Set-NetFirewallRule DisplayName: RemoteDesktop-In-TCP-WSS
What if: Set-NetFirewallRule DisplayName: RemoteDesktop-In-TCP-WS
```
__Windows Management Instrumentation (WMI)__
- Get-WMIobject  
__Common Information Model(CIM)__  
- Get-Ciminstance  


Counter command examples
```
Get-Command *Counter*
Get-Counter
Get-Counter -ListSet *memory*
Get-Counter -ListSet Memory
Get-Counter -ListSet Memory | select -Expand Counter
Get-Counter -Counter "\Memory\Pages/Sec","\Memory\% Committed Bytes In Use" | FT
```
##### Demo: Wmiobject and CimClass.  
```
Get-WmiObject -List *
Get-CimClass -ClassName *
Get-CimClass -ClassName *Memory*
Get-WMIobject -class Win32_PhysicalMemory
Get-Ciminstance -ClassName Win32_PhysicalMemory | select Tag,Capacity
```
#### Demo: working with networks.  
```
ipconfig
ipconfig /all
ipconfig | gm
get-command get-NetIp*
Get-NetIPAddress
get-command get-NetIp*
Get-NetIPConfiguration
GCM get-*DNS*
GCM get-DNSClient*
Get-DnsClient
Get-DnsClientCache
Get-DnsClientServerAddress
GCM *SMB*
GCM *SMBMapping
Help Get-SmbMapping -Example
Help Get-SmbMapping -Examples
Help Get-SmbMapping -xxamples
Help Get-SmbMapping -examples
Get-Help Get-SmbMapping -Online
Get-Help Get-SmbMapping -Online
Get-Help Get-SmbMapping -Online
New-SmbMapping -localPath C:\Users\Public\Documents -RemotePath \\localserver\document
New-SmbMapping -localPath C: -RemotePath \\localserver\document
Help New-SmbMapping -examples
```
#### Reviewing the event log information.  

```
get-command Get-*Event*
Get-EventLog -LogName System | gm
Get-EventLog -log system -newest 1000 | Where-Object {$._EventID -eq '1074'} | Format-Table MachineName, UserName, TimeGenerated -autosize
```
#### Demo: get Get-ComputerInfo

```
 Get-ComputerInfo | More
 Get-ComputerInfo -Property *memory*
```

#### Demo: workig with files and folders

```
Get-ChildItem -Path c:\ -Recurse
Get-ChildItem -Path c:\ -Recurse | gm
Get-ChildItem -Path c:\ -Recurse | Where Extension -EQ '.PNG'
Get-ChildItem -Path c:\ -Recurse | Where Extension -EQ '.PNG' | FT Directory,Name,LastWriteTime
GCM *copy*
help Copy-Item -Examples
Copy-Item w:\ -Destination c:\CopiedFolder -Recurse -Verbose
dir c:\CopiedFolder -Recurse
Move-Item c:\CopiedFolder -Destination c:\MovedFolder -Verbose
Rename-Item c:\MovedFolder -NewName c:\RenamedFolder
```
Create new file
```
New-Item -Path . -Name "testfile1.txt" -ItemType "file" -Value "This is a text string."
```
Create new folder
```
New-Item -Path "c:\" -Name "logfiles" -ItemType "directory"

New-Item -ItemType "directory" -Path "c:\ps-test\scripts"
```
### Remoting with powershell

Command to enable powershell Remoting
```
Enable-PSRemoting
```
or
```
Enable-PSRemoting -Force
```
Command to set configuration for PowershellRemoting
```
Set-PSSessionConfiguration

Set-PSSessionConfiguration -Name Microsoft.PowerShell -ShowSecurityDescriptionUI

Get-NetfirewallRule | Where Displayname -Like "*Windows Management Instrumentation*" | Set-NetFirewallRule -Enable True -Verbose

Get-NetfirewallRule | Where Displayname -EQ 'Remote Service Management' | Set-NetFirewallRule -Enable True -Verbose
```

Command for Powershell remote connection
```
Enter-PSSession -ComputerName clientcomputer Get-Credential
```
Command to retrive windows environment variables
```
PS C:\Users\Administrator> Get-ChildItem ENV: | More
```
Output:
```
Name                           Value
----                           -----
ALLUSERSPROFILE                C:\ProgramData
APPDATA                        C:\Users\Administrator\AppData\Roaming
CLIENTNAME                     localhost.local
CommonProgramFiles             C:\Program Files\Common Files
CommonProgramFiles(x86)        C:\Program Files (x86)\Common Files
CommonProgramW6432             C:\Program Files\Common Files
COMPUTERNAME                   EC2AMAZ-PRBTS2H
ComSpec                        C:\Windows\system32\cmd.exe
DriverData                     C:\Windows\System32\Drivers\DriverData
FPS_BROWSER_APP_PROFILE_STRING Internet Explorer
FPS_BROWSER_USER_PROFILE_ST... Default
HOMEDRIVE                      C:
HOMEPATH                       \Users\Administrator
LOCALAPPDATA                   C:\Users\Administrator\AppData\Local
LOGONSERVER                    \\EC2AMAZ-PRBTS2H
NUMBER_OF_PROCESSORS           1
OS                             Windows_NT
Path                           C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files\Amazon\cfn-...
PATHEXT                        .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.CPL
PROCESSOR_ARCHITECTURE         AMD64
PROCESSOR_IDENTIFIER           Intel64 Family 6 Model 63 Stepping 2, GenuineIntel
PROCESSOR_LEVEL                6
PROCESSOR_REVISION             3f02
ProgramData                    C:\ProgramData
ProgramFiles                   C:\Program Files
ProgramFiles(x86)              C:\Program Files (x86)
ProgramW6432                   C:\Program Files
PSModulePath                   C:\Users\Administrator\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules;C:\P...
PUBLIC                         C:\Users\Public
SESSIONNAME                    RDP-Tcp#0
SystemDrive                    C:
SystemRoot                     C:\Windows
TEMP                           C:\Users\ADMINI~1\AppData\Local\Temp\2
TMP                            C:\Users\ADMINI~1\AppData\Local\Temp\2
USERDOMAIN                     EC2AMAZ-PRBTS2H
USERDOMAIN_ROAMINGPROFILE      EC2AMAZ-PRBTS2H
USERNAME                       Administrator
USERPROFILE                    C:\Users\Administrator
windir                         C:\Windows
```
Command to display computername from environment variable
```
$env:Computername
```
Command to get the variables
```
PS C:\Users\Administrator> Get-Variable | More
```
Output:
```
Name                           Value
----                           -----
$                              $env:Computername
?                              True
^                              $env:Computername
args                           {}
ConfirmPreference              High
ConsoleFileName
DebugPreference                SilentlyContinue
Error                          {The term 'Install-PowershellRemoting.ps1' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the n...
ErrorActionPreference          Continue
ErrorView                      NormalView
ExecutionContext               System.Management.Automation.EngineIntrinsics
false                          False
FormatEnumerationLimit         4
HOME                           C:\Users\Administrator
Host                           System.Management.Automation.Internal.Host.InternalHost
InformationPreference          SilentlyContinue
input                          System.Collections.ArrayList+ArrayListEnumeratorSimple
LASTEXITCODE                   0
MaximumAliasCount              4096
MaximumDriveCount              4096
MaximumErrorCount              256
MaximumFunctionCount           4096
MaximumHistoryCount            4096
MaximumVariableCount           4096
MyInvocation                   System.Management.Automation.InvocationInfo
NestedPromptLevel              0
null
OutputEncoding                 System.Text.ASCIIEncoding
PID                            4292
PROFILE                        C:\Users\Administrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
ProgressPreference             Continue
PSBoundParameters              {}
PSCommandPath
PSCulture                      en-US
PSDefaultParameterValues       {}
PSEdition                      Desktop
PSEmailServer
PSHOME                         C:\Windows\System32\WindowsPowerShell\v1.0
PSScriptRoot
PSSessionApplicationName       wsman
PSSessionConfigurationName     http://schemas.microsoft.com/powershell/Microsoft.PowerShell
PSSessionOption                System.Management.Automation.Remoting.PSSessionOption
PSUICulture                    en-US
PSVersionTable                 {PSVersion, PSEdition, PSCompatibleVersions, BuildVersion...}
PWD                            C:\Users\Administrator
ShellId                        Microsoft.PowerShell
StackTrace                        at System.Management.Automation.CommandDiscovery.LookupCommandInfo(String commandName, CommandTypes commandTypes, SearchResolutionOptions searchResolution...
true                           True
VerbosePreference              SilentlyContinue
WarningPreference              Continue
WhatIfPreference               False
```
### Demo: Working with variables.  
```
PS C:\Users\Administrator> $ComputerName = "Client"
PS C:\Users\Administrator> $ComputerName
Client
PS C:\Users\Administrator> Write-Output "The name of the remote computer is $ComputerName"
The name of the remote computer is Client
PS C:\Users\Administrator> Write-Output 'The name of the variabe of the remote computer is $ComputerName'
The name of the variabe of the remote computer is $ComputerName
PS C:\Users\Administrator> $credentb = Get-Credential

cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
PS C:\Users\Administrator> $credentb

UserName                     Password
--------                     --------
bitroid  System.Security.SecureString


PS C:\Users\Administrator> Get-Variable -Name c*

Name                           Value
----                           -----
ComputerName                   Client
ConfirmPreference              High
ConsoleFileName
credentb                       System.Management.Automation.PSCredential
```
### Options for Remoting with PowerShell  

-Computername (__parameter__)  
\*-PSSession (__cmdlets__)  
Invoke-command  
New-CimSession   

### Demo: Remoting with PowerShell  

Saving Computername to environment variable
```
$Computername = "Client02"
```
Get the services of the Client02
```
Get-Service -computername $Computername | select Name, Status
```
Search PSSession commands 
```
gcm *-PSSession
```
Saving credentials to environment variable
```
$credential = Get-credential
```
Creating a new Session from remote computer
```
New-PSSession -Computername $Computername -Credential $credential
```
Login using Open session name
```
Enter-PSSession -Name WinRM1
```
Command Inside the remote server
```
$env:COMPUTERNAME
exit
```
Get remote sessions information
```
Get-PSSession
```
Enter remote session using open remote sessions id
```
Enter-PSSession -id 1
```
Remove the open remote sessions
```
remove-PSSession -id 1
```
### Demo: Remoting powershell with invoke command
Help window
```
help invoke-command
```
Setting environment variables
```
$ComputerName = "Client02"
$credential = Get-Credential
```
Remote poweshell using Invoke command
```
Invoke-command -ComputerName $ComputerName -Credential $credential -ScriptBlock { get-service -ComputerName $ComputerName }
```
or
```
Invoke-command -ComputerName $ComputerName -Credential $credential -ScriptBlock { get-service -ComputerName $using:ComputerName }
```
Storing command into a variables
```
$data = Invoke-command -ComputerName $ComputerName -Credential $credential -ScriptBlock { get-service -ComputerName $using:ComputerName }
```
get methods on stored variable
```
$data | gm
```
Command to execute the PowerShell Core
```
invoke-command -ComputerName DC01 -cred (get-credential) -ScriptBlock { Get-ADUser -Identity felixb | format-list }
```
### Demo: Remoting with New-Cim

Setting environment variables
```
$ComputerName = "Client02"
$credential = Get-Credential
```
Help window
```
help New-Cimsession
```
Remoting with Cimsession
```
$cimsession = New-CimSession -ComputerName $ComputerName -Credential $credential
```
Cimsession to open Remote Connection
```
$cimsession
```
Get CimSession details
```
Get-CimSession
```
Help Get DNSClient Server ADdress
```
Help Get-DNSClientServerAddress
```
Get DNS information CimSession
```
Get-DNSClientServerAddress -CimSession $CimSession
```
## Script with PowerShell

Check execution policy
```
Get-ExecutionPolicy
```
Help on set ExecutionPolicy
```
Help Set-ExecutionPolicy -Parameter ExecutionPolicy
```
Sign the remote connection
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
Sample .ps1 Script
```
.\View-StoppedService.ps1
```
#### Demo: using running powershell scripts

View-StoppedService
```
# Basic script to view stopped services on a system
$Computername = Read-hot 'Enter name of host'
$StoppedService = get-service -ComputerName $Computername
                         where-object -Property status -eq 'Stopped'
Write-Output $StoppedService
```
View-CimOSInfo.ps1
```
$ComputerName = Read-Host "Enter Computername"
Get-CIMInstance -Class Win32_OperatingSystem -ComputerName $ComputerName |
    Select-Object -Property CSName,LastBootUptime
```

#### Basic concept of powershell script

```
### Script Basics

Variables
Parameters
Logic
Member enumeration
```
#### Parameterized powershell script

get-servicestatus.ps1 
```
#Get-Servicesstatus.ps1 -Script displays the status of servies running on a specified machine

#Create a mandotory parameter for computername and for service status

Param (
    [Parameter(Mandatory=$true)]
    [string[]] #Additional [] after string denotes this parameter accepts multiple inputs
     $Computername #Note this is the same name as the variable used in your code below
)

#Creates a variable for Get-Service Objects.
#As it can hold multiple objects, referred to as an array
$Services = Get-Service -Computer $Computername

#Use foreach construct to perform action on each object in $Service
Foreach ($service in $Services) {

   #Create variable containing status and displayname using member enumeration

   $ServiceStatus = $service.Status
   $ServiceDisplayName = $service.displayname

   #User if-else construct for decision making
  
   if ($ServiceStatus -eq 'Running') {
       Write-Output "Serivce OK - Status of $ServiceDisplayname is $ServiceStatus"
   }
   Else {
       Write-Output "Check Service - Status of $ServiceDisplayname is $ServiceStatus"
   }
}
```
Command to execute
```
.\get-servicestatus.ps1 -Computername Dc01
```
#### Demo: working with block script in powershell

Get-ServiceExamplept3.ps1
```
#Get-ServiceExamplept3.ps1

#Region step 3 Parameterize Variable
# Parameter help description

param (
    [Parameter(Mandatory=$True)]
    [string[]]
    $Computername
)

#Enter Script Block Here
get-service -ComputerName $Computername | 
                      Where-object -Property Status -eq 'Stopped'
```
Get-ServiceExamplept4.ps1
```
#Step 4 Add Logic
param (
    [Parameter(Mandatory=$True)][string[]]$Computername
)

#Loop through each computer in computername parameter, and perform actions in code block

foreach ($target in $Computername) {

    #Enter Code Block Here and change variable to match foreach condition
    get-service -ComputerName $Computername |
    where-object -Property Status -eq 'Stopped'

}
```
Commandline execution
```
Get-ServiceExamplept4.ps1 -Computername Dc01
```

#### Demo : Walking through parameters

Script.ps1
```
#OS Description
    $OS = (Get-CimInstance Win32_OperatingSystem -ComputerName Client02).caption
    $OS

#Disk Freespace on OS Drive
    $drive = GetWmiObject -class Win32_logicaldisk | Where-Object DeviceID -EQ 'C:'
    $Freespace = (($drive.Freespace)/1gb)
    $drive
    $freespace

#Amount of System Memory
    $MemoryInGB = ((((Get-CimInstance Win32_PhysicalMemory -ComputerName Client02).Capacity|measure -Sum).Sum)/1gb)
    $MemoryInGB

#Last Reboot of System
    $LastReboot = (Get-CIMInstance -Class Win32_OperatingSystem -ComputerName Client02).LastBootUptime
    $LastReboot

#IP Address & DNS Name
    $DNS = Resolve-DnsName -Name Client02 | Where-Object Type -eq "A"
    $DNSName = $DNS.Name
    $DNSIP = $DNS.IPaddress
    $DNS
    $DNSName
    $DNSIP

#DNS Server of Target

    $CimSession = New-CimSession -ComputerName Client02 -Credential (Get-Credential)
    (Get-DNSClientServerAddress -cimsession $Cimsession -InterfaceAlias "ethernet" -AddressFamily IPv4).ServerAddresses
```

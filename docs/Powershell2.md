The Case for PowerShell
-----------------------

Command to set dns ip address.  
`netsh int ip set dns name="Ethernet" addr=4.2.2.2`  

Command to get ip address.  
`ipconfig /all`  

Command to ping ip address.  
`ping 4.2.2.2 -n 1`  

# Powershell command line structure

All powershell cmdlets have names like __VERB-NOUN__.  

__Example:__ new, get, connect, set, remove  

The nouns come from the product group that controls whatever we are trying to administer.  

__Example:__ Process, Service, ADUser, VM, Computer.  

The nouns are always singular.  

__Example:__ get-vm, restore-aduser, format-table.  

# The four big posh verb.  

- __NEW__ "CREATE SOMETHING NEW"  
  no cmdlet starts with __"create-"__, it's always new - new-vm creates a VM.  
  
- __GET__ "IS LIKE SHOW OR LIST"  
  get-vm would show all virutual machines on a Hyper-V Server.  
  
- __SET__ "LETS YOU CHANGE SOME CHARACTERISTICS"  
  set-vm would let you rename it, change how much RAM it has etc,  
  
- __REMOVE__ MEANS "DELETE"  
  remove-vm would delete a virtual machine.  
  
  __ALSO__ . .  
  
  - add  
  - clear  
  - test  
  - measure  
  - rename  
  
  See them all with a cmdlet __"get-verb"__  
  
### REUSABLE INFORMATION  

- TO RENAME A VIRTUAL MACHINE FROM __"WEBVM"__ TO __"VM1"__  
   rename-vm -name "WebVM" -newname "VM1"  
   
 - TO RENAME __"PC24"__ TO __"ACCOUNTINGPC"__  
   rename-computername __"PC24"__ -newname __"AccountingPC"__  
   
### POWERSHELL HAS OPTIONS TO SHORTEN LONG COMMANDS.  

- shorter "ALIAS" VERSIONS OF COMMANDS:  
  "import-module" become "ipmo"  
  
- PARAMETERS CAN BE SHORTENED:  

### Examples of powershell  

`set-aduser-identity MarkM -title "Instructor"`  

`get-aduser -filter {Enabled -eq $false}`  

`add-printer -connect \\server3\BigLaser`  

`restart-computer`  

`disable-windowsoptionfeature -feature WindowsMediaPlayer`  

`Add-VPNConnection -name "ToOffice" -server 4.3.2.1`  

`search-adaccount -accountinactive -datetime "09/03/2012" --usersonly`  

`disable-adaccount -identify MarkM`  

# Digging into Powershell  

### Discovering Commands: GET-COMMAND.  

- How to find out if any cmdlets controlprinters ? 

- Use GET-COMMAND  
  get-command \*printer\*   
  or ... gcm \*printer\*  
  
- NEW COMMANDS INCLUDES INSTALL-PRINTER  

```
PS /> Write-Host "Hello, World!"
Hello, World!
```

## WELL, REMOTECONTROL IS PRETTY GOOD

- `invoke-command -computername PC3,PC6,PC99 -scriptblock { disable-windowsoptionfeature -feature WindowsMediaPlayer }`

- `invoke-command -computername (type C:\pcs.txt) -scriptblock { disable-windowsoptionfeature -feature WindowsMediaPlayer }`

- `invoke-command -computername (get-adcomputer -filter .\*).name -scriptblock { disable-windowsoptionfeature -feature WindowsMediaPlayer }`

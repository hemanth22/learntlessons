## PSCP Command

#### Command to show help
```
pscp 
```

#### Command to show version
```
pscp -V
pscp: Release 0.80
```

#### Command to download file from linux to windows server

```
pscp -l root root@193.16.16.9:/root/bb_regional.json C:\Users\heman\Documents\
```

#### Command to download file from linux to windows server with verbose output
```
C:\HOMEWARE\curlpscp\curl-8.5.0_3-win64-mingw\curl-8.5.0_3-win64-mingw\bin>pscp -v -l root root@193.16.16.9:/root/bb_regional.json C:\Users\heman\Documents\
Looking up host "193.16.16.9" for SSH connection
Connecting to 193.16.16.9 port 22
We claim version: SSH-2.0-PuTTY_Release_0.80
Connected to 193.16.16.9
Remote version: SSH-2.0-OpenSSH_8.0
Using SSH protocol version 2
No GSSAPI security context available
Doing ECDH key exchange with curve Curve25519, using hash SHA-256 (SHA-NI accelerated)
Server also has ecdsa-sha2-nistp256/rsa-sha2-512/rsa-sha2-256/ssh-rsa host keys, but we don't know any of them
Host key fingerprint is:
ssh-ed25519 255 SHA256:7s4XYsIUx7XyLMUcjwS7JUrrHt6I1LJJARHc1OLN5c8
The host key is not cached for this server:
  193.16.16.9 (port 22)
You have no guarantee that the server is the computer you
think it is.
The server's ssh-ed25519 key fingerprint is:
  ssh-ed25519 255 SHA256:7s4XYsIUx7XyLMUcjwS7JUrrHt6I1LJJARHc1OLN5c8
If you trust this host, enter "y" to add the key to PSCP's
cache and carry on connecting.
If you want to carry on connecting just once, without adding
the key to the cache, enter "n".
If you do not trust this host, press Return to abandon the
connection.
Store key in cache? (y/n, Return cancels connection, i for more info) y
Initialised AES-256 SDCTR (AES-NI accelerated) outbound encryption
Initialised HMAC-SHA-256 (SHA-NI accelerated) outbound MAC algorithm
Initialised AES-256 SDCTR (AES-NI accelerated) inbound encryption
Initialised HMAC-SHA-256 (SHA-NI accelerated) inbound MAC algorithm
Using username "root".
Using SSPI from SECUR32.DLL
Trying gssapi-with-mic...
Attempting GSSAPI authentication
GSSAPI authentication request refused
root@193.16.16.9's password:
Sent password
Access granted
Opening main session channel
Opened main channel
Started a shell/command
Using SFTP
Connected to 193.16.16.9
bb_regional.json          | 130 kB | 130.8 kB/s | ETA: 00:00:00 | 100%
Session sent command exit status 0
Main session channel closed
All channels closed

C:\HOMEWARE\curlpscp\curl-8.5.0_3-win64-mingw\curl-8.5.0_3-win64-mingw\bin>ls C:\Users\heman\Documents\bb_regional.json
'C:\Users\heman\Documents\bb_regional.json'

```
#### Command to upload file from windows to linux server

```
pscp -v -l root C:\Users\heman\Documents\test_bb_regional.json root@193.16.16.9:/root/test_bb_regional.json
```

#### Command to upload file from windows to linux server with verbose

```
C:\HOMEWARE\curlpscp\curl-8.5.0_3-win64-mingw\curl-8.5.0_3-win64-mingw\bin>pscp -v -l root C:\Users\heman\Documents\test_bb_regional.json root@193.16.16.9:/root/test_bb_regional.json
Looking up host "193.16.16.9" for SSH connection
Connecting to 193.16.16.9 port 22
We claim version: SSH-2.0-PuTTY_Release_0.80
Connected to 193.16.16.9
Remote version: SSH-2.0-OpenSSH_8.0
Using SSH protocol version 2
No GSSAPI security context available
Doing ECDH key exchange with curve Curve25519, using hash SHA-256 (SHA-NI accelerated)
Server also has ecdsa-sha2-nistp256/rsa-sha2-512/rsa-sha2-256/ssh-rsa host keys, but we don't know any of them
Host key fingerprint is:
ssh-ed25519 255 SHA256:7s4XYsIUx7XyLMUcjwS7JUrrHt6I1LJJARHc1OLN5c8
Initialised AES-256 SDCTR (AES-NI accelerated) outbound encryption
Initialised HMAC-SHA-256 (SHA-NI accelerated) outbound MAC algorithm
Initialised AES-256 SDCTR (AES-NI accelerated) inbound encryption
Initialised HMAC-SHA-256 (SHA-NI accelerated) inbound MAC algorithm
Using username "root".
Using SSPI from SECUR32.DLL
Trying gssapi-with-mic...
Attempting GSSAPI authentication
GSSAPI authentication request refused
root@193.16.16.9's password:
Sent password
Password authentication failed
Access denied
root@193.16.16.9's password:
Sent password
Access granted
Opening main session channel
Opened main channel
Started a shell/command
Using SFTP
Connected to 193.16.16.9
Sending file test_bb_regional.json, size=133929
test_bb_regional.json     | 130 kB | 130.8 kB/s | ETA: 00:00:00 | 100%
Session sent command exit status 0
Main session channel closed
All channels closed
```

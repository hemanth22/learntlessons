## What is Autosys?  

__Autosys__ is an automated job control system for scheduling, monitoring, and reporting.  
These jobs can reside on autosys-configured machine that is attaches to a network.  
An autosys job is any single command, executable, script, or Windows batch file.  
Each autosys jil definition contains a variety of qualifying attributes, including the condition specifying when and where a job should be run.  

### Autosys Jobs  
Job Types and Structure:  
There are three types of jobs:  
__Command:__ jobs execute commands.  

This job can be represented by a "Script", an executable programme, when the whole conditions for running is filled,  
AutoSys executes this job and captures the return code once the finished program.  

__File Watcher:__ jobs watch for the arrival of a specified file.   

A job "File watcher" is similar to a command job. instead of starting an order user on a distinct machine,  
Autosys watch the presence of a file and its attributes.  

__Box:__ box jobs are containers that hold other jobs.  
         A box jib can be used to organize and control process flow.  
         
The "Box job" represents a logical organization which gathers several jobs.  
It does not deal with any action.  
If several jobs in the same box do not have any conditon of starting, they will run in parallel.  

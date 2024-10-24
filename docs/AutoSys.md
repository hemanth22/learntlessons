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

### Autosys Job Status  

__STARTING__: An event initiated to the start job procedure with the remote agent.  
__RUNNING__: Jon is in running mode  
__INACTIVE__: Job is inactive, and never execute or marked intentionally  
ACTIVATED
SUCCESS
FAILURE
TERMINATED
RESTART
QUE_WAIT
ON_HOLD
ON_ICE
OFF_ICE
OFF_HOLD

### Difference between ON_HOLD vs ON_ICE ?  

When a job is ON HOLD and If the same job has kept OFF HOLD, Its runs in case of job starting conditions met/satisfied.  
When a job is OFF ICE and If the same Job kept OFF ICE, Its will not run even though the respective job starting conditions met/satisfied.  
If a job is ON HOLD, The dependent jobs will not run.  
Where as If a job is ON ICE, the dependent will run as per the schedule.  


### What are AutoSys JIL ?

JIL stands for Job Information Language.    


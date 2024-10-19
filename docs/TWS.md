## What is TWS in schedular ?

IBM Tivoli Workload Scheduler (IBM TWS), now called IBM Workload Scheduler (IWS), is an enterprise job scheduling and workload automation tool. It helps organizations plan, execute, and monitor workflows and batch jobs across various platforms and applications. Key features include:  

__Job Scheduling:__ Automates and schedules jobs, scripts, and workflows, ensuring that tasks are executed in the correct order and at the appropriate times.  
__Cross-platform Support:__ Works across different environments, including Windows, Linux, Unix, and z/OS.  
__Centralized Control:__ Provides a single point of control to manage and monitor job statuses across the entire IT infrastructure.  
__Dependencies:__ Supports managing job dependencies, allowing jobs to run based on the completion of other tasks or specific conditions.  
__Integration:__ Integrates with various applications, including ERP systems, databases, and cloud services.  
__Error Handling:__ Offers robust error detection and correction mechanisms, automating failure recovery.  

TWS is widely used in industries such as finance, healthcare, and manufacturing to ensure smooth, automated execution of critical business processes.  


## Why TWS even thought crontab available in linux ?

| Feature                        | crontab                                              | IBM Tivoli Workload Scheduler (TWS)                            |
|---------------------------------|------------------------------------------------------|---------------------------------------------------------------|
| **Purpose**                     | Basic job scheduling utility in Unix/Linux systems.  | Enterprise-level workload automation and job scheduling.       |
| **Job Definition**              | Defined in a simple text file with cron syntax.      | Complex jobs with workflows, dependencies, and triggers.       |
| **Job Dependencies**            | Limited; jobs can only be scheduled by time.         | Supports job dependencies (e.g., job A triggers job B).        |
| **User Interface**              | Command-line interface with manual editing.          | Web-based UI, graphical interface, and command-line options.   |
| **Error Handling**              | No built-in error handling or recovery mechanism.    | Advanced error detection, retry logic, and recovery options.   |
| **Platform Support**            | Primarily Unix/Linux systems.                        | Supports multiple platforms (Windows, Linux, Unix, z/OS, etc.).|
| **Event-driven Scheduling**     | Not supported; time-based only.                      | Can trigger jobs based on events or conditions.                |
| **Monitoring & Reporting**      | Limited; manual checking of job logs.                | Centralized monitoring, alerts, notifications, and reporting.  |
| **Job Prioritization**          | Not supported.                                       | Supports job prioritization based on business needs.           |
| **Scalability**                 | Suitable for small-scale systems.                    | Scales for enterprise-level operations with thousands of jobs. |
| **Integration with Applications**| Minimal (requires custom scripting).                 | Integrates with various enterprise applications and databases.  |
| **Security & Access Control**   | Basic OS-level permissions.                          | Role-based access control and detailed job-level security.     |
| **Cost**                        | Free and built-in to Unix/Linux systems.             | Licensed product with enterprise-level support and features.   |

### Architecture of file dump in text. 

```
mapping.json
WORKSTATION1
- schedule
- job
WORKSTATION2
- schedule
- job
```

### schedule definition

```
SCHEDULE WORKSTATION1#SCHEDULE_NAME
DESCRIPTION "Mention the description"\
ON RUNCYCLE RULE1 VALIDFROM 22061993 "FREQ=DAILY" -- for daily or ON RUNCYCLE RC1 "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR" -- for specific days in weekly  
AT 1000 UNTIL 1200 +7 DAYS DEADLINE 1130 -- deadline condition will throw alerts if job not completed by 11:30
PRIORITY 0 -- to hold the job or PRIORITY 100 -- For top priority job OR DRAFT -- This is for Draft mode not actual
:
WORKSTATION1#JOB_NAME
AT 1000 UNTIL 2359 +1 DAYS
EVERY 0010

WORKSTATION1#JOB_NAME2
AT 1000

WORKSTATION1#JOB_NAME3
FOLLOWS JOB_NAME2 -- dependency condition

WORKSTATION1#JOB_NAME4
FOLLOWS WORKSTATION2#SCHEDULE_NAME1.@ -- external schedule dependency

WORKSTATION1#JOB_NAME5
FOLLOWS WORKSTATION2#SCHEDULE_NAME1.JOB_NAME1 -- external job dependency

WORKSTATION1#JOB_NAME6
FOLLOWS JOB_NAME1
FOLLOWS JOB_NAME2
FOLLOWS JOB_NAME3

WORKSTATION1#JOB_NAME7
OPENS WORKSTATION1#"/app/incoming/hemanthbitra*.csv"(`ls %p | wc -w` -ge 1) -- wait for file

END
```
### job definition

```
WORKSTATION1#JOB_NAME
 SCRIPTNAME "(. /app/.bash_profile; hello.sh)" or DOCOMMAND "df -h /opt/;/opt/env.sh;df -h /opt"
 STREAMLOGON username
 DESCRIPTION "Description of job"
 TASKTYPE UNIX or TASKTYPE WINDOW
 OUTPUTCOND STATUS_ERR1 "RC>=1"
 SUCCOUTPUTCOND STATUS_SUCC "RC=0"
 RECOVERY STOP
```

### Type of Recovery

__STOP__: Stop the jobs if filled  
__CONTINUE__: run a dependency job even if current job is failed  
__RERUN__: Rerun the job if failed  

__Example syntax :__ `RECOVERY RERUN REPEATEVERY 0010 FOR 2 ATTEMPS` , this will run after 10 minutes , for 2 time if job is failed.  

### References

__Job definition:__ https://www.ibm.com/docs/en/workload-automation/10.2.2?topic=objects-job-definition  
__Schedule definition:__ https://www.ibm.com/docs/en/workload-automation/10.2.2?topic=so-job-stream  
__Example definition:__ https://www.ibm.com/docs/en/workload-automation/10.2.2?topic=so-job  


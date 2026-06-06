## Quick prompts

### Prompts for daily productivity

```
What are my top priorities today?
```

```
Identify all tasks or action items assigned to me in this week’s emails, Teams chats and
meeting notes, and compile them into a checklist with due dates.
```

```
Can you help me create a prompt that generate the most accurate response
```

### Prompts for  minutes of meeting
```
Write a meetings of meeting email to final communication in below format
   Attendence list
   Sumamcy of the discussion
   Tasks
```

```
shorten this into a crisp executive summary version (for senior management) or format it exactly as per your team's MoM template
```

```
crisp executive summary MoM tailored for senior management
```

```
compress this further into a 5-line leadership update (mail/chat ready) or AIign it exactly to Company MoM template format.
```

```
convert this into a mail-ready Outlook format with subject tagging.
```

```
create an even one-page dashboard-style summary (for leadership slides)
```

## Prompt Engineering Techniques

Zero shot Prompting  

Zero-shot prompting is a technique where you ask an AI assistant to perform a task without providing examples of the desired output in the prompt.   
The AI assistant uses its pre-trained knowledge and language understanding to generate the relevant response.  

Few-shot prompting  

Few-shot prompting is a technique where an AI assistant is given a few examples in the prompt to guide its response.  
These examples demonstrate the expected format, style, and approach, helping the AI assistant generate a more accurate and relevant response.  

Prompt Chaining  

Prompt chaining connects multiple prompts sequentially, where each prompt builds on the AI assistant's previous responses:  
This technique helps AI assistants handle complex tasks by breaking them into smAIler, manageable steps that work together.   

Chain of thought Prompting  

Chain-of-thought prompting encourages AI assistants to show their reasoning process step-by-step before giving their final answer.  
This technique helps you see how the AI assistant thinks through a problem, making the response more transparent and often more reliable.  

Tree of thought Prompting  

Tree-of-thought prompting guides AI assistants to explore multiple solution paths and evaiuate different approaches before providing a response.  
This technique helps AI assistants consider various possibilities rather than following just one line of reasoning, leading to more thoughtful and well-considered responses.  

ReAct Prompting  

ReAct prompting follows a cycle where the AI assistant alternative between reasoning and taking actions.  
The AI assistant writes out its reasoning as a Thought, performs an Action, records the Observation from that action, then continues this cycle until reaching a final answer.  

Knowledge Augmentation  

Knowledge augmentation techniques add externAI information, current data, or speciAIized knowledge directly into prompts to improve AI assistant responses.  
This approach provides the AI assistant with specific context and details needed to generate more accurate and relevant answers.  

Input Semantics and Language Framing   

Input semantics and language framing refer to how word choice, phrasing, and information structure influence AI assistant comprehension and response quality.   
Different ways of structuring the same request or asking similar questions can lead to significantly different responses from the AI assistant.  

Prompt Engineering Techniques  

Prompt engineering techniques are speciAIized approaches used to handle complex tasks that require detailed reasoning, multiple steps, or high-quality outputs from AI assistants. These methods help generate better responses beyond simple or basic requests.  

## Gemini Gems

### 4Ts of Prompting

1. Traits  
The role you want the model to purse.  
Ex: Teacher, Developer, Copywriter, Data Analyst  

2. Tasks  
What you want the model to create for you  
Ex: Article, Email, Outline, Blog Post, Script  

3. Tones  
The style of writing you want the LLM to use  
Ex: Friendly, Professional, Conversational  

4. Targets  
The audience you're trying to reach out to  
Ex: Student, Technologists, Business Owners  

References:  

https://itsplaitime.com/custom-gpts  
https://itsplaitime.com/agents/youtube-google-gem-agent-for-summarizing-videos-for-busy-professionals  

### Example Gem creation instruction  

```
Name: Travel Logistics Architect  
Description: A Logistics expert that solves times and space problems for business travel  
Instructions:   
You are a Travel Logistics Architect. You are not a travel agent who sells vacations; you are a logistics expert who solves time and space problems. You value precision, realistic timelines, and
efficiency. Your advice is grounded in ground-truth data (transit times, opening hours, security lines).  

Your goal is to build a realistic, executable itinerary. You must follow this strict sequence.  
**Stop!** at the indicated points to wait for user input.  

1. ** Initialization & Variables **  
** Stop !**  

2. ** Context Intake (The Input) **  
* Ask the user for the "Anchor Points": Destination, specific  
travel dates, and Hotel/Lodging location.  

** Stop !** Ask the user: "Do you want to upload a conference  
itinerary, a screenshot of a map, or use current chat context to  
inform this trip?"  

** Constraint :* If the user uploads a file (PDF, Image, Text),  
analyze it to extract fixed commitments before going further.  

3. ** The Reality Check (The Calculation) **  
* Before suggesting activities, calculate the "Door-to-Door"  
timeline.  
* Estimate time for deplaning, baggage claim (add 30-45 mins  
for checked bags), and transit to the hotel using Google Maps  
logic.  
* Establish a "Ready Time"-the actual time the user will be free  
to leave their hotel.  
** Stop !** Present the calculated "Ready Time" and ask the  
user to confirm it is realistic before proceeding.  

4. ** The Options Protocol **  
* Once the "Ready Time" is established, search for activities that  
fit the remaining window.  
* Present exactly three options based on the user's available  
time:  
  * ** Option 1: The Ambitious Choice .** (Tight timing, high  
reward).  
  ** Option 2: The Recommended Choice .** (Balances activity  
with stress reduction).  
  * ** Option 3: The Flexible Choice .** (Low stakes, no  
reservations required).  
  * *Visual Aid Check :* If the user provided a map or location  
image, reference specific landmarks from it in these options.  

5. ** The Transport Link **  
* When a user confirms a choice, provide specific transit  
instructions.  
* Use bullet points for clear steps (e.g., "Take the AirTrain to  
Jamaica -> LIRR to Penn Station").  
* Use Google Maps data to verify train lines and walking times.  

6. Output  
* Create an itinerary  
* Offer to send it to email or store it in google docs.  

## Tones  
* ** Journalistic & Neutral :** Use short, declarative sentences. No  
adjectives.  
* ** Authoritative :** Do not say "You could maybe try." Say "The  
best option is."  
* ** Matter-of-Fact :** State the facts. If a timeline is impossible,  
state it clearly.  
* ** Formatting :** Use bolding for times and locations. Use lists  
for timelines.  

## Targets  
* ** The Busy Professional :** This user travels for work or  
efficient leisure. They hate wasting time and value accuracy over  
options. They need to know *how* to do it, not just *what* to do.  
They expect the Al to manage the complexity of uploaded files  
and constraints automatically.  

## Core Operating Rules  
* ** Don't try to do too much at once .**  
* Ask questions, don't assume  
* Use Google connectors like Google Maps, Google Hotels,  
Google Flights and other tools to provide accurate, verifiable  
information.  
```

### Example shortcut to create gem:  

```
I want an app that lets me type in a prompt to generate an image and use a consistent style  
from an image reference, then have it generate a new image at a 16x9 aspect ratio.  
```

## Claude Prompts

### 1. Turn Claude into a full startup engineering team  

```text
Prompt:

Act like a senior full-stack engineer building a production-ready
startup MVP from scratch. First design the complete system
architecture, then build the most minimal but scalable version
possible.

Include:

. System architecture
. File structure
. Database schema
. API endpoints
. UI architecture
. Production-ready code

Build it like a real startup that could scale to millions of
users.
```


#### 2. Make Claude audit your entire codebase like a senior engineer  

```text
Prompt:

Act like a senior engineer who just joined a massive unfamiliar
codebase. First reverse-engineer the architecture and understand
the complete data flow.

Then identify:

. Bad architecture decisions
. Duplicate logic
. Performance bottlenecks
. Scalability risks
. Maintainability issues

Finally, provide:

. A clean architecture breakdown
. Critical problem areas
. Refactoring strategies
. Improved production-grade code

Do not change functionality.

Only upgrade the code quality, scalability, and maintainability.
```


### 3. Turn Claude into a production-level debugging monster


```text
Prompt:

Act like a senior debugging engineer investigating a live production
issue. Analyze the codebase step by step like you're handling a
critical outage at a fast-growing startup. Your job:

. Understand what the code actually does
. Trace the real root cause
. Explain why the failure happens
. Identify hidden edge cases
. Propose the most robust fix possible

Finally, provide:

. Code functionality breakdown
. Root cause analysis
. Failure explanation
. Edge case analysis
. Fixed production-ready code

Do not guess. Think deeply before making changes.
```

### 4. Turn Claude into a performance optimization engineer  

```text
Prompt:

Act like a senior performance engineer optimizing a production
application used by millions of users.

Your goals:

. Maximum speed
. Lower memory usage
. Better scalability
. Faster rendering
. Cleaner execution

Carefully identify:

. Performance bottlenecks
. Inefficient logic
. Unnecessary rendering
. Expensive operations
. Memory leaks

Then provide:

. Performance issue breakdown
. Optimization strategies
. Improved production-ready code
. Scalability recommendations

Optimize the code like you're preparing it for massive traffic.
```

### 5. Make Claude rebuild messy code into clean scalable architecture


```text
Prompt:

Act like a senior software architect rebuilding a messy production
codebase using clean architecture principles.

Your mission:

. Separate concerns properly
. Increase modularity
. Reduce tight coupling
. Improve scalability
. Make the codebase easier to maintain long term

Do NOT change the product behavior. Only improve the
architecture and code quality.

Finally, provide:

. New folder structure
. Clean architecture breakdown
. Refactored production-grade code
. Explanation of architectural improvements

Refactor it like a real senior engineer preparing the
codebase to scale.
```


### 6. Make Claude architect your entire startup backend like a senior systems engineer

```text
Prompt:

Act like a senior systems architect designing infrastructure for a
high-growth startup. First design a scalable production-grade system
architecture. Then build the minimal implementation that could
realistically scale in the future.

Include:

. System architecture
. Component structure
. Data flow
· API design
. Database schema
. Caching strategy
. Production-ready implementation code

Optimize for scalability, maintainability, and real-world production
usage.
```


### 7. Turn Claude into a senior frontend engineer 

```text
Prompt:

Act like a senior frontend engineer building production-grade UI
systems for a modern startup.

Your task is to create:

. Reusable UI components
. Scalable component architecture
. Accessible production-ready interfaces

While building, carefully handle:

. Loading states
. Empty states
. Edge cases
. Responsive design
. Accessibility
. Component reusability
. Clean developer experience

Finally, provide:

. Component architecture
. Props/API design
. Production-ready implementation
. Usage examples
. Best practices

Build it like it's going into a real production app used by millions.
```


### 8. Al Technical Lead Mode

```text
Prompt:

Act like a senior technical lead managing a real engineering team.

Before writing code:

. Ask clarifying questions
. Challenge bad decisions
. Identify scaling risks
. Suggest better approaches
. Prioritize simplicity

Think long-term like someone responsible for maintaining this
product for 5+ years.

Then provide:

. Technical decisions
. Tradeoff analysis
. Recommended architecture
. Implementation plan
. Production-ready solution"

This makes Claude stop behaving like a code generator ... and start
thinking like an actual tech lead.
```

### 9. Production Security Audit


```text
Prompt:

Act like a senior security engineer auditing a production application.

Carefully inspect the system for:

. Security vulnerabilities
. Authentication flaws
. API weaknesses
. Injection risks
. Sensitive data exposure
. Infrastructure risks

Then provide:

. Vulnerability report
. Severity levels
. Attack scenarios
. Secure implementation fixes
. Production-grade recommendations

Most people never ask Claude to think like a security engineer.

That's a huge mistake.
```

### 10. Senior DevOps + Development Engineer

```text
Prompt:

Act like a senior DevOps engineer preparing this application for real
production deployment.

Your job:

. Design deployment architecture
. Configure CI/CD
. Setup monitoring/logging
. Improve reliability
. Reduce downtime risks
. Optimize scaling

Provide:

. Infrastructure architecture
. Deployment workflow
. CI/CD pipeline
. Docker/Kubernetes setup
. Monitoring strategy
. Production deployment checklist

This is where Claude becomes genuinely dangerous.
```

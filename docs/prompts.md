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

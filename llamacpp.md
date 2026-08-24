## Command to install llama cpp in windows via powershell


```powershell
irm https://llama.app/install.ps1 | iex
```

## Command to install llama for agent ai

```powershell
powershell -c "irm https://pi.dev/install.ps1 | iex"
```

## Command to install pi-llama plugin

```powershell
pi install git:github.com/huggingface/pi-llama
```

## Command to verify the installation

```powershell
llama cli --version
```

```powershell
PS C:\Users\hemanth> llama cli --version
version: 10217 (ddd4ec142)
built with Clang 22.1.8 for Windows x86_64
```

## Command to serve a model

```powershell
llama serve
```

## Command to list models from cache i.e. download

```powershell
PS C:\Users\hemanth> llama cli --cache-list
number of models in cache: 2
   1. ggml-org/gemma-3-270m-it-qat-GGUF:Q4_0
   2. ggml-org/Qwen3.5-0.8B-GGUF:Q8_0
```

```powershell
PS C:\Users\hemanth> llama cli -cl
number of models in cache: 2
   1. ggml-org/gemma-3-270m-it-qat-GGUF:Q4_0
   2. ggml-org/Qwen3.5-0.8B-GGUF:Q8_0
```

## Command to delete cache model

```powershell
ls C:\Users\hemanth\.cache\huggingface\hub\
PS C:\Users\hemanth> ls C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--Qwen3.5-0.8B-GGUF\


    Directory: C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--Qwen3.5-0.8B-GGUF


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        25-08-2026     00:29                blobs
d-----        25-08-2026     00:54                refs
d-----        25-08-2026     00:29                snapshots


PS C:\Users\hemanth> rmdir C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--Qwen3.5-0.8B-GGUF

Confirm
The item at C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--Qwen3.5-0.8B-GGUF has children and the Recurse
parameter was not specified. If you continue, all children will be removed with the item. Are you sure you want to
continue?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): A
PS C:\Users\hemanth> ls C:\Users\hemanth\.cache\huggingface\hub\


    Directory: C:\Users\hemanth\.cache\huggingface\hub


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        25-08-2026     00:16                models--ggml-org--gemma-3-270m-it-qat-GGUF
```

## Command to download run the model

```powershell
llama serve -hf ggml-org/gemma-3-270m-it-qat-GGUF:Q4_0
```

## Command to Chat in your terminal
```powershell
llama cli -hf ggml-org/gemma-3-270m-it-qat-GGUF:Q4_0
```

__Example__

```powershell
PS C:\Users\hemanth> llama cli -hf ggml-org/gemma-3-270m-it-qat-GGUF:Q4_0


Loading model...

▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀

build      : b10217-ddd4ec142
model      : ggml-org/gemma-3-270m-it-qat-GGUF:Q4_0
ftype      : Q4_0
modalities : text

available commands:
  /exit or Ctrl+C     stop or exit
  /regen              regenerate the last response
  /clear              clear the chat history
  /read <file>        add a text file
  /glob <pattern>     add text files using globbing pattern



> hello, who are you
Hello! I am a large language model. I am trained to understand and generate human-like text. I am ready to help you with any questions or tasks you have. Please ask away!

[ Prompt: 130.8 t/s | Generation: 79.9 t/s ]

> /exit


Exiting...
```

## Command to Serve an OpenAI-compatible API + web UI

```powershell
llama serve -hf ggml-org/gemma-3-270m-it-qat-GGUF:Q4_0
```

## Command to use the .gguf model if already download 

```powershell
llama cli -m C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf
```

```powershell
PS C:\Users\hemanth> llama cli -m C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf


Loading model...

▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀

build      : b10217-ddd4ec142
model      : C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf
ftype      : Q4_0
modalities : text

available commands:
  /exit or Ctrl+C     stop or exit
  /regen              regenerate the last response
  /clear              clear the chat history
  /read <file>        add a text file
  /glob <pattern>     add text files using globbing pattern



> /regen
Error: No message to regenerate.

> hello, who are you ?
Hello! I am a large language model. I am trained to generate text based on a vast amount of information and can perform a variety of tasks, including answering questions, translating languages, summarizing text, and writing different kinds of content.

[ Prompt: 133.8 t/s | Generation: 74.9 t/s ]

> /exit


Exiting...
```

## Command to download model from Hugging Face repository

```powershell
llama cli -hf unsloth/gemma-4-E4B-it-GGUF:Q4_K_M
```

## Command to server a model

```powershell
llama serve -hf ggml-org/gemma-4-e4b-it-GGUF:Q4_0
```

## Set a system prompt

```powershell
llama cli -m model.gguf -sys "You are a concise assistant that answers in bullet points."
```

```powershell
PS C:\Users\hemanth> llama cli -m C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf -sys "You are a concise assistant that answers in bullet points."


Loading model...

▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀

build      : b10217-ddd4ec142
model      : C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf
ftype      : Q4_0
modalities : text
using custom system prompt

available commands:
  /exit or Ctrl+C     stop or exit
  /regen              regenerate the last response
  /clear              clear the chat history
  /read <file>        add a text file
  /glob <pattern>     add text files using globbing pattern



> Hello, who are you ?
Hello! I am a concise assistant that answers in bullet points.

[ Prompt: 254.0 t/s | Generation: 77.7 t/s ]

> /exit


Exiting...
```

## Ask one question and exit when the answer finishes

```powershell
llama cli -m model.gguf -st -p "Give me a baklava recipe"
```

```powershell
PS C:\Users\hemanth> llama cli -m C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf -st -p "Give me a baklava recipe"


Loading model...

▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀

build      : b10217-ddd4ec142
model      : C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf
ftype      : Q4_0
modalities : text

available commands:
  /exit or Ctrl+C     stop or exit
  /regen              regenerate the last response
  /clear              clear the chat history
  /read <file>        add a text file
  /glob <pattern>     add text files using globbing pattern



> Give me a baklava recipe
Okay, let's make a delicious baklava! Here's a recipe that's easy to make and perfect for a festive occasion:

**Baklava**

**Ingredients:**

*   **Baklava:** 1 cup
*   **Eggs:** 2 large
*   **Milk:** 1/2 cup
*   **Sugar:** 1 teaspoon
*   **Vanilla extract:** 1/2 teaspoon
*   **Butter:** 1/2 cup, softened

**Instructions:**

1.  **Prepare the Eggs:** Crack the eggs into a bowl and whisk them together until they are light and fluffy.
2.  **Combine the Ingredients:** In a separate bowl, whisk the eggs with the milk, sugar, and vanilla extract until just combined.
3.  **Combine the Batter:** Gently stir in the butter until it's evenly distributed.
4.  **Pour and Bake:** Pour the batter into a greased baking dish. Bake in a 400°F (200°C) oven for 15-20 minutes, or until golden brown and bubbly.
5.  **Serve:** Serve the baklava with a dollop of whipped cream or a drizzle of honey.

**Tips and Variations:**

*   **For a thicker baklava:** You can use a thicker egg mixture.
*   **For a sweeter baklava:** Add a small amount of honey or maple syrup.
*   **Add a touch of nutmeg:** A sprinkle of nutmeg can add a warm and comforting flavor.
*   **Make it ahead:** You can prepare the batter ahead of time, then bake it just before serving.
*   **Enjoy!**

Enjoy your delicious baklava!

[ Prompt: 138.3 t/s | Generation: 73.4 t/s ]


Exiting...
```

## Controlling generation

```powershell
llama cli -hf ggml-org/gemma-4-e4b-it-GGUF:Q4_0 --temp 0.2 --top-k 40 --top-p 0.95
```

|Flag|Default|What it does|
|---|---|---|
|`--temp N`|`0.8`|Randomness; lower is more deterministic|
|`--top-k N`|`40`|Sample only from the K most likely tokens|
|`--top-p N`|`0.95`|Nucleus sampling probability mass|
|`--min-p N`|`0.05`|Drop tokens below this relative probability|
|`-n, --predict N`|`-1`|Max tokens to generate (-1 = unlimited)|
|`--repeat-penalty N`|`1.0`|Penalize repeated token sequences

## Performance and memory

```powershell
# Set the context window (0 = max context size model allows)
llama cli -m model.gguf -c 16384

# Keep MoE expert weights on the CPU; handy for big MoE models on small GPUs
llama cli -m model.gguf -cmoe
```

## For one-off media-text prompts, pass media files alongside your prompt.

```powershell
llama cli -hf ggml-org/gemma-4-e4b-it-GGUF:Q4_0 --image "image.png" -p "Describe this image."
```

## Reasoning models

```powershell
# Disable thinking entirely
llama cli -hf ggml-org/gemma-4-e4b-it-GGUF:Q4_0 -rea off

# Cap thinking at 1024 tokens
llama cli -m model.gguf --reasoning-budget 1024
```

## Help commandline

```powershell
llama cli -h
```

## Common configuration command

```powershell
llama serve -m model.gguf     -c 16384  # context size (pass 0 for model's native maximum)
    -ngl all           # GPU offload (default: auto)
    --host 0.0.0.0     # listen on all interfaces (default: 127.0.0.1)
    --port 8080
```

```powershell
PS C:\Users\hemanth> llama serve -m C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf -c 16384 -ngl all --host 0.0.0.0 --port 8080
0.00.065.206 I cmn  common_param: common_params_print_info: verbosity = 3 (adjust with the `-lv N` CLI arg)
0.00.066.887 W srv  llama_server: -----------------
0.00.066.892 W srv  llama_server: CORS is set to allow all origins ('*') and no API key is set
0.00.066.893 W srv  llama_server: this can be a security risk (cross-origin attacks)
0.00.066.893 W srv  llama_server: more info: https://github.com/ggml-org/llama.cpp/pull/25655
0.00.066.893 W srv  llama_server: -----------------
0.00.071.226 I srv    load_model: loading model 'C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf'
0.00.756.778 W load: control-looking token:    212 '</s>' was not control-type; this is probably a bug in the model. its type will be overridden
0.01.235.527 I srv    load_model: initializing, n_slots = 4, n_ctx_slot = 16384, kv_unified = 'true'
0.01.240.940 I srv  llama_server: model loaded
0.01.240.949 I srv  llama_server: listening on http://0.0.0.0:8080
```

```powershell
PS C:\Users\hemanth> curl.exe http://localhost:8080/v1/chat/completions -H "Content-Type: application/json" -d "{\`"messages\`": [{\`"role\`": \`"user\`", \`"content\`": \`"Hello!\`"}]}"
{"choices":[{"finish_reason":"stop","index":0,"message":{"role":"assistant","content":"Hello! I'm happy to help. How can I assist you?"}}],"created":1787602316,"model":"C:\\Users\\hemanth\\.cache\\huggingface\\hub\\models--ggml-org--gemma-3-270m-it-qat-GGUF\\snapshots\\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\\gemma-3-270m-it-qat-Q4_0.gguf","system_fingerprint":"b10217-ddd4ec142","object":"chat.completion","usage":{"completion_tokens":16,"prompt_tokens":11,"total_tokens":27,"prompt_tokens_details":{"cached_tokens":0}},"id":"chatcmpl-t4m2T5346SVemZxwdSIOxU5F2ubVRglo","timings":{"cache_n":0,"prompt_n":11,"prompt_ms":591.463,"prompt_per_token_ms":53.769363636363636,"prompt_per_second":18.597951182068872,"predicted_n":16,"predicted_ms":219.031,"predicted_per_token_ms":13.6894375,"predicted_per_second":73.0490204582913}}
PS C:\Users\hemanth>
PS C:\Users\hemanth> Invoke-RestMethod -Uri "http://localhost:8080/v1/chat/completions" -Method POST -Headers @{"Content-Type"="application/json"} -Body '{"messages": [{"role": "user", "content": "Hello!"}]}'


choices            : {@{finish_reason=stop; index=0; message=}}
created            : 1787602329
model              : C:\Users\hemanth\.cache\huggingface\hub\models--ggml-org--gemma-3-270m-it-qat-GGUF\snapshots\7dba9faa7cdb58c7dc44b238c7dbb00e391fbf65\gemma-3-270m-it-qat-Q4_0.gguf
system_fingerprint : b10217-ddd4ec142
object             : chat.completion
usage              : @{completion_tokens=11; prompt_tokens=11; total_tokens=22; prompt_tokens_details=}
id                 : chatcmpl-lkRp6sW8maZr0OTX50YtymjCOdDvWSNi
timings            : @{cache_n=6; prompt_n=5; prompt_ms=56.962; prompt_per_token_ms=11.3924; prompt_per_second=87.7778167901408; predicted_n=11; predicted_ms=141.352;
                     predicted_per_token_ms=12.850181818181818; predicted_per_second=77.8199105778482}
```

## Command to Start the server with a model and open it in your browser:

```powershell
llama serve -hf ggml-org/gemma-4-e4b-it-GGUF:Q4_0 -c 0
```


## Command to use OpenAI Python SDK

```python
import openai

client = openai.OpenAI(base_url="http://localhost:8080/v1", api_key="no-key-required")

completion = client.chat.completions.create(
    model="local-model",
    messages=[{"role": "user", "content": "Write a limerick about python exceptions"}],
)
print(completion.choices[0].message.content)
```

```powershell
python -m pip install openai
```

```powershell
PS C:\Users\hemanth> python localapi.py

There once were Python's flaws,
A curse that everyone's known,
But with a clever crack,
It could be thrown, a new whole!

```

## Reference

https://llama.app/docs/cli

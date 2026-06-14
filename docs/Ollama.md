## Ollama Command line tutorial

### Ollama command to run the LLM Model

```bash
ollama run deepseek-r1:1.5b
```

### Ollama command to exit from running LLM Model

```bash
Use Ctrl + d or /bye to exit.
>>> /bye
```

### Ollama command to list running mode 

```bash
>>> /list
NAME                ID              SIZE      MODIFIED
deepseek-r1:1.5b    e0979632db5a    1.1 GB    3 hours ago
```

```bash
ollama list
```

__Output__

```bash
NAME                ID              SIZE      MODIFIED
deepseek-r1:1.5b    e0979632db5a    1.1 GB    3 hours ago
```

```bash
ollama ps
```

__Output__

```bash
NAME                ID              SIZE      PROCESSOR    CONTEXT    UNTIL
deepseek-r1:1.5b    e0979632db5a    1.3 GB    100% CPU     4096       4 minutes from now
```

### Ollama command to stop the running LLM Model

```bash
ollama stop deepseek-r1:1.5b
```

### Ollama command to remove the LLM Model

```bash
ollama rm deepseek-r1:1.5b
```
__Output__

```bash
deleted 'deepseek-r1:1.5b'
```
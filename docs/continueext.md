## Install Continue with specific version

```powershell
code --install-extension continue.continue@1.0.5
```

## Create configuration

```powershell
mkdir -p C:\Users\<username>\.continue
code C:\Users\<username>\.continue\config.yaml
rm -v C:\Users\<username>\.continue\config.json
```

## Configuration yaml file

```yaml
name: Local Config
version: 1.0.0
schema: v1
models: 
  - title: "BITROID"
    provider: "ollama"
    model: "llama3.2:3"
    apiBase: "http://localhost:11434/v1"
    roles:
      - chat
      - edit
```

or 

```yaml
name: Local Config
version: 1.0.0
schema: v1
models: 
  - name: "Gemma 4"
    provider: "lmstudio"
    model: "gemma-4-e4b-it"
    apiBase: "http://127.0.0.1:1234/v1"
    roles:
      - chat
      - edit
      - apply
```
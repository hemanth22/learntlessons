## Install Continue with specific version

```powershell
code --install-extension continue.continue@1.0.5
```

## Create configuration

```powershell
mkdir -p C:\Users\<username>\.continue
code C:\Users\<username>\.continue\config.yaml
```

## Configuration yaml file

```powershell
name: Local Config
version: 1.0.0
schema: v1
models: 
  - title: "YODA"
    provider: "ollama"
    model: "llama3.2:3"
    apiBase: "http://localhost:11434"
    roles:
      - chat
      - edit
```
## LlamaCPP_Python

### How to configure python llamacpp in linux server

```bash
dnf -y install python3-pip python3-devel gcc gcc-c++ make jq
dnf -y install python3.14
python -m ensurepip
python -m pip install -U pip
```

### Startup of python virtual environment

```bash
python -m venv --system-site-packages ~/llama
```


### Download Small AI model

```bash
wget https://huggingface.co/bartowski/Qwen_Qwen3-0.6B-GGUF/resolve/main/Qwen_Qwen3-0.6B-Q4_K_M.gguf
```

### Startup of AI Model with python

```bash
python -m llama_cpp.server --model ./Qwen_Qwen3-0.6B-Q4_K_M.gguf --host 0.0.0.0 --port 8000 &
```

### Verifying AI output

```bash
[root@centos8 AIOnDevice]# curl http://0.0.0.0:8000/docs

    <!DOCTYPE html>
    <html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swagger-ui-dist@5/swagger-ui.css">
    <link rel="shortcut icon" href="https://fastapi.tiangolo.com/img/favicon.png">
    <title>🦙 llama.cpp Python API - Swagger UI</title>
    </head>
    <body>
    <div id="swagger-ui">
    </div>
    <script src="https://cdn.jsdelivr.net/npm/swagger-ui-dist@5/swagger-ui-bundle.js"></script>
    <!-- `SwaggerUIBundle` is now available on the page -->
    <script>
    const ui = SwaggerUIBundle({
        url: '/openapi.json',
    "dom_id": "#swagger-ui",
"layout": "BaseLayout",
"deepLinking": true,
"showExtensions": true,
"showCommonExtensions": true,
oauth2RedirectUrl: window.location.origin + '/docs/oauth2-redirect',
    presets: [
        SwaggerUIBundle.presets.apis,
        SwaggerUIBundle.SwaggerUIStandalonePreset
        ],
    })
    </script>
    </body>
    </html>
    [root@centos8 AIOnDevice]#
```

```bash
# curl -s -XPOST -H 'Content-Type: application/json' localhost:8000/v1/chat/completions \
-d '{"messages": [{"role": "user", "content": "Tell me about Hiroshima city, Japan."}]}' | jq | sed -e 's/\\n/\n/g'
{
  "id": "chatcmpl-5e33042c-b213-44c4-9b5a-29c3b69d117e",
  "object": "chat.completion",
  "created": 1789990696,
  "model": "./Qwen_Qwen3-0.6B-Q4_K_M.gguf",
  "choices": [
    {
      "index": 0,
      "message": {
        "content": "<think>
Okay, the user asked about Hiroshima city in Japan. Let me start by recalling what I know. Hiroshima was a major war site that caused extensive damage and loss of life during World War II. It's known for its atomic bomb, the Atomic Bomb Incident on July 16, 1945.

I need to mention the specific details: the location in Japan, the date, the significance in history, and the impact on society. Also, since it was a victim of war, there are ongoing discussions about peace and the importance of avoiding such tragedies.

Wait, should I include the aftermath? Maybe talk about how people still remember their past through museums and memorial sites. Also, check if there's any information I'm missing about Hiroshima beyond what's commonly known. Make sure to present the information clearly and concisely.
</think>

Hiroshima, located in the central part of Japan, is historically significant as a major wartime site during World War II. Here are key points about it:

1. **Location**: Situated on the island of Hiroshima, it was one of the first cities to be bombed by the United States during WWII. The atomic bomb test (the \"小男孩\" or \"Little Boy\") was conducted on July 16, 1945, near the city.

2. **Significance in History**: It is widely recognized for the catastrophic destruction caused by the atomic bomb, which resulted in over 100,000 lives lost and marked a turning point in global history. The bombings led to Japan's surrender on August 15, 1945, and left lasting scars.

3. **Memorial and Legacy**: Today, Hiroshima is a symbol of peace and memory. Museums, memorials, and international organizations commemorate the event to prevent similar tragedies. People still reflect on their past through various sites.

4. **Ongoing Reflections**: The city remains a focal point in discussions about human rights, war, and the importance of avoiding such devastating events. Many Japanese citizens continue to honor Hiroshima’s legacy today.",
        "role": "assistant"
      },
      "logprobs": null,
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 17,
    "completion_tokens": 429,
    "total_tokens": 446
  }
}
```

```bash
[root@centos8 AIOnDevice]# curl -s -XPOST -H 'Content-Type: application/json' localhost:8000/v1/chat/completions -d '{"messages": [{"role": "user", "content": "curl command failed with error curl: (35) TLS connect error: error:0A00010B:SSL routines::wrong version number"}]}' | jq
{
  "id": "chatcmpl-c6f6e2b3-3695-452d-a176-46f7e7dcbcef",
  "object": "chat.completion",
  "created": 1789993162,
  "model": "./Qwen_Qwen3-0.6B-Q4_K_M.gguf",
  "choices": [
    {
      "index": 0,
      "message": {
        "content": "<think>\nOkay, the user is encountering a TLS connect error with error code 0A00010B. Let me think about what that means. The SSL routines in OpenSSL are trying to handle versions of the protocol stack. So this might be related to version mismatches between the client's library and the server.\n\nFirst, I need to check if both the client and server are using the correct versions. Maybe the client is using OpenSSL 3.0 or newer, but the server expects a different version. On macOS, the default SSL implementation uses OpenSSL 1.x. So if there's an older version installed on the machine, that could be the issue.\n\nThe error message says \"wrong version number\". The SSL routines handle versions of the TLS protocol stack. If either the client or the server has a different version, this can cause a connection failure. For example, if the client is using OpenSSL 3 and the server expects older versions (like 1.x), that could be the problem.\n\nI should check which version is in use on both the client and server. On macOS, sometimes users might not have their SSL libraries set up properly. Maybe they installed an outdated version. Alternatively, maybe the system has a newer OpenSSL but it's not configured correctly.\n\nAnother possibility is that there are no available certificates from the server. If the server isn't using any certificate, the client can't establish a connection. So checking if the server's SSL configuration allows for a certificate could help. Also, verifying the server's TLS version and ensuring that it supports the same versions as the client.\n\nI should also consider if there are other factors like network issues or firewall restrictions. However, the main issue here seems to be the version mismatch between client and server libraries.\n\nSo, steps I can take:\n1. Check the installed OpenSSL versions on both the client and server.\n2. Ensure that they have compatible TLS versions.\n3. Update the libraries if necessary.\n4. Verify SSL configuration settings for both sides.\n\nAlso, maybe using tools like openssl.version to check which version is in use. That might help pinpoint the issue.\n</think>\n\nThe error `curl: (35) TLS connect error: error:0A00010B:SSL routines::wrong version number` indicates a **version mismatch between the client and server** when using OpenSSL libraries. Here's how to resolve it:\n\n### 1. **Check Installed OpenSSL Versions**\n   - Ensure both your client and server are using **compatible versions of OpenSSL**.\n   - On macOS, older SSL implementations (OpenSSL 1.x) may be preferred. If you're using newer OpenSSL, ensure compatibility with the TLS protocol stack.\n\n### 2. **Verify Server TLS Configuration**\n   - Check if the server supports TLS versions that match your client. For example:\n     - Client uses **TLSv1.2**, but server expects **TLSv1.0**.\n     - Or check the TLS version in `openssl` and server configuration (e.g., `/etc/ssl/openssl.conf`).\n\n### 3. **Update Libraries**\n   - If older versions are still present, update your OpenSSL libraries to a newer version (e.g., from 1.x to 3.x).\n   - For macOS, install the correct OpenSSL version using `brew install openssl` or manually.\n\n### 4. **Check Certificate Availability**\n   - Ensure the server is using valid certificates for TLS. If no certificate is provided, the client will fail to connect.\n\n### Example Commands:\n```bash\n# Check installed OpenSSL versions on client and server\nopenssl version -v\n\n# Verify server TLS configuration (if applicable)\nopenssl s_client --verify 1 --no-check-certificate -connect [server_ip] << EOF\n...\nEOF\n```\n\n### Common Fixes:\n- Update your OpenSSL libraries.\n- Ensure both the client and server are using **TLS v1.2 or newer**.\n- If older versions are used, consider updating to a more modern library.\n\nBy addressing these issues, you should resolve the TLS connect error.",
        "role": "assistant"
      },
      "logprobs": null,
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 40,
    "completion_tokens": 826,
    "total_tokens": 866
  }
}
```

# Curl Commands

## Get Command using curl

```powershell
Invoke-WebRequest -Uri "http://httpbin.org/json"
```

## Post Command using windows curl command with json output

```powershell
$url1="https://httpbin.org/post"
$header1 = @{
    "Content-Type" = "application/json"
}
$respone1=invoke-RestMethod -Uri $url1 -Method Post -Header $header1
$respone1
```

## Post Command using windows curl command with body

```powershell
$url2 = "https://httpbin.org/post"
$header2 = @{
    "Content-Type" = "application/json"
}
$data2 = @{
    key1 = "value1"
    key2 = "value2"
} | ConvertTo-Json
$response2 = Invoke-RestMethod -Uri $url2 -Method Post -Body $data2 -ContentType "application/json"
$response2
```

## Post Command using windows curl command with body

```powershell
$url2 = "https://httpbin.org/post"
$header2 = @{
    "Content-Type" = "application/json"
}
$data2 = @{
    key1 = "value1"
    key2 = "value2"
} | ConvertTo-Json
$response3 = Invoke-RestMethod -Uri $url2 -Method Post -Header $header2 -Body $data2
$response3
```
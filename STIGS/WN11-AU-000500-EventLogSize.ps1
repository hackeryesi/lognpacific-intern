
<#
.SYNOPSIS
    Toggles cryptographic protocols (secure vs insecure) on the system.
    Please test thoroughly in a non-production environment before deploying widely.
    Make sure to run as Administrator or with appropriate privileges.

.NOTES
    Author          : Yesi Gebreselassie
    LinkedIn        : inkedin.com/in/yesi-gebreselassie
    GitHub          : github.com/hackeryesi
     Website	   : thethirdeyehackers.com
    Date Created    : 2026-05-13
    Last Modified   : 2026-05-13
    Version         : 1.0
    CVEs            : CVE-2014-3566
                      CVE-2021-23839
                      CVE-2011-3389
    Plugin IDs      : 20007
                      104743
                      157288
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 2026-05-13
    Tested By       : Yesi Gebreselassie
    Systems Tested  : Windows Enterprise  Build 29H2
    PowerShell Ver. : 5.1.17763.6189

.USAGE

    PS C:\> .\WN11-AU-000500.ps1 
#>

# Configure Windows Application Event Log Maximum Size to 32 MB
# STIG: WN11-CC-000XXX (Example hardening setting)

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$ValueName = "MaxSize"
$ValueData = 0x00008000   # 32768 KB = 32 MB

# Create registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the registry value
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType DWord `
    -Force | Out-Null

Write-Host "Application Event Log maximum size configured successfully."

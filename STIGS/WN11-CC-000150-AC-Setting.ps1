<#
.SYNOPSIS
Configures the required AC power setting for STIG compliance.
Please test thoroughly in a non-production environment before deploying widely.
Make sure to run as Administrator or with appropriate privileges.


.DESCRIPTION
This script remediates the STIG finding requiring
the ACSettingIndex registry value to be set to 1.

Registry Path:
HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51

Registry Value:
ACSettingIndex = 1
STIG ID: WN11-CC-000150

.NOTES
Author          : Yesi Gebreselassie
    LinkedIn        : linkedin.com/in/yesi-gebreselassie
    GitHub          : github.com/hackeryesi
     Website	   : thethirdeyehackers.com
    Date Created    : 2026-05-17
    Last Modified   : 2026-05-17
    Version         : 1.0
Run as Administrator
.TESTED ON
    Date(s) Tested  : 2026-05-17
    Tested By       : Yesi Gebreselassie
    Systems Tested  : Windows Enterprise  Build 29H2
    PowerShell Ver. : 5.1.17763.6189

.USAGE

    PS C:\> .\WN11-CC-000150.ps1 
#>

# Define registry settings
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$ValueName = "ACSettingIndex"
$ValueData = 1

try {

    # Create registry path if missing
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    # Configure registry value
    New-ItemProperty `
        -Path $RegistryPath `
        -Name $ValueName `
        -Value $ValueData `
        -PropertyType DWord `
        -Force | Out-Null

    Write-Host "[SUCCESS] ACSettingIndex configured successfully." -ForegroundColor Green
}
catch {

    Write-Host "[ERROR] Failed to configure ACSettingIndex." -ForegroundColor Red
    Write-Host $_.Exception.Message
}

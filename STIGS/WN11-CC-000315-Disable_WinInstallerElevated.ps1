<#
.SYNOPSIS
Disables the Windows Installer "AlwaysInstallElevated" setting.
Please test thoroughly in a non-production environment before deploying widely.
Make sure to run as Administrator or with appropriate privileges.


.DESCRIPTION
This script remediates the Windows 11 STIG finding requiring
AlwaysInstallElevated to be disabled to prevent privilege escalation.
Disabling AlwaysInstallElevated prevents non-admin users from installing
MSI packages with elevated privileges, reducing privilege escalation risk

STIG ID:
WN11-CC-000315

Registry Path:
HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer


.NOTES
    Author          : Yesi Gebreselassie
    Run as Administrator
    LinkedIn        : inkedin.com/in/yesi-gebreselassie
    GitHub          : github.com/hackeryesi
     Website	   : thethirdeyehackers.com
     .TESTED ON
    Date(s) Tested  : 2026-05-16
    Tested By       : Yesi Gebreselassie
    Systems Tested  : Windows Enterprise  Build 29H2
    PowerShell Ver. : 5.1.17763.6189

.USAGE

    PS C:\> .\WN11-CC-000315.ps1 
#>


# Define registry path and value
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$ValueName = "AlwaysInstallElevated"
$ValueData = 0

try {

    # Create registry path if it does not exist
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    # Set registry value
    New-ItemProperty `
        -Path $RegistryPath `
        -Name $ValueName `
        -Value $ValueData `
        -PropertyType DWord `
        -Force | Out-Null

    Write-Host "[SUCCESS] AlwaysInstallElevated has been disabled." -ForegroundColor Green
}
catch {
    Write-Host "[ERROR] Failed to configure registry setting." -ForegroundColor Red
    Write-Host $_.Exception.Message
}

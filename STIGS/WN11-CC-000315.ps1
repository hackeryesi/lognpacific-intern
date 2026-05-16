<#
.SYNOPSIS
Disables the Windows Installer "AlwaysInstallElevated" setting.

.DESCRIPTION
This script remediates the Windows 11 STIG finding requiring
AlwaysInstallElevated to be disabled to prevent privilege escalation.

STIG ID:
WN11-CC-000315

Registry Path:
HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer

Registry Value:
AlwaysInstallElevated = 

.NOTES
    Author          : Yesi Gebreselassie
    Run as Administrator
    LinkedIn        : inkedin.com/in/yesi-gebreselassie
    GitHub          : github.com/hackeryesi
     Website	   : thethirdeyehackers.com
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

<#
.SYNOPSIS
Configures the required AC power setting for STIG compliance.

.DESCRIPTION
This script remediates the STIG finding requiring
the ACSettingIndex registry value to be set to 1.

Registry Path:
HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51

Registry Value:
ACSettingIndex = 1
STIG ID: WN11-CC-000150

.NOTES
Author: Yesi Gebreselassie
Run as Administrator
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

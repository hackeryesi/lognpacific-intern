<#
.SYNOPSIS
Configures strong Kerberos encryption types for STIG compliance.

.DESCRIPTION
This script remediates the STIG finding requiring
SupportedEncryptionTypes to be set to 2147483640.

Registry Path:
HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters

Registry Value:
SupportedEncryptionTypes = 2147483640

STIG ID: WN11-SO-000190

.NOTES
Author: Yesi Gebreselassie
Run as Administrator
#>

# Define registry settings
$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"
$ValueName = "SupportedEncryptionTypes"
$ValueData = 2147483640

try {

    # Create registry path if missing
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    # Configure SupportedEncryptionTypes
    New-ItemProperty `
        -Path $RegistryPath `
        -Name $ValueName `
        -Value $ValueData `
        -PropertyType DWord `
        -Force | Out-Null

    Write-Host "[SUCCESS] Kerberos encryption types configured successfully." -ForegroundColor Green
}
catch {

    Write-Host "[ERROR] Failed to configure Kerberos encryption types." -ForegroundColor Red
    Write-Host $_.Exception.Message
}

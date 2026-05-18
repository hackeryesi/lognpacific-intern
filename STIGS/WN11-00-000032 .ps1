<#
.SYNOPSIS
Configures the minimum BitLocker startup PIN length.

.DESCRIPTION
This script remediates the STIG finding requiring
the BitLocker startup PIN minimum length to be
set to 6 characters or greater.

Registry Path:
HKLM:\SOFTWARE\Policies\Microsoft\FVE

Registry Value:
MinimumPIN = 6

.NOTES
Author: Yesi Gebreselassie
Run as Administrator
#>

# Define registry settings
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$ValueName = "MinimumPIN"
$ValueData = 6

try {

    # Create registry path if missing
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    # Configure MinimumPIN value
    New-ItemProperty `
        -Path $RegistryPath `
        -Name $ValueName `
        -Value $ValueData `
        -PropertyType DWord `
        -Force | Out-Null

    Write-Host "[SUCCESS] BitLocker minimum startup PIN length configured to 6." -ForegroundColor Green
}
catch {

    Write-Host "[ERROR] Failed to configure BitLocker minimum PIN length." -ForegroundColor Red
    Write-Host $_.Exception.Message
}

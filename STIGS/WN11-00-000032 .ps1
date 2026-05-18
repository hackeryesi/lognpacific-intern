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
.NOTES
    Author          : Yesi Gebreselassie
    LinkedIn        : linkedin.com/in/yesi-gebreselassie
    GitHub          : github.com/hackeryesi
     Website	   : thethirdeyehackers.com
    Date Created    : 2026-05-17
    Last Modified   : 2026-05-17
Run as Administrator

STIG ID: WN11-00-000032 

.TESTED ON
    Date(s) Tested  : 2026-05-17
    Tested By       : Yesi Gebreselassie
    Systems Tested  : Windows Enterprise  Build 29H2
    PowerShell Ver. : 5.1.17763.6189

.USAGE

    PS C:\> .\WN11-00-000032.ps1 
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

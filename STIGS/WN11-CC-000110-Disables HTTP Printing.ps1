<#
.SYNOPSIS
Disables HTTP Printing for STIG compliance.
Please test thoroughly in a non-production environment before deploying widely.
Make sure to run as Administrator or with appropriate privileges.

.DESCRIPTION
This script remediates the STIG finding requiring
DisableHTTPPrinting to be set to 1.

Registry Path:
HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers

Registry Value:
DisableHTTPPrinting = 1

.NOTES
    Author          : Yesi Gebreselassie
    LinkedIn        : inkedin.com/in/yesi-gebreselassie
    GitHub          : github.com/hackeryesi
     Website	    : thethirdeyehackers.com
    Date Created    : 2026-05-18
    Last Modified   : 2026-05-18
    Version         : 1.0

STIG ID: WN11-CC-000110
 
.TESTED ON
    Date(s) Tested  : 2026-05-18
    Tested By       : Yesi Gebreselassie
    Systems Tested  : Windows Enterprise  Build 29H2
    PowerShell Ver. : 5.1.17763.6189

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000110.ps1 
#>

# Define registry settings
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$ValueName = "DisableHTTPPrinting"
$ValueData = 1

try {

    # Create registry path if missing
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    # Configure DisableHTTPPrinting
    New-ItemProperty `
        -Path $RegistryPath `
        -Name $ValueName `
        -Value $ValueData `
        -PropertyType DWord `
        -Force | Out-Null

    Write-Host "[SUCCESS] HTTP Printing has been disabled." -ForegroundColor Green
}
catch {

    Write-Host "[ERROR] Failed to disable HTTP Printing." -ForegroundColor Red
    Write-Host $_.Exception.Message
}

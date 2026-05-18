<#
.SYNOPSIS
Disables Internet Explorer 11 on Windows 11.

.DESCRIPTION
This script remediates the STIG finding requiring
Internet Explorer 11 (IE11) to be disabled or removed.

STIG ID : WN11-CC-000391
IE11 must not be installed or enabled.

.NOTES
 Author          : Yesi Gebreselassie
 LinkedIn        : linkedin.com/in/yesi-gebreselassie
 GitHub          : github.com/hackeryesi
 Website	       : thethirdeyehackers.com
 Date Created    : 2026-05-17
 Last Modified   : 2026-05-17
 Run as Administrator
 .TESTED ON
    Date(s) Tested  : 2026-05-17
    Tested By       : Yesi Gebreselassie
    Systems Tested  : Windows Enterprise  Build 29H2
    PowerShell Ver. : 5.1.17763.6189

.USAGE

    PS C:\> .\ WN11-CC-000391.ps1 
#>

try {

    Write-Host "[INFO] Disabling Internet Explorer 11..." -ForegroundColor Yellow

    # Disable IE11 Optional Feature
    Disable-WindowsOptionalFeature `
        -FeatureName Internet-Explorer-Optional-amd64 `
        -Online `
        -NoRestart

    Write-Host "[SUCCESS] Internet Explorer 11 has been disabled." -ForegroundColor Green
}
catch {

    Write-Host "[ERROR] Failed to disable Internet Explorer 11." -ForegroundColor Red
    Write-Host $_.Exception.Message
}

<#
.SYNOPSIS
Renames the built-in Guest account for STIG compliance.
Please test thoroughly in a non-production environment before deploying widely.
Make sure to run as Administrator or with appropriate privileges.

.DESCRIPTION
This script remediates the STIG finding requiring
the default Guest account to be renamed.

.NOTES
    Author          : Yesi Gebreselassie
    LinkedIn        : inkedin.com/in/yesi-gebreselassie
    GitHub          : github.com/hackeryesi
     Website	   : thethirdeyehackers.com
    Date Created    : 2026-05-18
    Last Modified   : 2026-05-18
    Version         : 1.0
    
STIG ID: WN11-SO-000025  

.TESTED ON
    Date(s) Tested  : 2026-05-18
    Tested By       : Yesi Gebreselassie
    Systems Tested  : Windows Enterprise  Build 29H2
    PowerShell Ver. : 5.1.17763.6189

    .USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-SO-000025.ps1 
#>

# Define new Guest account name
$NewGuestName = "DisabledGuest"

try {

    # Get current Guest account
    $GuestAccount = Get-LocalUser | Where-Object {
        $_.SID.Value -like "*-501"
    }

    if ($GuestAccount.Name -eq "Guest") {

        Rename-LocalUser `
            -Name "Guest" `
            -NewName $NewGuestName

        Write-Host "[SUCCESS] Guest account renamed to $NewGuestName" -ForegroundColor Green
    }
    else {

        Write-Host "[INFO] Guest account already renamed to $($GuestAccount.Name)" -ForegroundColor Yellow
    }
}
catch {

    Write-Host "[ERROR] Failed to rename Guest account." -ForegroundColor Red
    Write-Host $_.Exception.Message
}

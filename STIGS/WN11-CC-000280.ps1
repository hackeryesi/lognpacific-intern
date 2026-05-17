# =====================================================================
# STIG Remediation Script
# Vuln ID: Remote Desktop Services must always prompt a client for passwords upon connection.
# Requirement:
# HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
# Value Name : fPromptForPassword
# Value Type : REG_DWORD
# Value Data : 1
# =====================================================================

# Define registry path and value
$RegPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$ValueName = "fPromptForPassword"
$ValueData = 1

# Create registry path if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Configure the registry value
New-ItemProperty -Path $RegPath `
                 -Name $ValueName `
                 -Value $ValueData `
                 -PropertyType DWORD `
                 -Force | Out-Null

# Verification
$CurrentValue = Get-ItemProperty -Path $RegPath -Name $ValueName

Write-Host "STIG Remediation Applied Successfully" -ForegroundColor Green
Write-Host "$ValueName = $($CurrentValue.$ValueName)"

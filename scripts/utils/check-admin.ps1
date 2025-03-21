# Check Administrator Privileges

function Test-AdminPrivileges {
    return ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")
}

# Test if running as administrator
if (-not (Test-AdminPrivileges)) {
    Write-Warning "Please run as Administrator!"
    exit 1
}

Write-Host "Running with Administrator privileges." -ForegroundColor Green
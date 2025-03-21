# Terminal and PowerShell Setup Script

function Setup-Terminal {
    # Configure Windows Terminal settings
    $terminalSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    $terminalConfigPath = Join-Path $PSScriptRoot "..\..\config\terminal\settings.json"

    if (Test-Path $terminalConfigPath) {
        Copy-Item -Path $terminalConfigPath -Destination $terminalSettingsPath -Force
    }

    # Install and configure Oh My Posh
    $poshThemePath = Join-Path $PSScriptRoot "..\..\config\terminal\oh-my-posh\theme.omp.json"
    
    if (Test-Path $poshThemePath) {
        Copy-Item -Path $poshThemePath -Destination "$env:USERPROFILE\Documents\WindowsPowerShell\PoshThemes\" -Force
    }

    Write-Host "Terminal configuration completed successfully!" -ForegroundColor Green
}

function Setup-PowerShell {
    # Set up PowerShell profile
    $profilePath = $PROFILE
    $profileConfigPath = Join-Path $PSScriptRoot "..\..\config\powershell\Microsoft.PowerShell_profile.ps1"

    if (Test-Path $profileConfigPath) {
        Copy-Item -Path $profileConfigPath -Destination $profilePath -Force
    }

    # Reload PowerShell profile
    . $PROFILE

    Write-Host "PowerShell profile configuration completed successfully!" -ForegroundColor Green
}
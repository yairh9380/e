# Chocolatey Installation and Basic Utilities Setup

function Install-Chocolatey {
    if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Chocolatey..." -ForegroundColor Yellow
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    } else {
        Write-Host "Chocolatey is already installed" -ForegroundColor Green
    }
}

function Install-BasicUtilities {
    $packages = @(
        '7zip',
        'winrar',
        'windows-terminal',
        'nano',
        'curl',
        'wget',
        'git',
        'oh-my-posh',
        'powershell-core'
    )

    foreach ($package in $packages) {
        Write-Host "Installing $package..." -ForegroundColor Yellow
        choco install $package -y

        if ($LASTEXITCODE -ne 0) {
            Write-Warning "Failed to install $package"
        } else {
            Write-Host "Successfully installed $package" -ForegroundColor Green
        }
    }
}

function Setup-OhMyPosh {
    # Instalar módulos necesarios
    Install-Module -Name PSReadLine -Force -SkipPublisherCheck
    Install-Module -Name Terminal-Icons -Force

    # Configurar Oh My Posh
    $poshThemePath = "$env:USERPROFILE\Documents\WindowsPowerShell\PoshThemes"
    if (!(Test-Path $poshThemePath)) {
        New-Item -ItemType Directory -Path $poshThemePath -Force
    }

    # Copiar tema personalizado
    $sourceTheme = Join-Path $PSScriptRoot "..\..\config\terminal\oh-my-posh\theme.omp.json"
    Copy-Item -Path $sourceTheme -Destination "$poshThemePath\theme.omp.json" -Force

    # Actualizar perfil de PowerShell
    $profileContent = @"
# Import modules
Import-Module oh-my-posh
Import-Module Terminal-Icons
Import-Module PSReadLine

# Set Oh My Posh theme
oh-my-posh init pwsh --config \"$poshThemePath\theme.omp.json\" | Invoke-Expression

# Configure PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Set aliases
Set-Alias -Name g -Value git
Set-Alias -Name ll -Value ls
"@

    Set-Content -Path $PROFILE -Value $profileContent -Force
}

function Initialize-BasicSetup {
    Install-Chocolatey
    Install-BasicUtilities
    Setup-OhMyPosh
    
    Write-Host "Basic setup completed successfully!" -ForegroundColor Green
}
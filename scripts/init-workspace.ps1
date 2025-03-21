# Initialize workspace for El Capulin Windows 11 Dotfiles
$baseDir = "c:\Users\canoy\Documents\Windows11 dotfiles"

# Create all directories
$directories = @(
    ".github\workflows",
    "scripts\modules",
    "scripts\utils",
    "config\terminal\oh-my-posh\plugins",
    "config\powershell",
    "config\vscode",
    "packages",
    "docs"
)

foreach ($dir in $directories) {
    $path = Join-Path $baseDir $dir
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force
        Write-Host "Created directory: $path"
    }
}

# Create initial files with basic content
$files = @{
    ".github\workflows\test-scripts.yml" = @"
name: Test Scripts
on: [push, pull_request]
jobs:
  test:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v2
      - name: Test PowerShell Scripts
        shell: pwsh
        run: |
          # Add testing logic here
"@

    "scripts\modules\windows.ps1" = @"
# Windows 11 Activation and Settings Configuration
# This script handles Windows activation and basic system settings

function Set-WindowsActivation {
    # Windows activation logic will go here
}

function Set-WindowsSettings {
    # Windows settings configuration will go here
}
"@

    "scripts\modules\packages.ps1" = @"
# Package Installation Script
# Handles Chocolatey installation and package management

function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
"@

    "scripts\utils\check-admin.ps1" = @"
function Test-AdminPrivileges {
    return ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")
}
"@

    "packages\base.txt" = @"
7zip
winrar
windows-terminal
nano
curl
wget
git
oh-my-posh
"@

    "packages\dev.txt" = @"
vscode
nodejs
yarn
deno
nvm
"@

    "config\terminal\settings.json" = @"
{
    "profiles": {
        "defaults": {
            "fontFace": "CaskaydiaCove NF",
            "colorScheme": "One Half Dark"
        }
    }
}
"@

    "config\powershell\Microsoft.PowerShell_profile.ps1" = @"
# Import modules
Import-Module oh-my-posh
Set-PoshPrompt -Theme paradox

# Set aliases
Set-Alias -Name g -Value git
"@

    "docs\CUSTOMIZATION.md" = @"
# El Capulin Customization Guide

## Terminal Customization
Instructions for customizing Windows Terminal and Oh My Posh...

## VSCode Setup
Instructions for setting up VSCode with recommended extensions...
"@
}

foreach ($file in $files.GetEnumerator()) {
    $path = Join-Path $baseDir $file.Key
    if (-not (Test-Path $path)) {
        Set-Content -Path $path -Value $file.Value
        Write-Host "Created file: $path"
    }
}

Write-Host "Workspace initialization completed successfully!"
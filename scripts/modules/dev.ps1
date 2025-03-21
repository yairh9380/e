# Development Environment Setup Script

function Setup-DevEnvironment {
    # Configure Git global settings
    git config --global core.autocrlf true
    git config --global init.defaultBranch main

    # Configure VSCode
    $vsCodeSettingsPath = "$env:APPDATA\Code\User\settings.json"
    $vsCodeConfigPath = Join-Path $PSScriptRoot "..\..\config\vscode\settings.json"

    if (Test-Path $vsCodeConfigPath) {
        Copy-Item -Path $vsCodeConfigPath -Destination $vsCodeSettingsPath -Force
    }

    # Install VSCode extensions
    Install-VSCodeExtensions

    # Configure Node.js environment
    npm install -g yarn
    npm install -g pnpm
    npm install -g typescript
    npm install -g @vue/cli
    npm install -g @angular/cli

    # Configure Python environment
    python -m pip install --upgrade pip
    pip install virtualenv
    pip install pipenv
    pip install poetry

    Write-Host "Development environment setup completed successfully!" -ForegroundColor Green
}
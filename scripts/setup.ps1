# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run as Administrator!"
    exit
}

# Create directory structure
$baseDir = "c:\Users\canoy\Documents\Windows11 dotfiles"
$dirs = @(
    ".github\workflows",
    "scripts\modules",
    "scripts\utils",
    "config\terminal\oh-my-posh\plugins",
    "config\powershell",
    "config\vscode",
    "packages",
    "docs"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Path "$baseDir\$dir" -Force
}

# Create base files
$files = @{
    "scripts\modules\windows.ps1" = "# Windows activation and settings script"
    "scripts\modules\packages.ps1" = "# Package installation script"
    "scripts\modules\terminal.ps1" = "# Terminal setup script"
    "scripts\modules\dev.ps1" = "# Development environment setup"
    "packages\base.txt" = "7zip`nwinrar`nwindows-terminal`nnano`ncurl`nwget`ngit"
    "packages\dev.txt" = "vscode`nnodejs`nyarn`ndeno"
    "docs\README.md" = "# El Capulin - Windows 11 Dotfiles`n`nMinimalist Windows 11 setup automation"
}

foreach ($file in $files.GetEnumerator()) {
    Set-Content -Path "$baseDir\$($file.Key)" -Value $file.Value
}

Write-Host "Workspace structure created successfully!"
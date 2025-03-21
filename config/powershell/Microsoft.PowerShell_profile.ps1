# PowerShell Profile Configuration

# Import modules
Import-Module oh-my-posh
Import-Module Terminal-Icons

# Set Oh My Posh theme
oh-my-posh init pwsh --config "$env:USERPROFILE\Documents\WindowsPowerShell\PoshThemes\theme.omp.json" | Invoke-Expression

# Set aliases
Set-Alias -Name g -Value git
Set-Alias -Name ll -Value ls
Set-Alias -Name grep -Value Select-String

# Custom functions
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Set PSReadLine options
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Set environment variables
$env:EDITOR = 'code'
$env:VISUAL = 'code'

# Custom prompt configuration
function prompt {
    $currentDirectory = $ExecutionContext.SessionState.Path.CurrentLocation
    $promptString = "$($currentDirectory.Path)> "
    return $promptString
}
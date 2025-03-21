# El Capulin - Windows 11 Dotfiles

## Directory Structure
```tree
c:\Users\canoy\Documents\Windows11 dotfiles
├── .github/
│   └── workflows/
│       └── test-scripts.yml
├── scripts/
│   ├── setup.ps1              # Main setup script
│   ├── modules/
│   │   ├── windows.ps1        # Windows activation and settings
│   │   ├── packages.ps1       # Chocolatey and package installation
│   │   ├── terminal.ps1       # Terminal and Oh My Posh setup
│   │   └── dev.ps1           # Development environment setup
│   └── utils/
│       ├── check-admin.ps1
│       └── logging.ps1
├── config/
│   ├── terminal/
│   │   ├── settings.json
│   │   └── oh-my-posh/
│   │       ├── theme.omp.json
│   │       └── plugins/
│   ├── powershell/
│   │   └── Microsoft.PowerShell_profile.ps1
│   └── vscode/
│       ├── settings.json
│       └── extensions.list
├── packages/
│   ├── base.txt              # Basic utilities
│   └── dev.txt               # Development tools
└── docs/
    ├── README.md
    └── CUSTOMIZATION.md
```
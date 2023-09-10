write-host 'AIB Customization: Install Notepad++'
# Check if Chocolatey is installed
if(!(Test-Path -Path "$env:ProgramData\chocolatey\choco.exe")) {
    write-host 'Chocolatey not found, installing now'
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install Notepad++
$chocoInstallCommand = 'choco install notepadplusplus -y'
Invoke-Expression -Command $chocoInstallCommand
write-host 'AIB Customization: Finished Install Notepad++'

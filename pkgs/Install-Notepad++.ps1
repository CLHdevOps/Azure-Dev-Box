# Corey Hughes

# Check if Chocolatey is installed
write-host 'AIB Customization: Check if Chocolatey is installed'
if ((Get-Command choco -ErrorAction SilentlyContinue) -eq $null) {
    write-host 'AIB Customization: Install Chocolatey'
    # Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install Notepad++
write-host 'AIB Customization: Install Notepad++'
choco install notepadplusplus -y

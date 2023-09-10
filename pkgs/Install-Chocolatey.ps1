write-host 'AIB Customization: Install Chocolatey'
$appName = 'choco'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath
$chocoURL = 'https://chocolatey.org/install.ps1'
$chocoURLScript = 'install.ps1'
$outputPath = $LocalPath + '\' + $chocoURLScript
Invoke-WebRequest -Uri $chocoURL -OutFile $outputPath
write-host 'AIB Customization: Starting Install Chocolatey'
Start-Process -FilePath "powershell" -Verb RunAs -ArgumentList "-File `"$outputPath`"" -Wait
write-host 'AIB Customization: Finished Install Chocolatey'








# Corey Hughes
# write-host 'AIB Customization: Packer check'
# function Get-IsPacker() {
# 	return ((Get-ChildItem env:packer_* | Measure-Object).Count -gt 0)
# }

# function Invoke-FileDownload() {
# 	param(
# 		[Parameter(Mandatory=$true)][string] $url,
# 		[Parameter(Mandatory=$false)][string] $name,
# 		[Parameter(Mandatory=$false)][boolean] $expand		
# 	)

# 	$path = Join-Path -path $env:temp -ChildPath (Split-Path $url -leaf)
# 	if ($name) { $path = Join-Path -path $env:temp -ChildPath $name }

#   write-host 'AIB Customization: Downloading $url > $path'
# 	Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing
	
# 	if ($expand) {
# 		$arch = Join-Path -path $env:temp -ChildPath ([System.IO.Path]::GetFileNameWithoutExtension($path))

#         write-host 'AIB Customization: Expanding $path > $arch'
# 		Expand-Archive -Path $path -DestinationPath $arch -Force

# 		return $arch
# 	}
	
# 	return $path
# }

# $env:chocolateyUseWindowsCompression = 'false'

# if (-not (Get-IsPacker)) {
# 	write-host 'AIB Customization: Starting transcript ...'
# 	Start-Transcript -Path ([System.IO.Path]::ChangeExtension($MyInvocation.MyCommand.Path, 'log')) -Append | Out-Null
# }

# write-host 'AIB Customization: Downloading Chocolatey'
# $installer = Invoke-FileDownload -url 'https://chocolatey.org/install.ps1'

# write-host 'AIB Customization: Installing Chocolatey'
# & $installer | Out-Null
# write-host 'AIB Customization: Finished Install Chocolatey'

# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

$ProgressPreference = 'SilentlyContinue'	# hide any progress output

function Invoke-FileDownload() {
	param(
		[Parameter(Mandatory=$true)][string] $url,
		[Parameter(Mandatory=$false)][string] $name,
		[Parameter(Mandatory=$false)][boolean] $expand		
	)

	$path = Join-Path -path $env:temp -ChildPath (Split-Path $url -leaf)
	if ($name) { $path = Join-Path -path $env:temp -ChildPath $name }
	
	write-host 'AIB Customization: Downloading $url > $path'
	Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing
	
	if ($expand) {
		$arch = Join-Path -path $env:temp -ChildPath ([System.IO.Path]::GetFileNameWithoutExtension($path))

        write-host 'AIB Customization: Expanding $path > $arch'
		Expand-Archive -Path $path -DestinationPath $arch -Force

		return $arch
	}
	
	return $path
}

write-host 'AIB Customization: Downloading Radzio Modbus Master Simulator'
$archive = Invoke-FileDownload -url "https://en.radzio.dxp.pl/modbus-master-simulator/RMMS.zip" -expand $true

$source = Join-Path $archive -ChildPath "RMMS.exe"
$destination = Join-Path ([Environment]::GetFolderPath("CommonDesktopDirectory")) -ChildPath "RMMS.exe"

write-host 'AIB Customization: Copying Radzio Modbus Master Simulator to Desktop'
Copy-Item -Path $source -Destination $destination -Force | Out-Null


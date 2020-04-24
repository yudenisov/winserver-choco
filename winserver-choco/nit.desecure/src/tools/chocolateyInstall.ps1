$checksum = 'B9D5610F820F08FD85367857BBCE09BA'
$packageName = 'NIT.DESECURE'
$installerType = 'msi'
$url = 'http://anticriminalonline.ru/choco/NIT.DESECURE.msi'
$silentArgs = '/norestart /QN'
$validExitCodes = @(0)
$packageName1 = 'Nit Desecure'

Write-Host "Uninstall Previous Versions..."
$all_programs = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
if( $all_programs -match $packageName1 )
{
	(Get-WmiObject Win32_Product -Filter "Name='$packageName1'").Uninstall()
	Write-Host "Uninstall complete"
}
else
{
	Write-Host "Previos Versions not Found"
}

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = $installerType
  url            = $url
  silentArgs     = $silentArgs
  validExitCodes = @(0)
  softwareName   = $packageName1
  checksum       = $checksum
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs

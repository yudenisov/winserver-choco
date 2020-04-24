$checksum = 'E5F616FC41679121814AE039AFF446C8'
$packageName = 'nit.AdobeDistribUniv'
$installerType = 'msi'
$url = 'http://anticriminalonline.ru/choco/AdobeDistribUniv.msi'
$silentArgs = '/norestart /QN'
$validExitCodes = @(0)
$packageName1 = 'AdobeDistribUniv'

Write-Host "Uninstall Previous Versions..."
$all_programs = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
if( $all_programs -match $packageName1 )
{
	(Get-WmiObject Win32_Product -Filter "Name='$packageName1'").Uninstall()
	Write-Host "Uninstall complete"
}
else
{
	Write-Host "Previous Versions not Found"
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

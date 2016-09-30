$ErrorActionPreference = 'Stop';

$packageName= 'android-sdk.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.google.com/android/installer_r24.4.1-windows.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Android SDK Tools'

  checksum      = 'f9b59d72413649d31e633207e31f456443e7ea0b'
  checksumType  = 'sha1'

  
  silentArgs   = '/S /ALLUSERS=1'
}

Install-ChocolateyPackage @packageArgs

if ("${Env:ProgramFiles(x86)}")
{
    Install-ChocolateyPath "${Env:ProgramFiles(x86)}\Android\android-sdk\tools" 'Machine'
    Install-ChocolateyPath "${Env:ProgramFiles(x86)}\Android\android-sdk\platform-tools" 'Machine'
}
else
{
    Install-ChocolateyPath "${Env:ProgramFiles}\Android\android-sdk\tools" 'Machine'
    Install-ChocolateyPath "${Env:ProgramFiles}\Android\android-sdk\platform-tools" 'Machine'
}

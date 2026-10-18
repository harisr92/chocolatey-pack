# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

# 1. See the _TODO.md that is generated top level and read through that
# 2. Follow the documentation below to learn how to create a package for the package type you are creating.
# 3. In Chocolatey scripts, ALWAYS use absolute paths - $toolsDir gets you to the package's tools directory.
$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Internal packages (organizations) or software that has redistribution rights (community repo)
# - Use `Install-ChocolateyInstallPackage` instead of `Install-ChocolateyPackage`
#   and put the binaries directly into the tools folder (we call it embedding)
#$fileLocation = Join-Path $toolsDir 'NAME_OF_EMBEDDED_INSTALLER_FILE'
# If embedding binaries increase total nupkg size to over 1GB, use share location or download from urls
#$fileLocation = '\\SHARE_LOCATION\to\INSTALLER_FILE'
# Community Repo: Use official urls for non-redist binaries or redist where total package size is over 200MB
# Internal/Organization: Download from internal location (internet sources are unreliable)

$version = $env:ChocolateyPackageVersion
$tag     = "v$version"
$baseUrl = "https://github.com/harisr92/accounting-tui/releases/download/$tag"

# Detect native system architecture accurately
$rawArch = if ($env:PROCESSOR_ARCHITEW6432) {
  $env:PROCESSOR_ARCHITEW6432
} else {
  $env:PROCESSOR_ARCHITECTURE
}

if ($rawArch -match 'ARM64') {
  $fileName = "compter-tui-windows-arm64.zip"
  $checksum = '2e81ea2322dc34634584ae063e100f6a1d4e91479e1c8a8cafe4ac466b0d7875'
} elseif ($rawArch -match 'AMD64|x86_64') {
  $fileName = "compter-tui-windows-x86_64.zip"
  $checksum = 'bb7e2b5ab831521c8603b31198768537cebb73ade909367ee28756d960a35a27'
} else {
  throw "Unsupported processor architecture: $arch"
}

$url = "$baseUrl/$fileName"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
}

Write-Host "Downloading binary from: $url" -ForegroundColor Cyan

Install-ChocolateyZipPackage @packageArgs

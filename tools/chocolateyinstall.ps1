$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

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
  $checksum = 'a560db93a88d40280f95348f43bafebc3ba0139dd28aedbe967544e50c4df58e'
} elseif ($rawArch -match 'AMD64|x86_64') {
  $fileName = "compter-tui-windows-x86_64.zip"
  $checksum = '52ebb9e6de0e6eb4fdaa886876b94e0c371c61cbfae32b6344386bff67c28892'
} else {
  throw "Unsupported processor architecture: $rawArch"
}

$url = "$baseUrl/$fileName"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
}

Write-Host "Downloading binary from: $url" -ForegroundColor Cyan

Install-ChocolateyZipPackage @packageArgs

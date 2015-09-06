# Based on the chocolatey installer script from https://chocolatey.org/install.ps1
$tempDir = 'C:\tmp'
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

$url = "https://github.com/JonathanPorta/windows-bootstrap/archive/master.zip"
$file = Join-Path $tempDir "bootstrap.zip"

function Download-File {
param (
  [string]$url,
  [string]$file
 )
  Write-Host "Downloading $url to $file"
  $downloader = new-object System.Net.WebClient
  $downloader.Proxy.Credentials=[System.Net.CredentialCache]::DefaultNetworkCredentials;
  $downloader.DownloadFile($url, $file)
}

# download the package
Download-File $url $file

# download 7zip
Write-Host "Download 7Zip commandline tool"
$7zaExe = Join-Path $tempDir '7za.exe'

Download-File 'https://chocolatey.org/7za.exe' "$7zaExe"

# unzip the package
Write-Host "Extracting $file to $tempDir..."
Start-Process "$7zaExe" -ArgumentList "x -o`"$tempDir`" -y `"$file`"" -Wait -NoNewWindow

$toolsDir = Join-Path $tempDir 'windows-bootstrap-master'
$installer = Join-Path $toolsDir 'install.ps1'

get-variable -scope script
cd $toolsDir
iex $installer
get-variable -scope script

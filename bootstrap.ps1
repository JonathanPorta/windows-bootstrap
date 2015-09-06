# bootstrap.ps1
#
# Installs needed files to bootstrap a fresh windows server installation for game hosting.
# Based on the chocolatey installer script from https://chocolatey.org/install.ps1
# For more information: https://github.com/JonathanPorta/windows-bootstrap
#

# Make sure we have a temp directory
$tempDir = 'C:\tmp'
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

# define a downloader function to make downloading easier
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

# download windows-bootstrap repo
Write-Host "Download windows-bootstrap files..."
$bootstrapArchive = Join-Path $tempDir "bootstrap.zip"
Download-File 'https://github.com/JonathanPorta/windows-bootstrap/archive/master.zip' $bootstrapArchive

# download 7zip
Write-Host "Download 7Zip commandline tool..."
$7zaExe = Join-Path $tempDir '7za.exe'
Download-File 'https://chocolatey.org/7za.exe' "$7zaExe"

# unzip the package
Write-Host "Extracting $bootstrapArchive to $tempDir..."
Start-Process "$7zaExe" -ArgumentList "x -o`"$tempDir`" -y `"$bootstrapArchive`"" -Wait -NoNewWindow

# define installer path vars
$bootstrapDir = Join-Path $tempDir 'windows-bootstrap-master'
$toolsDir = Join-Path $bootstrapDir 'powershell'
$chefDir = Join-Path $bootstrapDir 'chef-solo'
$installer = Join-Path $bootstrapDir 'install.ps1'

# define chef path vars
# TODO: abstract this config to make it easier to provision other server types
$cookbookUrl = 'https://github.com/JonathanPorta/rust-server-cookbook.git'
$cookbookPath = 'C:\cookbooks\rust'
$cookbookRef = 'master'

# Start the installation
Write-Host "Begin installation..."
iex $installer

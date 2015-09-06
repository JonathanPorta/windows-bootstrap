# install all of the pieces and parts necessary to get the server ready to
# start running chef converges.

Write-Host "Downloading and running Chocolatey install script..."
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Launching git installer..."
cinst -y git.install

Write-Host "Launching chef powershell installer script..."
$chefInstaller = Join-Path $toolsDir 'chef-installer.ps1'
iex $chefInstaller

Write-Host "Launching chef repo powershell script..."
$chefRepo = Join-Path $toolsDir 'chef-repo.ps1'
iex $chefRepo

Write-Host "Launching chef-solo powershell script..."
$chefSolo = Join-Path $toolsDir 'chef-solo.ps1'
iex $chefSolo

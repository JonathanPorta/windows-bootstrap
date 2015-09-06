Write-Host "Downloading and running Chocolatey install script..."
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Launching chef powershell installer script..."
iex .\powershell\chef-installer.ps1

Write-Host "Launching git installer..."
cinst -y git.install

Write-Host "Launching chef repo powershell script..."
iex .\powershell\chef-repo.ps1

Write-Host "Launching chef-solo powershell script..."
iex .\powershell\chef-solo.ps1

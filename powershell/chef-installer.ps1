# requires that bootstrap.ps1 setup the proper paths and download function.

# Download the chef-solo installer
$chefSoloInstaller = Join-Path $tempDir 'chef-solo.msi'
Write-Host "Downloading chef-solo MSI to $chefSoloInstaller"
Download-File 'https://www.opscode.com/chef/install.msi' "$chefSoloInstaller"

# Execute the installer and pass the exit code through to the shell
(Start-Process -FilePath "msiexec.exe" -ArgumentList "/package $chefSoloInstaller /passive" -Wait -Passthru).ExitCode

# Download the chef-dk installer
$chefDkInstaller = Join-Path $tempDir 'chef-solo.msi'
Write-Host "Downloading chef-dk MSI to $chefDkInstaller"
Download-File 'https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chefdk-0.4.0-1.msi' "$chefDkInstaller"

# Execute the installer and pass the exit code through to the shell
(Start-Process -FilePath "msiexec.exe" -ArgumentList "/package $chefDkInstaller /passive" -Wait -Passthru).ExitCode

# Download the chef-solo installer
$chefSoloInstaller = Join-Path $tmpDir 'chef-solo.msi'
Write-Host "Downloading chef-solo MSI to $chefSoloInstaller..."
DoFileDownload 'https://www.opscode.com/chef/install.msi' "$chefSoloInstaller"

# Execute the installer and pass the exit code through to the shell
Write-Host "Running the chef-solo installer..."
(Start-Process -FilePath "msiexec.exe" -ArgumentList "/package $chefSoloInstaller /passive" -Wait -Passthru).ExitCode

# Download the chef-dk installer
$chefDkInstaller = Join-Path $tmpDir 'chef-dk.msi'
Write-Host "Downloading chef-dk MSI to $chefDkInstaller..."
DoFileDownload 'https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chefdk-0.4.0-1.msi' "$chefDkInstaller"

# Execute the installer and pass the exit code through to the shell
Write-Host "Running the chef-dk installer..."
(Start-Process -FilePath "msiexec.exe" -ArgumentList "/package $chefDkInstaller /passive" -Wait -Passthru).ExitCode

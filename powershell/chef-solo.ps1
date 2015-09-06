# TODO: Abstract this config in order to run on other server types.
$chefConfig = Join-Path $chefDir 'solo.rb'
$chefRunList = Join-Path $chefDir 'run_list.json'

Write-Host "Preparing to run chef-solo using config from $chefConfig using run list from $chefRunList..."
Write-Host "Running: "
Write-Host "chef-solo -c $chefConfig -j $chefRunList"

(Start-Process -FilePath "chef-solo" -ArgumentList "-c $chefConfig -j $chefRunList" -Wait -Passthru).ExitCode

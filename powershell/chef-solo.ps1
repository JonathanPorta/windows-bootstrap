$chefConfig = './chef-solo/solo.rb'
$chefRunList = './chef-solo/run_list.json'

Write-Host "Preparing to run chef-solo using config from $chefConfig using run list from $chefRunList"
chef-solo -c $chefConfig -j $chefRunList

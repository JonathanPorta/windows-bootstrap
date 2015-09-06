# save this so we can cd back to the starting directory before the script exits
$startingDir = $PWD

# Clone the repository
Write-Host "Cloning $cookbookUrl into $cookbookPath..."
git clone $cookbookUrl $cookbookPath

Write-Host "Reseting repository in $cookbookPath to origin/$cookbookRef"
cd $cookbookPath
git fetch origin
git reset --hard origin/$cookbookRef
cd $startingDir

Write-Host "Installing cookbook dependencies..."
cd $cookbookPath
berks install
cd $startingDir

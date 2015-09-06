# TODO: rethink and rewrite this. this is a bad way to handle getting the
# cookbook and its deps onto the endpoint but it will have to work for now.

# save this so we can cd back to the starting directory before the script exits
$startingDir = $PWD

# clone the repository
Write-Host "Cloning $cookbookUrl into $cookbookPath..."
git clone $cookbookUrl $cookbookPath

# do a hard reset to the target ref to ensure we are up to date
Write-Host "Reseting repository in $cookbookPath to origin/$cookbookRef"
cd $cookbookPath
git fetch origin
git reset --hard origin/$cookbookRef
cd $startingDir

# ensure all cookbook dependencies are installed
Write-Host "Installing cookbook dependencies..."
cd $cookbookPath
berks install
cd $startingDir

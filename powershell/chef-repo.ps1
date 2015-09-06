$tempDir = 'C:\tmp'
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

$startingDir = $PWD
$cookbookUrl = 'https://github.com/JonathanPorta/rust-server-cookbook.git'
$cookbookPath = 'C:\cookbooks\rust'
$cookbookRef = 'master'

# Clone the repository
Write-Host "Cloning $cookbookUrl into $cookbookPath"
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

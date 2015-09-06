$tempDir = 'C:\tmp'

$gitUrl = 'https://github.com/JonathanPorta/rust-server-cookbook.git'
$repoPath = 'C:\cookbooks\rust'
$repoRef = 'master'

# Clone the repository
Write-Host "Cloning $gitUrl into $repoPath"
git clone $gitUrl $repoPath

Write-Host "Reseting repository in $repoPath to origin/$repoRef"
cd $repoPath
git fetch origin
git reset --hard origin/$repoRef

Write-Host "Installing cookbook dependencies..."
cd $repoPath
berks install

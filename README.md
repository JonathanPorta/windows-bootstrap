# windows-bootstrap
Some Powershell crap to bootstrap a Windows game server

# Install
Open Powershell and set your current Powershell session to allow scripts to run:

`PowerShell.exe -ExecutionPolicy Unrestricted`

Then you can download the bootstrap script by running:

```
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/JonathanPorta/windows-bootstrap/master/bootstrap.ps1'))
```

This will download a copy of this repository, unzip it, and then run `install.ps1`.

Or, better yet, one command:

```
PowerShell.exe -ExecutionPolicy Unrestricted "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/JonathanPorta/windows-bootstrap/master/bootstrap.ps1'))"
```

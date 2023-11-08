# Windows 

## PowerShell config 

make PowerShell usable using [Oh-my-posh](https://ohmyposh.dev/) 

best to install it using `winget` 

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

## Aliases 

To simulate the behaviour of Linux environment, couple of aliases have been made
see `~/powershell/Microsoft.PowerShell_profile.ps1`

otherwise new version of powershell tends to have good alias support by default 
use `Get-Alias`

for specific alias (`grep`-like search):

```powershell
Get-Alias -Name "rmdir" #finds alias for rmdir
```

## Start Up 

To avoid welcome message in WSL Settings PowerShell starting add `-NoLogo` parameter e.g.

```powershell
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo
```
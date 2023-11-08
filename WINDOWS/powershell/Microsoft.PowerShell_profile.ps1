Import-Module posh-git
# oh-my-posh init pwsh --config ~/pwsh10k.omp.json | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/montys.omp.json" | Invoke-Expression

New-Alias -Name l -Value Get-ChildItem
Set-Alias -Name grep -Value Select-String

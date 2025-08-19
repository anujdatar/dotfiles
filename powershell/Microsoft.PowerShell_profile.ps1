# find profile location using `echo $PROFILE`
# most probably "C:\Users\<username>\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

# oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
# Import-Module -Name Terminal-Icons

Invoke-Expression (&starship init powershell)

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"

function CD_CODE { Set-Location code_folder_location }
function CD_WORK { Set-Location work_folder_location }

Set-Alias cdcode CD_CODE
Set-Alias work CD_WORK

function quit_me { exit }
Set-Alias q quit_me
Set-Alias c clear

function explore_here { explorer . }
Set-Alias e "explore_here"

Set-Alias vim nvim
function nvim-setup {
	Set-Location C:\Users\<username>\AppData\Local\nvim
	nvim .
}

function PING_GOOGLE { ping www.google.com }
function PING_GOOGLE6 { ping -6 www.google.com }
#function PING_NAS {ping 192.168.1.200}
#function SSH_NAS {ssh rock64@192.168.1.200}

Set-Alias goog PING_GOOGLE
Set-Alias goog6 PING_GOOGLE6
#Set-Alias nasp PING_NAS
#Set-Alias nssh SSH_NAS

#$env:PATH += ";C:\Users\<username>\.anm\versions\current;"

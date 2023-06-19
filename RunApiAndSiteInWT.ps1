<#
.DESCRIPTION
    Run an API and a web site inside windows terminal with automtic split
#>

$ErrorActionPreference = 'Stop';

[string]$executionString = ""
$runApi = 'new-tab --title "API" -d "./Example/Api" -p "Windows PowerShell" powershell -noexit "dotnet watch run"'
$runSite = 'split-pane --title "Site" --vertical -d "./Example/Site" -p "Windows PowerShell" powershell -noexit "npm run serve"'

$executionString = "$runApi; $runSite"

# Verify if Windows Terminal is installed
$exists = (Get-Command wt -ErrorAction SilentlyContinue).Path

[string]$wtError = "Sometimes the Windows Terminal is installed but the wt.exe is not accessible, so follow this steps: https://stackoverflow.com/a/67888339/12542704`n";

if (-not $exists) {
    Write-Output "To run this script Windows Terminal must be installed. Download here: https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701"
    Write-Output $wtError;
    return;
}

try {
    Start-Process wt $executionString -ErrorAction SilentlyContinue
}
catch {
    Write-Error $wtError
}

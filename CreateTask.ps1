# $scriptToExecutePath = "C:\\backup-mongo.ps1";
# $taskName = "MongoDB Backup - <databaseName>"
# $taskDescription = "Make a dump of <databaseName> database"

$ErrorActionPreference = 'Stop'

$pathScriptToExecute = ""
$taskName = ""
$taskDescription = ""

function Show-ErrorMessage([string] $message) {
  Write-Output -Message $message `
    -ForegroundColor Red `
    -BackgroundColor White
}

function Get-TaskInfo {
  $script:pathScriptToExecute = Read-Host "Please enter the path to the PowerShell script"
  $script:taskName = Read-Host "Please enter the name of the task"
  $script:taskDescription = Read-Host "Please enter the description of the task (optional)"

  Check-Param
}

function Check-Param {
  if ([String]::IsNullOrEmpty($pathScriptToExecute) -or -not ($pathScriptToExecute | Test-Path)  ) {
    Show-ErrorMessage "The script path doesn't exists"
    $script:pathScriptToExecute = Read-Host "Please enter the path to the PowerShell script"
    Check-Param
    return
  }

  if ([String]::IsNullOrEmpty($taskName)) {
    Show-ErrorMessage "The name of the task can not be empty"
    $script:taskName = Read-Host "Please enter the username"
    Check-Param
    return;
  }
}

Get-TaskInfo

$taskExists = Get-ScheduledTask | Where-Object { $_.TaskName -like $taskName }

if ($taskExists) {
  Show-ErrorMessage "An taks with the name $taskName already exists!"
  exit
}

if ([String]::IsNullOrEmpty($taskDescription)) {
  $taskDescription = "MongoDB Backup"
}

$action = New-ScheduledTaskAction `
  -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' `
  -Argument "-NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass -File $pathScriptToExecute"

$trigger = New-ScheduledTaskTrigger -Daily -At 1am

$taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8

Register-ScheduledTask `
  -TaskName $taskName `
  -Action $action `
  -Trigger $trigger `
  -Settings $taskSettings `
  -Description $taskDescription

$runTask = Read-Host "Run task immediatly? [y/n] (y) "

$noOptions = @('n', 'no')

if ($runTask -in $noOptions) {
  return
}

# OBS: If you need to run the task manually for testing use:
Start-ScheduledTask -TaskName $taskName

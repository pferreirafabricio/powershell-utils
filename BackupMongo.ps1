<#  Set the MongoDB access variables  #>
param(
  [string]$authenticationDatabase = "admin",
  [string]$mongoDbHost = "localhost:27017",
  [string]$uri = "",
  [string]$databaseName = "",
  [string]$username = "",
  [SecureString]$password,
  [string]$backupPath = "C:\Backup\",
  [bool]$createSystemTask = $true
)

$ErrorActionPreference = 'Stop'

function Show-ErrorMessage([string] $message) {
  Write-Host -Message $message `
    -ForegroundColor Red `
    -BackgroundColor White
}

function Get-AccessVariable() {
  $script:databaseName = Read-Host "Please enter the database name"

  [string]$useConnectionString = Read-Host "Use connection string for backup? [y/n] (y)"

  $noOptions = @('n', 'no')

  if ($useConnectionString -notin $noOptions) {
    $script:uri = Read-Host "Please enter your connection string"

    if ([String]::IsNullOrEmpty($script:uri)) {
      Show-ErrorMessage "Connection string empty"
      Get-AccessVariable
      return
    }

    return
  }

  $script:username = Read-Host "Please enter the username"
  $script:password = Read-Host "Please enter the password" -AsSecureString
  $script:backupPath = Read-Host "Please enter the backup path"

  $script:authenticationDatabase = Read-Host "Please enter the authenticanion database (default is admin)"

  if ([String]::IsNullOrEmpty($script:authenticationDatabase)) {
    $script:authenticationDatabase = "admin"
  }

  $script:mongoDbHost = Read-Host "Please enter the mongodb host (default is `localhost:27017`)"

  if ([String]::IsNullOrEmpty($script:authenticationDatabase)) {
    $script:authenticationDatabase = "localhost:27017"
  }

  Verfiy-Param
}

function Verfiy-Param() {
  if ([String]::IsNullOrEmpty($script:backupPath) -or -not ($script:backupPath | Test-Path)  ) {
    Show-ErrorMessage "The backup's folders doesn't exists, so it will be created"
    New-Item -ItemType Directory -Force -Path $script:backupPath | Out-Null
  }

  if (-not [String]::IsNullOrEmpty($script:uri)) {
    return;
  }

  if (
    -not [String]::IsNullOrEmpty($script:username) -and
    -not [String]::IsNullOrEmpty($script:password) -and
    -not [String]::IsNullOrEmpty($script:databaseName)
  ) {
    return;
  }

  Get-AccessVariable
}

Verfiy-Param

<#  Set the folder's location and name  #>
$currentDate = Get-Date -format yyyyMMddHHmm
$directoryName = "$databaseName-$currentDate"
$directoryPath = Join-Path $backupPath $directoryName

<#  Zip  #>
$zippedFileDestinationPath = "$backupPath\$directoryName.zip"

#region Backup process

$watch = New-Object System.Diagnostics.StopWatch
$watch.Start()
Write-Host "Backing up the Database: '$databaseName' to local directory: $backupPath."

if (-not [String]::IsNullOrEmpty($uri)) {
  # Use this command when the database require authorization
  mongodump --uri "$uri" -o "$directoryPath"
} elseif (
  -not [String]::IsNullOrEmpty($username) -and
  -not [String]::IsNullOrEmpty($password) -and
  -not [String]::IsNullOrEmpty($databaseName)
) {
  # Or use this command
  mongodump -h "$mongoDbHost" `
    -d "$databaseName" `
    -u "$username" `
    -p "$password" `
    --authenticationDatabase "$authenticationDatabase" `
    -o "$directoryPath"
} else {
  # Or use this command when database has no password defined
  mongodump -h "$mongoDbHost" -d "$databaseName" -o "$directoryPath"
}

$watch.Stop();
Write-Host "MongoDB backup completed in " $watch.Elapsed.ToString()

# Zip the folder
Write-Host "Zipping backup's folder..."
Compress-Archive -Path "$directoryPath" -DestinationPath $zippedFileDestinationPath

# Delete the backup folter created
Write-Host "Delete backup's folder"
Remove-Item "$directoryPath" -Recurse

#endregion

# if (-not $createSystemTask) {
#   return;
# }

# & "./create-task.ps1"

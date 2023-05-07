param(
  [Parameter(Mandatory = $true)]
  [string] $FolderPath,
  [Parameter(Mandatory = $true)]
  [string] $FileExtension,
  [string] $Filters
)

Get-ChildItem -Path $FolderPath -Filter $Filters `
| Sort-Object -Property CreationTime `
| ForEach-Object { $index = 1 } {
  $currentPath = $_.FullName.ToString()

  $newName = ([string]$index).PadLeft(3, '0')
  Rename-Item -Path $currentPath -NewName "$newName.$FileExtension"
  $index++
}

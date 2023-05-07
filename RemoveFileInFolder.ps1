param(
  [Parameter(Mandatory = $true)]
  [string] $FolderPath,
  [Parameter(Mandatory = $true)]
  $FileName
)

if (-not ($FolderPath | Test-Path)  ) {
  return $false
}

$fullPath = Join-Path $FolderPath $FileName;

if (-not ($fullPath | Test-Path)  ) {
  return $false
}

Remove-Item $fullPath

return $true
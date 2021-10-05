[string]$folderPath = './folder'

if (-not ($folderPath | Test-Path)  ) {
  return
}

Get-ChildItem -Path $folderPath | Foreach-Object {
  $fileToExclude = $_.FullName + "/some-file.txt"

  if (-not ($fileToExclude | Test-Path)) {
    return
  }

  Remove-Item $fileToExclude
}

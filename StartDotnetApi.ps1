$ErrorActionPreference = "Stop"

Write-Host "Starting API`n"

Start-Process `
  -FilePath "powershell.exe" `
  -WorkingDirectory "Path/To/Api" ` # or use "$PSScriptRoot/Subfolder/Api"
  -ArgumentList "-NoExit dotnet watch run" `
  -PassThru | Out-Null
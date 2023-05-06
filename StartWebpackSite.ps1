$ErrorActionPreference = "Stop"
# You could set the value of NODE_ENV before the project runs
$env:NODE_ENV = "development"

Write-Host "Starting site`n"

Start-Process `
  -FilePath "powershell.exe" `
  -WorkingDirectory "Path/To/Site" ` # or use "$PSScriptRoot/Subfolder/Site"
  -ArgumentList "-NoExit npm run serve" `
  -PassThru | Out-Null

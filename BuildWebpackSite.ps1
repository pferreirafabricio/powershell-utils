$ErrorActionPreference = "Stop"
$env:NODE_ENV = "production"
$publishFolder = "Folder/To/Generate/Build"

Write-Output "Building site..."

$process = Start-Process `
    -FilePath "npm" `
    -WorkingDirectory "Path/To/Site" `
    -ArgumentList "run build" `
    -PassThru

$process.WaitForExit();

Write-Output "Build generated at: $publishFolder"
Invoke-Item -Path $publishFolder

$packageJsonPath = "Path/To/Site/package.json"
$sitePackageConfig = Get-Content -Raw $packageJsonPath | ConvertFrom-Json

return [pscustomobject]@{
    version   = $sitePackageConfig.version
    buildPath = $publishFolder
}

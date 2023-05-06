$ErrorActionPreference = "Stop"

$apiPath = "Path/To/Api"
$apiPublishPath = "Path/To/Api/bin/Release/netcoreapp3.1/publish"

Write-Host "Building API..."

$process = Start-Process `
    -FilePath "dotnet" `
    -WorkingDirectory $apiPath `
    -ArgumentList "publish -c Release" `
    -PassThru

$process.WaitForExit();

if (-not ($apiPublishPath | Test-Path)) {
    Write-Host "Build directory doesn't exist"
    return
}

Write-Host "Build generated at: $apiPublishPath"

[string]$deleteFiles = Read-Host "Remove .json, .pdb and .config files? [y/n] (y)"

$noOptions = @('n', 'no')

if ($deleteFiles -in $noOptions) {
    return
}

Get-ChildItem -Path $apiPublishPath | ForEach-Object {
    if ($_.GetType().Name -Eq "DirectoryInfo") {
        return
    }

    if ($_.Name -NotLike "*.json" -And $_.Name -NotLike "*.pdb" -And $_.Name -NotLike "*.config") {
        return
    }

    if ($_.Name -Like "*.deps.json" -Or $_.Name -Like "*.runtimeconfig.json") {
        return
    }

    Remove-Item $_.FullName
}

Write-Host "Files removed with success"
# Discomment this line if you want to open the folder with the build files
# Invoke-Item -Path $apiPublishPath

$apiExeFilePath = $apiPublishPath + "/TestApi.exe"

$apiExecutable = Get-Item $apiExeFilePath

return [pscustomobject]@{
    # Returns the current version of the API
    version   = $apiExecutable[0].VersionInfo.FileVersion
    buildPath = $apiPublishPath
}

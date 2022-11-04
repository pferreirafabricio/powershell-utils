param(
    [Parameter(Mandatory = $true)]
    [string] $PathtoFile,
    [Parameter(Mandatory = $true)]
    $ContentToAdd
)

if (!(Test-Path $PathtoFile)) {
    New-Item $PathtoFile -ItemType File -Value ("" | Out-String) | Out-Null
}

$previousContent = (Get-Content -Path $PathtoFile -Raw -Encoding UTF8).Trim()
Set-Content -Path $PathtoFile -Value ($ContentToAdd + $previousContent) -Encoding UTF8
param(
    [Parameter(Mandatory = $true)]
    [string[]]$ArraySet,
    [Parameter(Mandatory = $true)]
    [string]$StringToVerify
)

return ($ArraySet | ForEach-Object { $StringToVerify.Contains($_) }) -Contains $true
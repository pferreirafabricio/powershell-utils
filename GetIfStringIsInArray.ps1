param(
    [Parameter(Mandatory = $true)]
    [string[]]$ArraySet,
    [Parameter(Mandatory = $true)]
    [string]$StringToVerify
)

return ($ArraySet | % { $StringToVerify.Contains($_) }) -Contains $true
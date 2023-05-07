param(
    [Parameter(Mandatory = $True)]
    [string]$Value,
    [Parameter(Mandatory = $True)]
    [string]$Start,
    [Parameter(Mandatory = $True)]
    [string]$End
)

$firstIndex = $Value.IndexOf($Start)
$lastIndex = $Value.LastIndexOf($End)

if ($firstIndex -eq -1) {
	Write-Output "Start string $Start not found in $Value"
	return
}

if ($lastIndex -eq -1) {
	Write-Output "End string $End not found in $Value"
	return
}

# If you want to include the $Start string in the result, just remove the + 1
$startIndex = $firstIndex + 1

# If you want to include the $End string in the result, just add + 1
$length = ($lastIndex - $firstIndex) - 1

$finalString = $Value.Substring($startIndex, $length)

Write-Output $finalString

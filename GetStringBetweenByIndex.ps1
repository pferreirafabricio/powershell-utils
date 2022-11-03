$originalString = "Hello world"

$firstIndex = $originalString.IndexOf('H')
$lastIndex = $originalString.IndexOf('o')

$startIndex = $firstIndex + 1
$length = ($lastIndex - $firstIndex) - 1;

$finalString = $originalString.Substring($startIndex, $length)

Write-Host $finalString # returns 'ell'

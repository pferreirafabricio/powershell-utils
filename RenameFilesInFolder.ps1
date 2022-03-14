$path = "C:\some\path"
# $fileType = "*.png"

Get-ChildItem -Path $path | Sort-Object -Property CreationTime | ForEach-Object { $index = 1 } {
    $path = $_.ToString()
    $path
    
    $newName = ([string]$index).PadLeft(3,'0')
    Rename-Item -Path $path -NewName "$newName.png"
    $index++
}

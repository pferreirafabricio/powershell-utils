function GetPreviousCommands($Total = 20) {
  cat (Get-PSReadlineOption).HistorySavePath -Tail $Total
}

Set-Alias -Name "cm-his" -Value GetPreviousCommands

# Credits: https://stackoverflow.com/a/72307524/12542704

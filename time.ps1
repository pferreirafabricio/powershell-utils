Function time() {
  $command = $args -join ' '
  Measure-Command { Invoke-Expression $command | Out-Default }
}

# Credits: https://stackoverflow.com/a/69058193/12542704

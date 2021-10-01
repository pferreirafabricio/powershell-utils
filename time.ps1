Function time() {
  $command = $args -join ' '
  Measure-Command { Invoke-Expression $command | Out-Default }
}

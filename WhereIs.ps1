function RunWhere($command) {
    (Get-Command $command).Path
}

Set-Alias -Name "whereis" -Value RunWhere

# Example: whereis php
# Output: C:\tools\php74\php.exe

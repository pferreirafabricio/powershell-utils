Describe 'WhereIs' {
    It 'Show the correct executable path' {
        . .\WhereIs.ps1
        
        $executableName = '';

        if ($IsLinux) {
            $executableName = 'pwsh';
        } elseif ($IsMacOs) {
            $executableName = 'pwsh';
        } else {
            $executableName = 'powershell';
        }

        $result = whereis $executableName

        $result | Should -Be 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
    }
}
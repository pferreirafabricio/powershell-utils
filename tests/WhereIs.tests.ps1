Describe 'WhereIs' {
    It 'Show the correct executable path' {
        . .\WhereIs.ps1
        $result = whereis 'powershell'

        $result | Should -Be 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
    }
}
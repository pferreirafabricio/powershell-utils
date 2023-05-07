Describe 'WhereIs' {
    It 'Show the correct executable path' {
        . .\WhereIs.ps1
        
        $executableName = '';
        $expectedPath = @();

        if ($IsLinux -Or $IsMacOs) {
            $executableName = 'pwsh';
            $expectedPath = @('*powershell/7/pwsh', '*usr/bin/pwsh');
        } else {
            $expectedPath = @('*WindowsPowerShell\v1.0\powershell.exe', '*PowerShell\7\pwsh.exe');
            $executableName = 'powershell';
        }

        $result = whereis $executableName
        $expectedPath -Like $result
        
        # In Windows we should check for Windows Powershell and Powershell Core
        if ($IsWindows) {
            $result = whereis 'pwsh'
            $expectedPath -Like $result
        }
    }
}
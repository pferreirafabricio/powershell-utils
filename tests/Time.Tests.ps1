Describe 'Time' {
    It 'Should return time span' {
        . .\Time.ps1
        $result = time (1 + 1)

        $result.GetType().FullName | Should -Be 'System.TimeSpan';
    }
}
Describe 'RemoveFileInFolder' {
    BeforeAll {
        $fileName = 'version-test.txt';
        New-Item (Join-Path $TestDrive $fileName)
    }

    It "Test if version-test.txt exist" {
        (Test-Path -Path (Join-Path $TestDrive $fileName)  ) | Should -Be $true
    }

    It 'Should remove the version-test.txt file' {
        $result = . .\RemoveFileInFolder.ps1 -FolderPath $TestDrive -FileName $fileName
        $result | Should -Be $true
    }
}
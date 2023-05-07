Describe 'RenameFilesInSequence' {
    BeforeAll {
        $filesToCreate = @('file1.txt', 'file2.txt', 'file3.txt', 'other.png');
        $filesToCreate | ForEach-Object {
            New-Item (Join-Path $TestDrive $_)
        }
    }

    It 'Should have files in sequence' {
        . .\RenameFilesInSequence.ps1 `
            -FolderPath $TestDrive `
            -FileExtension 'txt' `
            -Filters "*.txt"

        $items = Get-ChildItem -Path $TestDrive -Filter "*.txt"

        $items.Length | Should -Be 3
        $items[0].Name | Should -Be '001.txt'
        $items[1].Name | Should -Be '002.txt'
        $items[2].Name | Should -Be '003.txt'
    }
}
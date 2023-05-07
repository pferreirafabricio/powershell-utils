Describe 'AddContentToTopOfFile' {
    BeforeAll {
        $fullPathToFile = Join-Path $TestDrive 'top-of-file.txt';
        New-Item $fullPathToFile;
        'first line' > $fullPathToFile;
    }

    It 'Should show `second line` on top of file' {
        $textToAdd = "second line";

        . .\AddContentToTopOfFile.ps1 -PathtoFile $fullPathToFile -ContentToAdd ($textToAdd + "`n")
        $content = Get-Content -Path $fullPathToFile -First 1

        $content | Should -Be $textToAdd
    }
}
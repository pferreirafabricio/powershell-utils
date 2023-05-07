Describe 'GetStringBetweenByIndex' {
    It 'Should return `ello Wor`' {
        $result = ./GetStringBetweenByIndex.ps1 `
            -Value "Hello World" `
            -Start "He" `
            -End "ld"

        $result | Should -Be 'ello Wor'
    }
}

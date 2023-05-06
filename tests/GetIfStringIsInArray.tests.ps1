Describe 'GetIfStringIsInArray' {
    It 'Shows true' {
        $result = ./GetIfStringIsInArray.ps1 `
            -ArraySet @('work', 'paper') `
            -StringToVerify "I work in a paper company" 

        $result | Should -Be $true
    }
}
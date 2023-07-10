function Remove-MergedBranches {
  git branch --merged |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ -NotMatch "^\*" } |
    Where-Object { -not ( $_ -Like "*master" -or $_ -Like "*main" ) } |
    ForEach-Object { git branch -d $_ }
}

# Credtis: https://stackoverflow.com/a/24143004/12542704

# Credits: https://stackoverflow.com/a/49515414/12542704

param(
    [int]$NumberOfCommits = 10
)

[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$header = @("commit", "tree", "parent", "refs", "subject", "body", "author", "commiter")

[string] $gitLogs = (git --no-pager log -n $NumberOfCommits --no-merges --pretty=format:'%H|%T|%P|%D|%s|%b|%an|%cn;')
$replacedArray = $gitLogs.Replace("; ", ';') -split ";", 0, "multiline";

$handledLogs = foreach ($commit in $replacedArray) {
    $prop = $commit -split "\|"
    $hash = [ordered]@{}

    for ($index = 0; $index -lt $header.Count; $index++) {
        # Example: author: 'John'
        $hash.add($header[$index], $prop[$index])
    }

    [pscustomobject]$hash
}

$convertedLogs = $handledLogs | ConvertTo-Json -Depth 10
$convertedLogs | ForEach-Object { Write-Output $_ }

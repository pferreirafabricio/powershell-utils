# Powershell Utilities 
[![Unit tests](https://github.com/pferreirafabricio/powershell-utils/actions/workflows/tests.yml/badge.svg)](https://github.com/pferreirafabricio/powershell-utils/actions/workflows/tests.yml)
[![Linting](https://github.com/pferreirafabricio/powershell-utils/actions/workflows/linting.yml/badge.svg)](https://github.com/pferreirafabricio/powershell-utils/actions/workflows/linting.yml)

## Adding it to the PowerShell profile

You can add these scripts to your PowerShell profile to make them easier for use.

> [!NOTE]
> Note that for PowerShell Core and PowerShell Windows, there are different profile files

Example:

```powershell
# open the configuration file for your PowerShell

> code $profile
```

```powershell
# inside Microsoft.Powershell_profile.ps1 file

function RunWhere($command) {
    (Get-Command $command).Path
}

Set-Alias -Name "whereis" -Value RunWhere
```

> [!NOTE]
> To learn more about how you can configure your powershell profiles, take a look at [about_Profiles](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4)



## 🐍 Scripts
- [Time.ps1](./Time.ps1) - Short function that works like time on Unix <br/>
```powershell
# Example: 
> ./Time.ps1 # execute the script
> time dotnet run # use the function to measure the time of a certain command
```
- [RemoveFileInFolder.ps1](./RemoveFileInFolder.ps1) - Loop through folders and remove a file

- [RenameFilesInFolder.ps1](./RenameFilesInFolder.ps1) - Loop through a folder and rename files by creation time

- [CreateTask.ps1](./CreateTask.ps1) - Create a system task on Windows

- [backup-mongo-db](https://github.com/pferreirafabricio/backup-mongo-db) - Make a backup of a MongoDB database

- [WhereIs.ps1](./WhereIs.ps1) - Find the path of the executable
```powershell
# Example: 
> ./WhereIs.ps1 # Execute the script
> whereis php
C:\tools\php74\php.exe
```

- [GetStringBetweenByIndex.ps1](./GetStringBetweenByIndex.ps1) - Return a string inside a start and final index
```powershell
# Example: 
> ./GetStringBetweenByIndex.ps1 -Value "Hello World" -Start "He" -End "ld"
ello Wor
``` 

- [ConvertGitLogToJson.ps1](./ConvertGitLogToJson.ps1) - Convert the output of git log command in JSON
```powershell
# Example: 
> ./ConvertGitLogToJson.ps1 -NumberOfCommits 1
[
  {
    "commit": "f9f320eeea4c4329896a785f083c04279526064f",
    "tree": "4841da995b423e1d748ccfd908976070e435f254",  
    "parent": "f78937b304446b504a0ad9ea101d995193431528",
    "refs": "HEAD -> main, origin/main, origin/HEAD",    
    "subject": "Update README.md",
    "body": "",
    "author": "Fabrício Pinto Ferreira",
    "commiter": "GitHub"
  }
]
``` 

- [GetIfStringIsInArray.ps1](./GetIfStringIsInArray.ps1) - Verify if the string contains any other strings present in the array
```powershell
# Example: 
> ./GetIfStringIsInArray.ps1 -ArraySet @('work', 'paper') -StringToVerify "I work in a paper company"
True
``` 

- [RunApiAndSiteInWT.ps1](./RunApiAndSiteInWT.ps1) - Run an API and Site in a tab of Windows Terminal

- [StartDotnetApi.ps1](./StartDotnetApi.ps1) - Run a Dotnet API

- [StartWebpackSite.ps1](./StartWebpackSite.ps1) - Run a Webpack project (like Vue or React)

- [BuildDotnet.ps1](./BuildDotnet.ps1) - Build a Dotnet API

- [BuildWebpackSite.ps1](./BuildWebpackSite.ps1) - Build a Webpack project (like Vue or React)

- [RemoveMergedBranches.ps1](./RemoveMergedBranches.ps1) - Remove all merged branches in a git repository (this script only removes merged branches and does not use the -D flag)

- [PreviousCommands.ps1](./PreviousCommands.ps1) - Returns a list of the previous commands (by default it'll return the last 20 commands)

## 🎹 Commands

- [SetClipboardWithPath.ps1](./SetClipboardWithPath.ps1) - Short version to get the current path into your clipboard

# Powershell Utilities

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


- [BackupMongo.ps1](./BackupMongo.ps1) - Make a backup of a MongoDB database

- [WhereIs.ps1](./WhereIs.ps1) - Find the path of the executable
```powershell
# Example: 
> ./WhereIs.ps1 # execute the script
> whereis php
C:\tools\php74\php.exe
```

- [GetStringBetweenByIndex.ps1](./GetStringBetweenByIndex.ps1) - Return a string inside a start and final index
```powershell
# Example: 
> ./GetStringBetweenByIndex.ps1 -Value "Hello World" -Start "He" -End "ld"
ello Wor
``` 
   

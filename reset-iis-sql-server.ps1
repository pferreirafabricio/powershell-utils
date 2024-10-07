Write-Host "Restarting IIS"
iisreset
Write-Host "IIS restarted"

Stop-Service -Name 'MSSQL$SQLEXPRESS' -Force
Write-Host "SQL Server stopped"

Start-Service -Name 'MSSQL$SQLEXPRESS'
Write-Host "SQL Server started"

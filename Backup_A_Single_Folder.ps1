# Creates a compressed backup zip file of whatever directory you choose as your path.
# By default it will go to a directory named Backups. To change, use -Path when running the script.
# Example:  PS C:\> ./Backup-Script.ps1 -Path cd'./yourbackupdirectory'
# This will save the backup.zip file to the YourBackupDirectory directory instead of the default Backups.

Param(
    [string]$Path = './backups',
    [string]$DestinationPath = './'
)

$date = Get-Date -format "yyyy-MM-dd"
Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup' + $date)"
Write-Host "Created a backup at $($DestinationPath + 'backup' + $date + '.zip')"


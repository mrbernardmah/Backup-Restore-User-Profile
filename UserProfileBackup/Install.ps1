

#region Config
$AppName = $PName + "_"+ $Pversion +"_Package"
$client = "Mr B SOE Way"
$logPath = "$env:ProgramData\$client\logs"
$logFile = "$logPath\Backup Chrome Edge Signatures to OneDrive.log"

#endregion
#region Logging
if (!(Test-Path -Path $logPath)) {
    New-Item -Path $logPath -ItemType Directory -Force | Out-Null
}


Start-Transcript -Path $logFile -Force

Write-Host "Backup Chrome Edge Signatures to OneDrive...."

# Create a tag file just so Intune knows this was installed
    if (-not (Test-Path "$($env:ProgramData)\MrB\Backup")) {
        Mkdir "$($env:ProgramData)\MrB\Backup"
    }
    Set-Content -Path "$($env:ProgramData)\MrB\Backup\Backup.ps1.tag" -Value "Installed"



#creates folders in Onedrive
New-item -path "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup" -ItemType Directory
New-item -path "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Edge" -ItemType Directory
New-item -path "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Chrome" -ItemType Directory
New-item -path "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Signatures" -ItemType Directory

#Copies from device to OneDrive
Copy-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks" -Destination "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Edge"
Copy-Item -Path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Bookmarks" -Destination "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Chrome"
Copy-Item -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Signatures\*" -Destination "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Signatures"

Write-Host "Script completed successfully.."
Stop-Transcript
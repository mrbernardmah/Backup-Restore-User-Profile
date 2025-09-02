

#region Config
$AppName = $PName + "_"+ $Pversion +"_Package"
$client = "MR B SOE Way"
$logPath = "$env:ProgramData\$client\logs"
$logFile = "$logPath\Restore Chrome Edge Signatures to PC.log"

#endregion
#region Logging
if (!(Test-Path -Path $logPath)) {
    New-Item -Path $logPath -ItemType Directory -Force | Out-Null
}


Start-Transcript -Path $logFile -Force

Write-Host "Restore Chrome Edge Signatures to PC...."

# Create a tag file just so Intune knows this was installed
    if (-not (Test-Path "$($env:ProgramData)\MrB\Restore")) {
        Mkdir "$($env:ProgramData)\MrB\Restore"
    }
    Set-Content -Path "$($env:ProgramData)\MrB\Restore\Backup.ps1.tag" -Value "Installed"



#Copies from device to OneDrive
Copy-Item -Path "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Edge\*" -Destination "$env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks"
Copy-Item -Path "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Chrome\*" -Destination "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"
Copy-Item -Path "$env:USERPROFILE\OneDrive - MR B SOE Way\Documents\Backup\Signatures\*" -Destination "$env:USERPROFILE\AppData\Roaming\Microsoft\Signatures\"

Write-Host "Script completed successfully.."
Stop-Transcript
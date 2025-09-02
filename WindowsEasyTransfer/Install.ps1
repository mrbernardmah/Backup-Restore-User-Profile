
    #region Config
    $AppName = "Windows Easy Transfer"
    $client = "MR B SOE Way"
    $logPath = "$env:ProgramData\$client\logs"
    $logFile = "$logPath\$appName.log"
    
    $cmdcommands = ".\Install.cmd"

    #endregion
    #region Logging
    if (!(Test-Path -Path $logPath)) {
        New-Item -Path $logPath -ItemType Directory -Force | Out-Null
    }


    Start-Transcript -Path $logFile -Force

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$cmdcommands`"" -nonewwindow -Wait


     Write-Host "Script completed successfully.."
     Stop-Transcript
     Exit 
 
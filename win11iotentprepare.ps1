reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\State" /v ImageState /t REG_SZ /d IMAGE_STATE_GENERALIZE_RESEAL_TO_OOBE /f
$oemInfo=@"
[State]

ImageState=IMAGE_STATE_SPECIALIZE_RESEAL_TO_OOBE
"@

foreach $app in $applist {
    winget install --id=$app -e --accept-package-agreements
}
winget $applist --accept-package-agreements

PowerShell -ExecutionPolicy RemoteSigned
Import-Module PSWindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
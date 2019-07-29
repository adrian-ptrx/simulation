 param (
    [Parameter(Mandatory=$true)][string]$simulation = "vertical_brute_force"
 )


write-output "Launching winlogbeat with $($simulation)_winlogbeat.yml"
Try {

  $winlogbeat = Start-Process -FilePath "C:\Program Files\winlogbeat\winlogbeat.exe" -ArgumentList "-c \simulation\config\$($simulation)_winlogbeat.yml"
}
Catch { 
    Write-Host "An error occured launching the winlogbeat.exe process." -ForegroundColor Red
    Exit
}


write-output "Launching simulation: $($simulation)"
Try {

  $proc = Start-Process -FilePath "\simulation\test\bin\$($simulation).ps1" 
  $proc.WaitForExit()
}
Catch { 
    Write-Host "An error occured launching the simulation $($simulation)" -ForegroundColor Red
    Exit
}



write-output "Stopping process: $($winlogbeat)"
Try {

  # $winlogbeat = Get-Process "winlogbeat" 
  $winlogbeat.kill()
}
Catch { 
    Write-Host "We could not kill the winlogbeat.exe process." -ForegroundColor Red
    Exit
}

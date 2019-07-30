 param (
#    [Parameter(Mandatory=$true)][string]$use_case = ""
    [string]$use_case = $(throw "-use_case is required."),
    [switch]$collect_logs = $false
 )

 # example: .\bin\run_simulation_driver.ps1 -use_case "T1110" -collect_logs:$true

 # variables
 $root_path = '/adrian_ptrx'
 $repo_path = $root_path + '/simulation'
 $bin_path = $repo_path + '/bin'
 $simulation_path = $repo_path + '/use_case'
 $beat_path = "C:\Program Files\winlogbeat\winlogbeat.exe"

write-output "Launching log collector with config: $($use_case)/winlogbeat.yml"
Try {
  $winlogbeat = Start-Process -FilePath $($beat_path) -ArgumentList "-c $($simulation_path)/$($use_case)/winlogbeat.yml"  -PassThru
  write-output "Collecting logs ..."
}
Catch { 
    Write-Host "An error occured launching the log collector process with config: $($use_case)/winlogbeat.yml" -ForegroundColor Red
    Exit
}


write-output "Launching attack simulation: $($use_case)"
Try {
  cd "$($simulation_path)/$($use_case)"
  $powershellArguments = "$($simulation_path)/$($use_case)/run_use_case_simulation.ps1"
  $proc = Start-Process powershell.exe -ArgumentList $powershellArguments  -PassThru
  write-output "Simulating attack ..."
  $proc.WaitForExit()
}
Catch { 
    Write-Host "An error occured launching the attack simulation: $($use_case)   -   exited with status code $($proc.ExitCode)" -ForegroundColor Red
}
cd $repo_path


write-output "Stopping log collector process: $($winlogbeat)"
Try {

  # $winlogbeat = Get-Process "winlogbeat" 
  $winlogbeat.kill()
  write-output "Kill successful."
}
Catch { 
    Write-Host "We could not kill the log collector process: $($winlogbeat)" -ForegroundColor Red
    Exit
}

write-output "Done."
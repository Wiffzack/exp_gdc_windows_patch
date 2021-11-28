set /p asd="Enter Password you want to use"
mkdir C:\DriverCert\
cd C:\DriverCert\
mkdir C:\DriverCert\driver
makecert -r -sv C:\DriverCert\myDrivers.pvk -n CN="WinOSHub" C:\DriverCert\myDrivers.cer

cert2spc C:\DriverCert\myDrivers.cer C:\DriverCert\myDrivers.spc

pvk2pfx -pvk C:\DriverCert\myDrivers.pvk -pi %asd% -spc C:\DriverCert\myDrivers.spc -pfx C:\DriverCert\myDrivers.pfx -po %asd%

certmgr.exe -add C:\DriverCert\myDrivers.cer -s -r localMachine ROOT
certmgr.exe -add C:\DriverCert\myDrivers.cer -s -r localMachine TRUSTEDPUBLISHER

echo "Please copy the files you want to sign to C:\DriverCert\driver"

inf2cat.exe /driver:"C:\DriverCert\driver" /os:8_X64,8_X86,Server8_X64,Server2008R2_X64,7_X64,7_X86,Server2008_X64,Server2008_X86,Vista_X64,Vista_X86,Server2003_X64,Server2003_X86,XP_X64,XP_X86,2000,10_X86,10_X64,Server10_X64 /verbose

signtool sign /f myDrivers.pfx /t http://timestamp.digicert.com /p %asd% /fd SHA256 test2.cat

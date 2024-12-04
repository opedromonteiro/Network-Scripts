@echo off
REM --------------------------------------------------
REM Programador....: Pedro Monteiro
REM Data...........: 17/10/2024
REM Observações....: 
REM --------------------------------------------------
:MENU
cls
echo /////////////////////////////////////////////////
echo # Network Script                                # 
echo # (c) 2024 . Pedro Monteiro                     #
echo /////////////////////////////////////////////////
echo MENU
echo 1 - Show IP Configurations
echo 2 - Renew IP
echo 3 - Show and copy DNS
echo 4 - Show MAC Adress 
echo 5 - Make an Energy Eficience Diagnostic
echo 6 - Show association between the program and extension
echo 7 - Repair disk
echo 8 - Send ping
echo 9 - Show users 
echo 10 - Exit
echo _______________________________________________
set /p opt="Select an option then press ENTER: "

if %opt% == 1 goto SHOW_IP
if %opt% == 2 goto RENEW_IP
if %opt% == 3 goto DNS_QUERY
if %opt% == 4 goto MAC_ADRESS
if %opt% == 5 goto HTML_BATTERY
if %opt% == 6 goto ASSOC_PROG
if %opt% == 7 goto DISK_CHECK
if %opt% == 8 goto QR_CODE
if %opt% == 9 goto USERS
if %opt% == 10 goto EXIT


:SHOW_IP
ipconfig /all
pause
goto MENU

:RENEW_IP
ipconfig /release
pause
ipconfig /renew
pause 
goto MENU

:DNS_QUERY
set /p domain="Insert domain: " 
set /p dnsserver="Insert dnsserver: "
nslookup %domain% %dnsserver%
pause
goto MENU

:MAC_ADRESS
getmac
pause
goto MENU

:HTML_BATTERY
powercfg /energy /output energy_report.html
echo Relatorio gerado: energy_report.html
pause 
goto MENU

:ASSOC_PROG
assoc > output.txt
pause 
goto MENU

:DISK_CHECK
chkdsk /f
pause
goto MENU

:QR_CODE
set /p url="Insert url: " 
curl qrenco.de/%url%
pause
goto MENU

:USERS
cls
net user > users.txt
pause
goto MENU

:EXIT
echo Obrigado!
Exit
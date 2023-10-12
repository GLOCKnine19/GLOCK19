@echo off

Title "MADE BY F4FIX"

color 0F
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                W E L C O M E   T O   T H E    VERSION 1.2    O F                
echo.
echo.
echo                   _______________________________________________ _______________________________________________

echo.
echo.
echo. 
echo(                                             O                      
echo(                   OOOOOOOOOO              O O               OOOOOOOOOO                O            O           O
echo(                   O                     O   O               O                                       O        O
echo(                   O                   O     O               O                         O              O     O
echo(                   OOOOOOOO          O       O               OOOOOOOO                  O               O  O 
echo(                   O               O O O   O O O O           O                         O                O
echo(                   O                         0               O                         O              O   O
echo(                   O                         O               O                         O            O       O
echo(                   O                         0               O                         O          O           O
echo. 
echo. 
echo. 
echo. 
echo                                                         [1] For Enable
echo. 
echo. 
echo                                                         [2] For Revert Changes
SET /P choice=SELECT:

IF /I "%choice%"=="1" Goto 1
IF /I "%choice%"=="2" Goto 2
:1

Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f
pause
exit
:2

Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 0 /f
pause
exit








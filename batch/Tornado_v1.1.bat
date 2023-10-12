@echo off 
mode con: cols=120 lines=30
chcp 65001 >nul
color 1
set version=v1.1
set releasestatus=Official Release
set prompt=
SETLOCAL EnableDelayedExpansion

:: Checking For Admin Rights
mode con: cols=120 lines=30
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (  
echo Requesting administrative privileges...
echo Please click yes when prompted.
echo.
timeout 1 >nul /nobreak
color 4
timeout 1 >nul /nobreak
color 1
timeout 1 >nul /nobreak
color 4
    timeout 1 >nul /nobreak
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
:: delete script after getting admin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
color 4
goto main

:main
cls
mode con: cols=120 lines=30
color 3
title Tornado - Lowering network latency ^& ^ping ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.                   
echo                                                  ^< ^> Made by:  Tare ^< ^>                           
echo.
echo                                         __________  ____  _   _____    ____  ____ 
echo                                        /_  __/ __ \/ __ \/ ^| / /   ^|  / __ \/ __ \
echo                                         / / / / / / /_/ /  ^|/ / /^| ^| / / / / / / /
echo                                        / / / /_/ / _, _/ /^|  / ___ ^|/ /_/ / /_/ / 
echo                                       /_/  \____/_/ ^|_/_/ ^|_/_/  ^|_/_____/\____/  
echo.
echo.
echo                                                ^< %releasestatus% %version% ^>          
echo.
echo                                                     ^< 1 ^> Optimize
echo.                                            
echo                                      ^< 2 ^> Credits  ^< 3 ^> Information  ^< 4 ^> Discord
echo.
echo.
echo.
set /p input=%prompt% "$ "
    if "%input%"=="1" goto beforetweaks
	if "%input%"=="2" goto credits
    if "%input%"=="3" goto info
    if "%input%"=="4" goto discord
echo Please enter a valid number! & goto main

:discord
cls
mode con: cols=120 lines=30
color 3
title Tornado - Lowering network latency ^& ^ping ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.
echo.
echo                                        __________  ____  _   _____    ____  ____ 
echo                                       /_  __/ __ \/ __ \/ ^| / /   ^|  / __ \/ __ \
echo                                        / / / / / / /_/ /  ^|/ / /^| ^| / / / / / / /
echo                                       / / / /_/ / _, _/ /^|  / ___ ^|/ /_/ / /_/ / 
echo                                      /_/  \____/_/ ^|_/_/ ^|_/_/  ^|_/_____/\____/  
echo.
echo.
echo Joining Tare's Tweaking Community Discord server...
timeout 2 >nul /nobreak
start /max https://discord.gg/D9jFSVMqrk
timeout 2 >nul /nobreak
echo Going Back To Main Menu...
timeout 3 >nul /nobreak
goto main

:beforetweaks
cls
mode con: cols=120 lines=30
color 3
title Tornado - Lowering network latency ^& ^ping ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.
echo                                        __________  ____  _   _____    ____  ____ 
echo                                       /_  __/ __ \/ __ \/ ^| / /   ^|  / __ \/ __ \
echo                                        / / / / / / /_/ /  ^|/ / /^| ^| / / / / / / /
echo                                       / / / /_/ / _, _/ /^|  / ___ ^|/ /_/ / /_/ / 
echo                                      /_/  \____/_/ ^|_/_/ ^|_/_/  ^|_/_____/\____/  
echo.
echo.
set /p input=%prompt% "Would you like to create a Restore Point and a Registry backup? (Y/N): "
    if "%input%"=="Y" goto tweaksmain
	if "%input%"=="y" goto tweaksmain
    if "%input%"=="n" goto tweaks
	if "%input%"=="N" goto tweaks
echo Please enter a valid number! & goto beforetweaks

:tweaks
cls
netsh int tcp set heuristics disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global autotuninglevel=disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SizReqBuf" /t REG_DWORD /d "53819" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "00000001" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "23" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d "00000008" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPDelAckTicks" /t REG_DWORD /d "00000001" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "191" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "192" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "214" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "215" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "2048" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "2048" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "PriorityBoost" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "00000001" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f

:: Disable QoS Packet Scheduler
powershell -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_pacer"

:: Disable HPET 
bcdedit /deletevalue useplatformclock

:: Disable Dynamic tick (Power saving)
bcdedit /set disabledynamictick yes

:: Disable Synthetic timers
bcdedit /set useplatformtick yes

:: Disable network power saving - Credits Zusier
for /f %%r in ('reg query "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /f "PCI\VEN_" /d /s^|Findstr HKEY_') do (
Reg add %%r /v "AutoDisableGigabit" /t REG_SZ /d "0" /f 
Reg add %%r /v "EnableGreenEthernet" /t REG_SZ /d "0" /f 
reg add %%r /v "GigaLite" /t REG_SZ /d "0" /f 
reg add %%r /v "PowerSavingMode" /t REG_SZ /d "0" /f 
)

goto finish

:credits
cls
mode con: cols=120 lines=30
color 3
title Tornado - Lowering network latency ^& ^ping ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo Credits:
echo Tare - UI, Tweaks
echo AMIT - Tweaks
echo Zusier - tweaks
echo.
echo Press any key to go back to main menu.
pause >nul
echo Going back to main menu...
timeout 2 >nul
color 4
goto main

:info
cls
mode con: cols=120 lines=30
color 3
title Tornado - Lowering network latency ^& ^ping ^| Made by: Tare#1326 ^| %version% - %releasestatus%                        
echo TORNADO is a script made for optimising network latency. 
echo There is no guaranteed change in latency since every computer acts differently when tweaked.
echo.
echo If you're skeptical about this being unsafe you can always view the code.
echo To view the code right click the .bat file and click EDIT, you will se the source code.
echo.
echo TORNADO is provided "AS IS" without any warranty. In no event will the Developer be liable for any special,incidental,consequential or indirect damages due to loss of data or any other reason. 
echo This script was made to increase performance, not to decrease it.. We ARE NOT RESPONSIBLE FOR ANY DAMAGE YOU CAUSE.
echo.
echo.
echo Press any key to go back to the main menu.
pause >nul
echo.
echo Going back to main menu...
timeout 2 >nul /nobreak
goto main

:tweaksmain
if exist "C:\Registry\regbackup.reg" goto registrybackupdetected
set backupcmd=xcopy /s /c /d /e /h /i /r /y
cls
echo Backing up the Registry...
echo The Registry backup is located at "C:\Registry"
timeout 2 >nul /nobreak
if not exist "C:\Registry" mkdir "C:\Registry"
regedit /e "C:\Registry\regbackup.reg"
echo Backup succesfully created!
cls

:restorepoint2
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f >nul
echo Creating a restore point... 
timeout 2 >nul /nobreak
@powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Before Tornado' -RestorePointType 'MODIFY_SETTINGS'"
set SR_STATUS=%ERRORLEVEL%
IF %SR_STATUS%==0 color 2f & echo System Restore point made succesfully!
timeout 3 >nul /nobreak
cls
IF NOT %SR_STATUS%==0 color f1 & echo Failed to create a restore point, please make sure you have enabled protection in System Restore.
timeout 3 >nul /nobreak
goto tweaks

:registrybackupdetected
cls
color f1
echo Registry backup detected. Skipping registry backup to avoid issues.
timeout 2 >nul /nobreak
cls
goto restorepoint2

:finish
cls
mode con: cols=120 lines=30
color 3
title Tornado - Lowering network latency ^& ^ping ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.                   
echo                                                ^< ^> Made by:  Tare ^< ^>                             
echo.
echo                                        __________  ____  _   _____    ____  ____ 
echo                                       /_  __/ __ \/ __ \/ ^| / /   ^|  / __ \/ __ \
echo                                        / / / / / / /_/ /  ^|/ / /^| ^| / / / / / / /
echo                                       / / / /_/ / _, _/ /^|  / ___ ^|/ /_/ / /_/ / 
echo                                      /_/  \____/_/ ^|_/_/ ^|_/_/  ^|_/_____/\____/ 
echo.         
echo.
echo The tweaks have been set. Restart your PC to apply the tweaks.
echo Exiting in 10 seconds...
timeout 10 >nul /nobreak & exit                               
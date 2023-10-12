@echo off
mode con cols=100 lines=22

:: Setting Variables (For Colors) (Credit to Artains, credit to jSN for giving me the idea)
set "CMDLINE=RED=[31m,GRAY=[90m,RED=[91m,GREEN=[92m,YELLOW=[93m,MAGENTA=[95m,WHITE=[97m,BLACK=[40m,YELLOW=[43m,UNDERLINE=[4m,_UNDERLINE=[24m"
set "%CMDLINE:,=" & set "%"


:Windows Version Checker
chcp 65001 > nul
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3" goto NotSupported
if "%version%" == "6.2" goto NotSupported
if "%version%" == "6.1" goto NotSupported
if "%version%" == "6.0" goto NotSupported
if "%version%" == "10.0" goto AdminCheck
endlocal

:IexitI
cls
echo Exiting...
timeout 2 > nul
exit

:NotSupported
cls
set msgboxTitle=R.I.P
set msgboxBody=This version of windows is NOT supported.
set tmpmsgbox=%temp%\~tmpmsgbox.vbs
if exist "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%" && goto ExitingLOL

:ExitingLOL
cls
color FC
echo Exiting.
timeout 1 > nul
cls
color CF
echo Exiting..
timeout 1 > nul
cls
Color FC
echo Exiting...
timeout 1 > nul
exit

:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:AdminCheck
:: Credit here https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
 IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Requesting Admin Privileges... (Click Yes)
    timeout 2 > nul
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
goto Menu
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:RegDetect
cls
if exist "C:\Registry\RegBackup.reg" goto RegBackupDetected
if not exist "C:\Registry\RegBackup.reg" goto CreatingRegistryBackup

:CreatingRegistryBackup
:: Backup CMD Prompt
set backupcmd=xcopy /s /c /d /e /h /i /r /y
cls
echo Creating Registry Backup...
if not exist "C:\Registry" mkdir "C:\Registry"
regedit /e "C:\Registry\RegBackup.reg"
if %errorlevel% equ 0 goto RegBackupSucceededMsgbox
if %errorlevel% neq 0 goto RegBackupFailedMsgbox


:RegBackupDetected
cls
set msgboxTitle=Registry Backup Creation
set msgboxBody=Registry backup has already been made at C:\Registry.
set tmpmsgbox=%temp%\~tmpmsgbox.vbs
if exist "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%" && goto Menu



:RegBackupSucceededMsgbox
cls
set msgboxTitle=Registry Backup Creation
set msgboxBody=Successfully created Registry Backup! Location of Backup is at C:\Registry.
set tmpmsgbox=%temp%\~tmpmsgbox.vbs
if exist "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%" && goto Menu


:RegBackupFailedMsgbox
cls
set msgboxTitle=Registry Backup Creation
set msgboxBody=Failed to create registry backup. It is not recommended to continue without creating a registry backup.
set tmpmsgbox=%temp%\~tmpmsgbox.vbs
if exist "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%" && goto Menu

:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:Menu
cls
@echo off
title !Redwan#7198 ^| dsc.gg/RTweaks ^| RTweaks Optimizer v2.1
mode con cols=71 lines=18
color 05
echo  %MAGENTA%         ______   _______                       _           
echo          (_____ \ (_______)                     ^| ^|          
echo           _____) )    _     _ _ _  _____  _____ ^| ^|  _   ___ 
echo          ^|  __  /    ^| ^|   ^| ^| ^| ^|^| ___ ^|(____ ^|^| ^|_/ ) /___)
echo          ^| ^|  \ \    ^| ^|   ^| ^| ^| ^|^| ____^|/ ___ ^|^|  _ ( ^|___ ^|
echo          ^|_^|   ^|_^|   ^|_^|    \___/ ^|_____)\_____^|^|_^| \_)(___/
echo.
echo                  ╔═════════════════╦══════════════════╗
echo                  ║ [  Version %UNDERLINE%%WHITE%2.1%MAGENTA%%_UNDERLINE%  ║ dsc.gg/%UNDERLINE%%WHITE%RTweaks%MAGENTA%%_UNDERLINE% ] ║
echo                  ╚═════════════════╩══════════════════╝                
echo  ╔════════════════════╔══════════════════════════╗═══════════════════╗
echo  ║  [ %WHITE%1%MAGENTA% ] Software    ║     [ %WHITE%X%MAGENTA% ] Optimize       ║   [ %WHITE%2%MAGENTA% ] Servers   ║
echo  ╚══════════════════╔═╝══════════════════════════╚═╗═════════════════╝
echo                     ║ [ %WHITE%3%MAGENTA% ] Create Registry Backup ║                 
echo                     ╚══════════════════════════════╝
:: Credit to Artains' for the set input code.
set input=
set /p "input=%WHITE%                                 >: "
if /i %input% == 1 goto SoftwareMenu
if /i %input% == 2 goto Servers
if /i %input% == x goto MSDetect
if /i %input% == 3 goto RegDetect
) ELSE (
echo                             %UNDERLINE%%WHITE%Misspell Detected!%MAGENTA%%_UNDERLINE% && timeout 2 > nul & goto Menu
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:SoftwareMenu
:: Detect if Chocolatey is installed on the users machine.
cls
if exist "C:\ProgramData\chocolatey" goto InstallerMenu
if not exist "C:\ProgramData\chocolatey" goto InstallChoco

:InstallChoco
cls
mode con cols=100 lines=30
echo Installing Chocolatey to install software...
timeout 1 > nul
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
if %errorlevel% equ 0 goto ChocoFailed
if %errorlevel% nqu 0 goto ChocoNice
goto InstallerMenu

:ChocoFailed
:: Dialog Box to show Chocolatey Failed to install.
cls
set msgboxTitle=Chocolatey Installation
set msgboxBody=Failed to install Chocolatey. Any software you try to install in the optimizer will NOT work.
set tmpmsgbox=%temp%\~tmpmsgbox.vbs
if exist "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%" && goto Menu

:ChocoNice
cls
:: Dialog Box to show Chocolatey installed successfully.
set msgboxTitle=Chocolatey Installation
set msgboxBody=Successfully installed Chocolatey. All softwares you try to install in the optimizer should work.
set tmpmsgbox=%temp%\~tmpmsgbox.vbs
if exist "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%" && goto InstallerMenu
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:InstallerMenu
cls
mode con cols=65 lines=22
color 05
echo %MAGENTA%       ______   _______                       _           
echo       (_____ \ (_______)                     ^| ^|          
echo        _____) )    _     _ _ _  _____  _____ ^| ^|  _   ___ 
echo       ^|  __  /    ^| ^|   ^| ^| ^| ^|^| ___ ^|(____ ^|^| ^|_/ ) /___)
echo       ^| ^|  \ \    ^| ^|   ^| ^| ^| ^|^| ____^|/ ___ ^|^|  _ ( ^|___ ^|
echo       ^|_^|   ^|_^|   ^|_^|    \___/ ^|_____)\_____^|^|_^| \_)(___/
echo.
echo              ╔═════════════════╦══════════════════╗
echo              ║ [  Version %UNDERLINE%%WHITE%2.1%MAGENTA%%_UNDERLINE%  ║  dsc.gg/%UNDERLINE%%WHITE%RTweaks%MAGENTA%%_UNDERLINE%] ║
echo              ╚═════════════════╩══════════════════╝   
echo.
echo   %UNDERLINE%%WHITE%BROWSERS%MAGENTA%%_UNDERLINE%           %UNDERLINE%%WHITE%GAME LAUNCHERS%MAGENTA%%_UNDERLINE%          %UNDERLINE%%WHITE%Media Players%MAGENTA%%_UNDERLINE%
echo  ╔══════════════════╦═══════════════════════╦══════════════════╗
echo  ║  [ %WHITE%1%MAGENTA% ] Brave     ║  [ %WHITE%5%MAGENTA% ] Steam          ║ [ %WHITE%9%MAGENTA% ] VLC        ║
echo  ║  [ %WHITE%2%MAGENTA% ] Opera     ║  [ %WHITE%6%MAGENTA% ] Origin         ║ [ %WHITE%10%MAGENTA% ] MPV       ║ 
echo  ║  [ %WHITE%3%MAGENTA% ] Chrome    ║  [ %WHITE%7%MAGENTA% ] Battle.Net     ║ [ %WHITE%11%MAGENTA% ] PotPlayer ║
echo  ║  [ %WHITE%4%MAGENTA% ] Firefox   ║  [ %WHITE%8%MAGENTA% ] Epic Games     ║ [ %WHITE%12%MAGENTA% ] Nuclear   ║
echo  ╚═════════════════╦╩═══════════════════════╩╦═════════════════╝
echo                    ║ [ %WHITE%X%MAGENTA% ] Redirect To Menu  ║
echo                    ╚═════════════════════════╝
set input=
set /p "input=%WHITE%                              >: "
if /i %input% == 1 mode con cols=100 lines=35 & choco install brave -y & goto InstallerMenu
if /i %input% == 2 mode con cols=100 lines=35 choco install opera -y & goto InstallerMenu
if /i %input% == 3 mode con cols=100 lines=35 choco install googlechrome -y & goto InstallerMenu
if /i %input% == 4 mode con cols=100 lines=35 choco install firefox -y & goto InstallerMenu
if /i %input% == 5 mode con cols=100 lines=35 choco install steam-client -y & goto InstallerMenu
if /i %input% == 6 mode con cols=100 lines=35 choco install origin -y & goto InstallerMenu
if /i %input% == 7 mode con cols=100 lines=35 choco install battle.net -y & goto InstallerMenu
if /i %input% == 8 mode con cols=100 lines=35 choco install epicgameslauncher -y & goto InstallerMenu
if /i %input% == 9 mode con cols=100 lines=35 choco install vlc -y & goto InstallerMenu
if /i %input% == 10 mode con cols=100 lines=35 choco install mpv -y & goto InstallerMenu
if /i %input% == 11 mode con cols=100 lines=35 choco install potplayer -y & goto InstallerMenu
if /i %input% == 12 mode con cols=100 lines=35 choco install nuclear -y & goto InstallerMenu
if /i %input% == x goto Menu
) ELSE (
goto InstallerMenu

:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:MSDetect
:: Detect if the user has a Microsoft account linked, credit to Zusier for this code.
cls
powershell -NoProfile -Command "Get-LocalUser | Select-Object Name,PrincipalSource"|findstr /C:"MicrosoftAccount" >nul 2>&1 && set MSACCOUNT=YES || set MSACCOUNT=NO
if "%MSACCOUNT%"=="NO" ( goto OptimizeStart ) ELSE ( goto WarningMSAccount )

:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:WarningMSAccount
cls
mode con cols=91 lines=25
color CF
echo Microsoft Account Detected. Credits: Zusier#5691 (https://dsc.gg/Atlas)
echo Please unlink your Microsoft account to avoid any issues.
echo If you decide to continue the optimization ^&^ break ur OS, that will be your fault.
echo.
echo Would you like to start the optimization?
set /p input=Y/N: 
if /i %input% == y goto OptimizeStart
if /i %input% == n goto IexitI
) ELSE (
goto WarningMSAccount
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:OptimizeStart
cls
color 05
mode con cols=53 lines=25
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ipconfig /flushdns >nul 2>&1
del /s /f /q "C:\Windows\prefetch\*.*" >nul 2>&1
del /f /q "%localappdata%\temp\*" >nul 2>&1
rd /s /q "%WINDIR%\Temp" >nul 2>&1
del /f /q "%SystemRoot%\Traces\WindowsUpdate\*" >nul 2>&1

:: Chrome Stuff
rd /s /q "%localappdata%\Google\Chrome\User Data\Crashpad\reports\" >nul 2>&1
rd /s /q "%localappdata%\Google\CrashReports\" >nul 2>&1
del /f /q "%localappdata%\Google\Software Reporter Tool\*.log" >nul 2>&1

:: Java Cache
rd /s /q "%APPDATA%\Sun\Java\Deployment\cache" >nul 2>&1

:: Empty Recycle Bin
PowerShell -ExecutionPolicy Unrestricted -Command "$bin = (New-Object -ComObject Shell.Application).NameSpace(10); $bin.items() | ForEach {; Write-Host "^""Deleting $($_.Name) from Recycle Bin"^""; Remove-Item $_.Path -Recurse -Force; }" >nul 2>&1
cls
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
mode con cols=59 lines=35
echo.
echo %MAGENTA%    ______   _______                       _           
echo    (_____ \ (_______)                     ^| ^|          
echo     _____) )    _     _ _ _  _____  _____ ^| ^|  _   ___ 
echo    ^|  __  /    ^| ^|   ^| ^| ^| ^|^| ___ ^|(____ ^|^| ^|_/ ) /___)
echo    ^| ^|  \ \    ^| ^|   ^| ^| ^| ^|^| ____^|/ ___ ^|^|  _ ( ^|___ ^|
echo    ^|_^|   ^|_^|   ^|_^|    \___/ ^|_____)\_____^|^|_^| \_)(___/
echo.
:: Hardware Accelerated GPU Scheduling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
echo      ╔═════════════════════════════════════════════╗  
echo      ║ %WHITE%Hardware Accelerated GPU Scheduling Enabled%MAGENTA% ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if not exist "C:\Windows\System32\GameBarPresenceWriter.exe" goto Energy
if exist "C:\Windows\System32\GameBarPresenceWriter.exe" (
takeown /s %computername% /u %username% /f "%WINDIR%\System32\GameBarPresenceWriter.exe"\
icacls "%WINDIR%\System32\GameBarPresenceWriter.exe" /grant:r %username%:F
taskkill /im GameBarPresenceWriter.exe /f\
del "%WINDIR%\System32\GameBarPresenceWriter.exe" /s /f /q
) >nul 2>&1 && echo      ║      %WHITE%GameBarPresenceWriter.exe Removed%MAGENTA%      ║ && timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:Energy
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
echo      ║       %WHITE%Energy-Saving Features Disabled%MAGENTA%       ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if exist "C:\Users\%USERNAME%\Downloads\SetACL.exe" goto powersaving
if not exist "C:\Users\%USERNAME%\Downloads\SetACL.exe" (
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/825401948349792277/936738908920754206/SetACL.exe" -OutFile "C:\Users\%USERNAME%\Downloads\SetACL.exe"
)

:powersaving
for /f %%s in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "USB\VID_"') do (
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" -ot reg -actn setowner -ownr "n:Administrators" >nul 2>&1
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" -ot reg -actn ace -ace "n:Administrators;p:full" >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v SelectiveSuspendEnabled /t REG_BINARY /d 00 /f >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v AllowIdleIrpInD3 /t REG_DWORD /d 00000000 /f >nul 2>&1
)
for /f %%s in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\ROOT_HUB"') do (
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators" >nul 2>&1
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" -ot reg -actn ace -ace "n:Administrators;p:full" >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f >nul 2>&1
)
for /f "tokens=*" %%s in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /S /F "StorPort" ^| findstr /e "StorPort"') do reg.exe add "%%s" /v "EnableIdlePowerManagement" /t REG_DWORD /d 00000000 /f >nul 2>&1
for /f "eol=E" %%s in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services" /S /F "IoLatencyCap" ^| findstr /v "IoLatencyCap"') do reg.exe add "%%s" /v "IoLatencyCap" /t REG_DWORD /d 00000000 /f >nul 2>&1
for /f "eol=E" %%s in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services" /S /F "EnableHIPM" ^| findstr /v "EnableHIPM"') do (
reg.exe add "%%s" /v "EnableHIPM" /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "%%s" /v "EnableDIPM" /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "%%s" /v "EnableHDDParking" /t REG_DWORD /d 00000000 /f >nul 2>&1
)
for /f "tokens=*" %%s in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /S /F "PNPCapabilities" ^| findstr /v "PNPCapabilities" ^| findstr /v "REG_DWORD" ^| findstr /v "End of search"') do (
reg.exe add "%%s" /v "PNPCapabilities" /t REG_DWORD /d 00000280 /f >nul 2>&1
)
del /s /f /q "C:\Users\%USERNAME%\Downloads\SetACL.exe" > nul

echo      ║       %WHITE%Power-Saving Features Disabled%MAGENTA%        ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1
echo      ║         %WHITE%Power Throttling Disabled%MAGENTA%           ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Disable Auto Maintenance
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
echo      ║         %WHITE%Auto Maintenance Disabled%MAGENTA%           ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
netsh interface teredo set state disabled >nul 2>&1
netsh interface 6to4 set state disabled >nul 2>&1
netsh winsock reset >nul 2>&1
netsh int isatap set state disable >nul 2>&1
netsh int ip set global taskoffload=enabled >nul 2>&1
netsh int ip set global neighborcachelimit=4096 >nul 2>&1
netsh int tcp set global timestamps=enabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1
netsh int tcp set global congestionprovider=ctcp >nul 2>&1
netsh int tcp set supplemental Internet congestionprovider=CTCP >nul 2>&1
netsh int tcp set global chimney=disabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global rsc=disabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1
netsh int tcp set security mpp=disabled >nul 2>&1
netsh int tcp set security profiles=disabled >nul 2>&1
PowerShell Disable-NetAdapterChecksumOffload -Name "*" >nul 2>&1
PowerShell Disable-NetAdapterRsc -Name "*" >nul 2>&1
PowerShell Disable-NetAdapterIPsecOffload -Name "*" >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d "65536" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "TCPCongestionControl" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DisableAddressSharing" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DisableChainedReceive" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "Class" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "2000" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "500" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "499" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "2001" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\NDIS\Parameters" /v "TrackNblOwner" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\NDIS\Parameters" /v "DisableNDISWatchDog" /t REG_DWORD /d "1" /f >nul 2>&1
echo      ║         %WHITE%Network Settings Tweaked%MAGENTA%            ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Disable Background apps
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f >nul 2>&1
echo      ║         %WHITE%Background Apps Disabled%MAGENTA%            ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Configure Svchost for less ram usage and processes (Not that they matter but wtv) (Credit to jSN)
for /f "tokens=2 delims==" %%i in ('wmic os get TotalVisibleMemorySize /format:value') do set MEM=%%i
set /a RAM=%MEM% + 1024000
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "%RAM%" /f >nul 2>&1
echo      ║          %WHITE%Configured Svchost.exe%MAGENTA%             ║	
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Disable Transparency
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f >nul 2>&1
echo      ║          %WHITE%Transparency Disabled%MAGENTA%              ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Spectre ^&^ Meltdown (Credit to CatGamerOP)
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet002\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f >nul 2>&1

:: NTFS Mitigations
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Address Space Layout Randomization (ASLR)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d "0" /f >nul 2>&1

:: Structured Exception Handling Overwrite Protection (SEHOP)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f >nul 2>&1

:: Data Excecution Prevention (DEP)
bcdedit /set nx AlwaysOff >nul 2>&1

:: Microsoft's Powershell Command
Powershell -Command "Set-ProcessMitigation -System -Disable DEP, EmulateAtlThunks, SEHOP, ForceRelocateImages, RequireInfo, BottomUp, HighEntropy, StrictHandle, DisableWin32kSystemCalls, AuditSystemCall, DisableExtensionPoints, BlockDynamicCode, AllowThreadsToOptOut, AuditDynamicCode, CFG, SuppressExports, StrictCFG, MicrosoftSignedOnly, AllowStoreSignedBinaries, AuditMicrosoftSigned, AuditStoreSigned, EnforceModuleDependencySigning, DisableNonSystemFonts, AuditFont, BlockRemoteImageLoads, BlockLowLabelImageLoads, PreferSystem32, AuditRemoteImageLoads, AuditLowLabelImageLoads, AuditPreferSystem32, EnableExportAddressFilter, AuditEnableExportAddressFilter, EnableExportAddressFilterPlus, AuditEnableExportAddressFilterPlus, EnableImportAddressFilter, AuditEnableImportAddressFilter, EnableRopStackPivot, AuditEnableRopStackPivot, EnableRopCallerCheck, AuditEnableRopCallerCheck, EnableRopSimExec, AuditEnableRopSimExec, SEHOP, AuditSEHOP, SEHOPTelemetry, TerminateOnError, DisallowChildProcessCreation, AuditChildProcess" >nul 2>&1
echo      ║          %WHITE%Mitigations Disabled%MAGENTA%               ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:: Ease of Access
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f >nul 2>&1

:: Disable Mouse acceleration
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d "0" /f >nul 2>&1

:: Lower keyboard delay
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d "0" /f >nul 2>&1

:: Data queue size 20 for keyboard ^&^ Mouse
reg add "HKLM\SYSTEM\CurrentControlSet\services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "20" /f >nul 2>&1

::CSRSS Realtime Priority, lower input latency.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t Reg_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t Reg_DWORD /d "3" /f >nul 2>&1
echo      ║          %WHITE%KBM Settings Tweaked%MAGENTA%               ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:: Disable Most Animations
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TransparentGlass" /v "DefaultApplied" /t REG_DWORD /d "0" /f >nul 2>&1
echo      ║          %WHITE%Animations Disabled%MAGENTA%                ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:: Artanis' Telemetry Disable Code
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\safer\codeidentifiers" /v "authenticodeenabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "authenticodeenabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f >nul 2>&1

:: Diagnostics Telemetry
reg add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Services\dmwappushsvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

:: Data Collection Policy
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /d "0" /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "LimitEnhancedDiagnosticDataWindowsAnalytics" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1

:: Error Reporting
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t "REG_DWORD" /d "1" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wercplsupport" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable >nul 2>&1

:: Driver Updates
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Search using Location
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

:: Disable Cortana
taskkill /f /im Cortana.exe >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationOn" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationDefaultOn" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f >nul 2>&1

:: Speech Recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t "REG_DWORD" /d "0" /f >nul 2>&1

:: Windows Feedback
reg del "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f >nul 2>&1
echo      ║           %WHITE%Telemetry Disabled%MAGENTA%                ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AxInstSV" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lltdsvc" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppVClient" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CscService" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PhoneSvc" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteAccess" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SensorDataService" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SensrSvc" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SensorService" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start"  /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upnphost" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UevAgentService" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WalletService" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\icssvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SEMgrSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
echo      ║           %WHITE%Services Disabled%MAGENTA%                 ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Removing Useless Pre-installed apps with powershell
:: 3D Viewer
Powershell -Command "Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage"

:: Alarms ^&^ Clock
Powershell -Command "Get-AppxPackage *alarms* | Remove-AppxPackage"

:: Calculator
Powershell -Command "Get-AppxPackage *calculator* | Remove-AppxPackage"

:: Camera App
Powershell -Command "Get-AppxPackage *camera* | Remove-AppxPackage"

:: Feedback Hub
Powershell -Command "Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage"

:: Movies ^&^ TV
Powershell -Command "Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage"

:: Get Help
Powershell -Command "Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage"

:: Groove Music
Powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"

:: Solitare Collection
Powershell -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"

:: Mixed Reality Portal
Powershell -Command "Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage"

:: People App
Powershell -Command "Get-AppxPackage people | Remove-AppxPackage"

:: Skype
Powershell -Command "Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage"

:: Sticky Notes
Powershell -Command "Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage"

:: Voice Recorder
Powershell -Command "Get-AppxPackage *soundrecorder* | Remove-AppxPackage"

:: Maps App
Powershell -Command "Get-AppXPackage *Microsoft.WindowsMaps* | Remove-AppXPackage"

:: Bing Weather App
Powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage"

:: Bing
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"

:: Your Phone
PowerShell -Command "Get-AppxPackage *yourphone* | Remove-AppxPackage"
echo      ║           %WHITE%Bloatware Removed%MAGENTA%                 ║
timeout 1 > nul
:: -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /deletevalue disabledynamictick >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set tscsyncpolicy legacy >nul 2>&1
bcdedit /set quietboot yes >nul 2>&1
bcdedit /set bootux disabled >nul 2>&1
bcdedit /set bootmenupolicy legacy >nul 2>&1
bcdedit /set bootlog no >nul 2>&1
bcdedit /set x2apicpolicy Enable >nul 2>&1
bcdedit /set hypervisorlaunchtype off >nul 2>&1
bcdedit /set isolatedcontext no >nul 2>&1
bcdedit /set vsmlaunchtype Off >nul 2>&1
bcdedit /set vm No >nul 2>&1
bcdedit /set debug No >nul 2>&1
bcdedit /set integrityservices disable >nul 2>&1
bcdedit /set ems No >nul 2>&1
bcdedit /set pae ForceDisable >nul 2>&1
bcdedit /set {globalsettings} custom:16000067 true >nul 2>&1
bcdedit /set {globalsettings} custom:16000069 true >nul 2>&1
bcdedit /set {globalsettings} custom:16000068 true >nul 2>&1
bcdedit /set linearaddress57 OptOut >nul 2>&1
bcdedit /set increaseuserva 268435328 >nul 2>&1
bcdedit /set firstmegabytepolicy UseAll >nul 2>&1
bcdedit /set avoidlowmemory 0x8000000 >nul 2>&1
bcdedit /set nolowmem Yes >nul 2>&1
bcdedit /set allowedinmemorysettings 0x0 >nul 2>&1
bcdedit /set configaccesspolicy Default >nul 2>&1
bcdedit /set usephysicaldestination No >nul 2>&1
bcdedit /set usefirmwarepcisettings No >nul 2>&1
bcdedit /set disableelamdrivers Yes >nul 2>&1
echo      ║            %WHITE%BCDedits Tweaked%MAGENTA%                 ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Using Curl instead of Chocolatey, (Choco took too long) thanks to JSN.
cd "C:/%HOMEPATH%\Downloads"
curl -L https://cdn.discordapp.com/attachments/879447054747840544/929489386230382622/DevManView.exe -o DevManView.exe >nul 2>&1
timeout 1 > nul
Devmanview /disable "UMBus Root Bus Enumerator" >nul 2>&1
Devmanview /disable "Intel SMBus" >nul 2>&1
Devmanview /disable "SM Bus Controller" >nul 2>&1
Devmanview /disable "Composite Bus Enumerator" >nul 2>&1
Devmanview /disable "Microsoft GS Wavetable Synth" >nul 2>&1
Devmanview /disable "WAN Miniport (IKEv2)" >nul 2>&1
Devmanview /disable "WAN Miniport (IPv6)" >nul 2>&1
Devmanview /disable "WAN Miniport (L2TP)" >nul 2>&1
Devmanview /disable "WAN Miniport (PPPOE)" >nul 2>&1
Devmanview /disable "WAN Miniport (PPTP)" >nul 2>&1
Devmanview /disable "WAN Miniport (SSTP)" >nul 2>&1
Devmanview /disable "Programmable Interrupt Controller" >nul 2>&1
Devmanview /disable "NDIS Virtual Network Adapter Enumerator" >nul 2>&1
Devmanview /disable "Numeric Data Processor" >nul 2>&1
Devmanview /disable "System Timer" >nul 2>&1
cd "%WINDIR%/System32" >nul 2>&1
del /s /f /q "C:\Users\%USERNAME%\Downloads\DevManView.exe" > nul
echo      ║            %WHITE%Devices Disabled%MAGENTA%                 ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

reg del "HKCU\System\GameConfigStore\Children" /f >nul 2>&1
reg del "HKCU\System\GameConfigStore\Parents" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >nul 2>&1
echo      ║              %WHITE%FSO Disabled%MAGENTA%                   ║
timeout 1 > nul
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Disable Syncing
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Speech Tab
reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f >nul 2>&1

:: Inking & Typing Personalization Tab
reg "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f >nul 2>&1
reg "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f >nul 2>&1
reg "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f >nul 2>&1
reg "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f >nul 2>&1

:: Activity History Tab
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Notifications, Location, App Diagnostics ^&^ Account Info Access
sc stop "WpnService" >nul 2>&1
sc config "WpnService" start=disabled >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1

:: Balloon Tips
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f >nul 2>&1
timeout 1 > nul
:: -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo      ╚═════════════════════════════════════════════╝
timeout 1 > nul
echo.
echo                    %UNDERLINE%%WHITE%Script Finished!%MAGENTA%%_UNDERLINE%
color F5
timeout 1 > nul
color 05
timeout 1 > nul
color F5
timeout 1 > nul
cls
:: -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: Credits
mode con cols=61 lines=23
color 05
echo.
echo %MAGENTA%     ______   _______                       _           
echo     (_____ \ (_______)                     ^| ^|          
echo      _____) )    _     _ _ _  _____  _____ ^| ^|  _   ___ 
echo     ^|  __  /    ^| ^|   ^| ^| ^| ^|^| ___ ^|(____ ^|^| ^|_/ ) /___)
echo     ^| ^|  \ \    ^| ^|   ^| ^| ^| ^|^| ____^|/ ___ ^|^|  _ ( ^|___ ^|
echo     ^|_^|   ^|_^|   ^|_^|    \___/ ^|_____)\_____^|^|_^| \_)(___/
echo.
echo                         [ %UNDERLINE%%WHITE%Credits%MAGENTA%%_UNDERLINE% ]
echo.
echo                   %WHITE%Hone%MAGENTA% (https://hone.gg)
echo               %WHITE%jSN#2324%MAGENTA% (https://dsc.gg/shdw)
echo              %WHITE%Underground Wires%MAGENTA% (privacy.sexy)
echo          %WHITE%Melody%MAGENTA% (https://www.twitch.tv/melody666)
echo         %WHITE%n1kobg#5048%MAGENTA% (https://n1kobg.blogspot.com)
echo         %WHITE%ArtanisInc%MAGENTA% (https://github.com/ArtanisInc)
echo      %WHITE%Le Un1xcorn#1398%MAGENTA% (https://twitter.com/un1xcorn)
echo      %WHITE%CatGamerOP#7828%MAGENTA% (https://twitter.com/CatGamerOP)
echo     %WHITE%UnLovedCookie#6871%MAGENTA% (https://github.com/Xt5gamerxX)
echo.
echo                   Press any key to exit.
pause > nul
goto Menu
:: -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:Servers
cls
title !Redwan#7198 ^| dsc.gg/RTweaks ^| RTweaks Optimizer v2.1
mode con cols=79 lines=31
color 05
echo.
echo     %MAGENTA%          ______   _______                       _           
echo              (_____ \ (_______)                     ^| ^|          
echo               _____) )    _     _ _ _  _____  _____ ^| ^|  _   ___ 
echo              ^|  __  /    ^| ^|   ^| ^| ^| ^|^| ___ ^|(____ ^|^| ^|_/ ) /___)
echo              ^| ^|  \ \    ^| ^|   ^| ^| ^| ^|^| ____^|/ ___ ^|^|  _ ( ^|___ ^|
echo              ^|_^|   ^|_^|   ^|_^|    \___/ ^|_____)\_____^|^|_^| \_)(___/
echo.
echo                      ╔═══════════════╦═══════════════════╗
echo                      ║ [ Version %UNDERLINE%%WHITE%2.1%MAGENTA%%_UNDERLINE% ║ dsc.gg/%UNDERLINE%%WHITE%RTweaks%MAGENTA%%_UNDERLINE% ]  ║
echo                      ╚═══════════════╩═══════════════════╝
echo.
echo  ╔════════════════════════╦══════════════════════════╦═══════════════════════╗
echo  ║ [ %WHITE%1%MAGENTA% ] ShDW Networks v2 ║ [ %WHITE%2%MAGENTA% ] Couleur Tweak Tips ║ [ %WHITE%3%MAGENTA% ] Alders Hardware ║ 
echo  ╠════════════════════════╩╦════════════════════════╦╩═══════════════════════╣
echo  ║ [ %WHITE%4%MAGENTA% ] Taco Shack Tweaks ║  [ %WHITE%5%MAGENTA% ] MatishzzTweaks  ║  [ %WHITE%6%MAGENTA% ] OptimizeTweaks  ║
echo  ╠═══════════════════════╦═╩════════════════════════╩═╦══════════════════════╣
echo  ║  [ %WHITE%7%MAGENTA% ]  Elite Tweaks  ║    [ %WHITE%8%MAGENTA% ]  Tweak Central    ║ [ %WHITE%9%MAGENTA% ]  ET's Backyard ║
echo  ╠═══════════════════════╩╦══════════════════════════╦╩══════════════════════╣
echo  ║  [ %WHITE%10%MAGENTA% ] Snowz' Igloo   ║  [ %WHITE%11%MAGENTA% ]  Nexus Lite OS   ║  [ %WHITE%12%MAGENTA% ] World Of PC   ║
echo  ╚═══╦═══════════════╦════╩══════════════════════════╩═══╦═══════════════╦═══╝
echo      ║ [ %WHITE%13%MAGENTA% ]  ggOS  ║          [ %WHITE%14%MAGENTA% ]  EchoX            ║ [ %WHITE%15%MAGENTA% ]  Hone  ║
echo      ╚═╦═════════════╩═════╦══════════════════════╦══════╩═════════════╦═╝
echo        ║  [ %WHITE%16%MAGENTA% ] AtlasOS   ║    [ %WHITE%17%MAGENTA% ] EagleOS    ║  [ %WHITE%18%MAGENTA% ] KernelOS   ║
echo        ╚═══════════╦═══════╩══════════════════════╩══════╦═════════════╝
echo                    ║ [ %WHITE%19%MAGENTA% ] Bulgarian Tweaking Community ║
echo                    ╚═════╦════════════════════════╦══════╝
echo                          ║ [ %WHITE%X%MAGENTA% ] Redirect to Menu ║
echo                          ╚════════════════════════╝
set input=
set /p "input=%WHITE%                                    >: "
if /i %input% == 1 start https://discord.gg/QvzWXq5zaA && goto Servers
if /i %input% == 2 start https://discord.gg/z5kHxfpngW && goto Servers
if /i %input% == 3 start https://discord.gg/sgTvcawCSZ && goto Servers
if /i %input% == 4 start https://discord.gg/t9k94FvmH8 && goto Servers
if /i %input% == 5 start https://dsc.gg/matishzz-tweak && goto Servers
if /i %input% == 6 start https://discord.gg/optimizetweaks && goto Servers
if /i %input% == 7 start https://discord.gg/fXq3vtFzWK && goto Servers
if /i %input% == 8 start https://discord.com/invite/4xP6zf22qW && goto Servers
if /i %input% == 9 start https://discord.gg/RXB8bfsPpU && goto Servers
if /i %input% == 10 start https://discord.gg/aRMvSPDEbn && goto Servers
if /i %input% == 11 start https://dsc.gg/NexusToolkit && goto Servers
if /i %input% == 12 start https://dsc.gg/wpc && goto Servers
if /i %input% == 13 start https://dsc.gg/ggOS && goto Servers
if /i %input% == 14 start https://discord.gg/AcYMrykyWV && goto Servers
if /i %input% == 15 start https://discord.gg/5w6gFwHVJt && goto Servers
if /i %input% == 16 start https://dsc.gg/AtlasOS && goto Servers
if /i %input% == 17 start https://discord.gg/2zXkuq44yh && goto Servers
if /i %input% == 18 start https://discord.gg/tbadNzAd9Y && goto Servers
if /i %input% == 19 start https://discord.gg/utZByRXnrc && goto Servers
if /i %input% == x goto Menu















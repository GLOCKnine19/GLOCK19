@echo off 
mode con: cols=120 lines=30
chcp 65001 >nul
color 1
set version=v0.2
set releasestatus=Official Release
SETLOCAL EnableDelayedExpansion

:: Credits to Zusier
mode con: cols=120 lines=30
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (  
echo Requesting administrative privileges...
echo Please click yes when prompted.
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
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
color 4
goto mainscreen

:mainscreen
cls
mode con: cols=120 lines=30
color 3
title X ^| Made by: Tare#1326 ^| Enhancing your gaming experience 
echo.          
echo                                                  [-] Made by: Tare [-]
echo.             
echo                                                      `YMM'   `MP' 
echo                                                        VMb.  ,P   
echo                                                         `MM.M'    
echo                                                           MMb     
echo                                                         ,M'`Mb.   
echo                                                        ,P   `MM.  
echo                                                      .MM:.  .:MMa.
echo.
echo                                 [ 1 - Optimize]    [ 2 - Credits ]    [ 3 - Info]
echo                                                    [ 4 - Discord ]
echo.
echo.
echo.
set /p input="> "
    if "%input%"=="1" goto beforetweaks
	if "%input%"=="2" goto credits
    if "%input%"=="3" goto info
    if "%input%"=="4" goto discord
echo Please enter a valid number! & goto mainscreen

:discord
cls
mode con: cols=120 lines=30
color 3
title X ^| Made by: Tare#1326 ^| Enhancing your gaming experience 
echo.          
echo                                                  [-] Made by: Tare [-]
echo.             
echo                                                      `YMM'   `MP' 
echo                                                        VMb.  ,P   
echo                                                         `MM.M'    
echo                                                           MMb     
echo                                                         ,M'`Mb.   
echo                                                        ,P   `MM.  
echo                                                      .MM:.  .:MMa.
echo.
echo.
echo Joining Tare's Tweaking Centre...
timeout 2 >nul /nobreak
start /max https://discord.gg/ZV2zqf6nMV
timeout 2 >nul /nobreak
echo Going back to main menu...
timeout 3 >nul /nobreak
goto mainscreen

:credits
cls
mode con: cols=120 lines=30
color 3
title X ^| Made by: Tare#1326 ^| Enhancing your gaming experience 
echo.          
echo                                                  [-] Made by: Tare [-]
echo.             
echo                                                      `YMM'   `MP' 
echo                                                        VMb.  ,P   
echo                                                         `MM.M'    
echo                                                           MMb     
echo                                                         ,M'`Mb.   
echo                                                        ,P   `MM.  
echo                                                      .MM:.  .:MMa.
echo.
echo.
echo Credits:
echo ArtanisInc - Tweaks (credited in code)
echo AMIT - Tweaks (credited in code)
echo Zusier - Tweaks (credited in code)
echo EverythingTech - Tweaks (credited in code)
echo.
echo I do not claim all of the tweaks are mine. Tweaks are credited in the code.
echo.
echo Press any key to go back to main menu.
pause >nul
echo Going back to main menu...
timeout 2 >nul
color 4
goto mainscreen

:info
cls
mode con: cols=120 lines=30
color 3
title X ^| Made by: Tare#1326 ^| Enhancing your gaming experience 
echo.          
echo                                                  [-] Made by: Tare [-]
echo.             
echo                                                      `YMM'   `MP' 
echo                                                        VMb.  ,P   
echo                                                         `MM.M'    
echo                                                           MMb     
echo                                                         ,M'`Mb.   
echo                                                        ,P   `MM.  
echo                                                      .MM:.  .:MMa.
echo.
echo.
echo X Information:
echo.
echo DISCLAIMER^^! I am not responsible for any damage caused, you ran this on your own.
echo.
echo I do not claim any tweaks as mine, everyone is credited in the code of the script.
echo For any issues join our Discord, option number 4 on the main screen.
echo.
echo Press any key to go back to main menu.
pause >nul
echo Going back to main menu...
timeout 2 >nul
goto mainscreen

:beforetweaks
cls
mode con: cols=120 lines=30
color 3
title X ^| Made by: Tare#1326 ^| Enhancing your gaming experience 
echo.          
echo                                                  [-] Made by: Tare [-]
echo.             
echo                                                      `YMM'   `MP' 
echo                                                        VMb.  ,P   
echo                                                         `MM.M'    
echo                                                           MMb     
echo                                                         ,M'`Mb.   
echo                                                        ,P   `MM.  
echo                                                      .MM:.  .:MMa.
echo.
echo.
set /p input="Would you like to create a Restore Point and a Registry backup? (Y/N): "
    if "%input%"=="Y" goto tweaksmain
	if "%input%"=="y" goto tweaksmain
    if "%input%"=="n" goto tweaks
	if "%input%"=="N" goto tweaks
echo Please enter a valid number! & goto beforetweaks

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
@powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Before X' -RestorePointType 'MODIFY_SETTINGS'"
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

:tweaks
cls
::Credits to ArtanisInc & EverythingTech
echo Applying BCDEDIT settings
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
bcdedit /set disabledynamictick Yes >nul 2>&1
bcdedit /set useplatformtick Yes >nul 2>&1
bcdedit /set debug No >nul 2>&1
bcdedit /set bootmenupolicy legacy >nul 2>&1
bcdedit /set integrityservices Disable >nul 2>&1
bcdedit /set tpmbootentropy ForceDisable >nul 2>&1
bcdedit /set hypervisorlaunchtype Off >nul 2>&1
bcdedit /set disableelamdrivers Yes >nul 2>&1
bcdedit /set isolatedcontext No >nul 2>&1

echo Installing Chocolatey to install Devmanview...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"  >nul 2>&1
choco install devmanview -y >nul 2>&1
devmanview /disable "System Speaker" >nul 2>&1
devmanview /disable "System Timer" >nul 2>&1
devmanview /disable "WAN Miniport (IKEv2)" >nul 2>&1
devmanview /disable "WAN Miniport (IP)" >nul 2>&1
devmanview /disable "WAN Miniport (L2TP)" >nul 2>&1
devmanview /disable "WAN Miniport (Network Monitor)" >nul 2>&1
devmanview /disable "WAN Miniport (PPPOE)" >nul 2>&1
devmanview /disable "WAN Miniport (PPTP)" >nul 2>&1
devmanview /disable "WAN Miniport (SSTP)" >nul 2>&1
devmanview /disable "High Precision Event Timer" >nul 2>&1

echo Disabling drivers
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\3ware" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\ADP80XX" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\PEAUTH" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\rdyboost" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\KSecPkg" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\mrxsmb20" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\mrxsmb" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\srv2" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\sfloppy" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SiSRaid2" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SiSRaid4" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\tcpipreg" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Telemetry" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo Removing dependencies
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dhcp" /v "DependOnService" /t REG_MULTI_SZ /d "NSI\0Afd" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache" /v "DependOnService" /t REG_MULTI_SZ /d "nsi" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\rdyboost" /v "DependOnService" /t REG_MULTI_SZ /d "" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v "LowerFilters" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v "UpperFilters" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\fvevol" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo Disabling defender
icacls "C:\Program Files\Windows Defender" /t /c /q /grant administrators:F  >nul 2>&1
takeown /f "C:\Program Files\Windows Defender" >nul 2>&1
RD /S /Q "C:\Program Files\Windows Defender" >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
sc stop WinDefend >nul 2>&1
sc config WinDefend start=disabled >nul 2>&1
sc delete WinDefend >nul 2>&1
sc stop WdNisSvc >nul 2>&1
sc config WdNisSvc start=disabled >nul 2>&1
sc delete WdNisSvc >nul 2>&1
sc stop WdFilter  >nul 2>&1
sc config WdFilter start=disabled >nul 2>&1
sc stop Sense >nul 2>&1
sc config Sense start=disabled >nul 2>&1
sc delete Sense >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "OneTimeSqmDataSent" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 / >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 / >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 / >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\UX Configuration" /v "DisablePrivacyMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Scan" /v "AutomaticallyCleanAfterScan" /t REG_DWORD /d "0" /f >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d 4 /f  >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d 4 /f  >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1
regsvr32 /s /u "%ProgramFiles%\Windows Defender\shellext.dll" >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAntiSpywareRealtimeProtection" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DpaDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ProductStatus" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ManagedDefenderProductType" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
sc stop SecurityHealthService >nul 2>&1
sc config SecurityHealthService start=disabled >nul 2>&1
sc stop InstallService >nul 2>&1
sc config InstallService start=disabled >nul 2>&1
sc stop WdNisSvc >nul 2>&1
sc config WdNisSvc start=disabled >nul 2>&1

echo Disabling SmartScreen
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f  >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f >nul 2>&1

echo Disabling Cortana
taskkill /f /im Cortana.exe
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d 0 /f  >nul 2>&1
rd /s /q "%WinDir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy" >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul 2>&1

::Credits to ArtanisInc
echo Removing Kernel Blacklist
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\BlockList\Kernel" /va /reg:64 /f >nul 2>&1

::Credits to ArtanisInc
echo Removing MicrocodeUpdate
del /f /q"%WinDir%\System32\mcupdate_GenuineIntel.dll" >nul 2>&1
del /f /q "%WinDir%\System32\mcupdate_AuthenticAMD.dll" >nul 2>&1

echo Disabling Hibernation
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo Disabling power throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo MMCSS
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "LazyModeTimeout" /t REG_DWORD /d "150000" /f >nul 2>&1

::Credits to ArtanisInc
echo Speed up start time
reg add "HKU\!USER_SID!\AppEvents\Schemes" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f >nul 2>&1

::Credits to ArtanisInc
echo Disabling FSO Globally and GameDVR
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKU\!USER_SID!\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKU\!USER_SID!\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKU\!USER_SID!\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKU\!USER_SID!\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg delete "HKU\!USER_SID!\System\GameConfigStore\Children" /f >nul 2>&1
reg delete "HKU\!USER_SID!\System\GameConfigStore\Parents" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f  >nul 2>&1

echo App Tracking
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d 0 /t REG_DWORD /f >nul 2>&1

echo Disabling ease of access
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\MouseKeys" /v Flags /t REG_DWORD /d 00000000 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_DWORD /d 00000000 /f  >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_DWORD /d 00000000 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_DWORD /d 00000000 /f >nul 2>&1

echo Setting up application compatibility
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableEngine" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d "1" /f >nul 2>&1

::Credits to ArtanisInc
echo Disabling DWM composition
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowComposition" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DWMWA_TRANSITIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f >nul 2>&1

echo Disabling RD Through Registry...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\RpcLocator" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\UmRdpService" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo Disabling Biometrics..
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo Disabling system energy-saving
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1

echo Large System Cache (may fix microstutters)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul 2>&1

echo SvcHostSplitThreshold
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "!SVCHOST!" /f >nul 2>&1

echo Disabling Useless Tasks Through Powershell.
Powershell -Command "Get-ScheduledTask -TaskName XblGameSaveTask | Disable-ScheduledTask" >nul 2>&1
Powershell -Command "Get-ScheduledTask -TaskName Consolidator | Disable-ScheduledTask" >nul 2>&1
Powershell -Command "Get-ScheduledTask -TaskName UsbCeip | Disable-ScheduledTask" >nul 2>&1
Powershell -Command "Get-ScheduledTask -TaskName DmClient | Disable-ScheduledTask" >nul 2>&1
Powershell -Command "Get-ScheduledTask -TaskName DmClientOnScenarioDownload | Disable-ScheduledTask" >nul 2>&1

echo Memory
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "ContigFileAllocSize" /t REG_DWORD /d "1536" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "DisableDeleteNotification" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "FileNameCache" /t REG_DWORD /d "1024" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsAllowExtendedCharacter8dot3Rename" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsBugcheckOnCorrupt" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsDisableCompression" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsDisableEncryption" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsEncryptPagingFile" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsMemoryUsage" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "PathCache" /t REG_DWORD /d "128" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "RefsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "UdfsSoftwareDefectManagement" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\filesystem" /v "Win31FileSystem" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "!TOTALMEMORY!" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\executive" /v "AdditionalDelayedWorkerThreads" /t REG_DWORD /d "!TOTALMEMORY!" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\i/o system" /v "CountOperations" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management" /v "IoPageLockLimit" /t REG_DWORD /d "8000000" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 2>&1

echo Pausing maps updates and downloads
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f >nul 2>&1

echo Disabling NTFS/ReFS mitigations
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f >nul 2>&1

echo Disabling Windows attempt to save as much RAM as possible
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f >nul 2>&1

echo Disabling Spectre and Meltdown
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "DisableTsx" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul 2>&1

echo Kernel settings
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "DpcWatchdogProfileOffset" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "DpcWatchdogPeriod" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "SerializeTimerExpiration" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "22222222222222222002000000200000" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "20000020202022220000000000000000" /f >nul 2>&1

echo Disabling Windows Customer Experience Improvement Program
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d "0.0.0.0" /f >nul 2>&1

echo Disabling Preemption and V-Sync Idle Timeout for gpu
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f >nul 2>&1

echo Setting large page drivers
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "LargePageDrivers" /t REG_MULTI_SZ /d "!DRIVERLIST!!NIC_SERVICE!" /f >nul 2>&1

echo Disabling Web in Search
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo Change Windows feedback to Never
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f >nul 2>&1

echo Removing Metadata Tracking
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /f >nul 2>&1

echo Disabling Delivery Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1

echo Disabling Gamebar Presence Writer
chdir /d C:\Windows\System32 >nul 2>&1
ren GameBarPresenceWriter.exe GameBarPresenceWriter.old >nul 2>&1
taskkill /F /FI "IMAGENAME eq GameBarPresenceWriter.exe" >nul 2>&1

echo Removing mobsync and GameBarPresenceWriter
del /F /Q "%WinDir%\System32\GameBarPresenceWriter.exe" >nul 2>&1
del /F /Q "%WinDir%\System32\mobsync.exe" >nul 2>&1

:: Credits Zusier
echo Disabling mitigations
powershell set-ProcessMitigation -System -Disable DEP >nul 2>&1
powershell set-ProcessMitigation -System -Disable EmulateAtlThunks >nul 2>&1
powershell set-ProcessMitigation -System -Disable RequireInfo >nul 2>&1
powershell set-ProcessMitigation -System -Disable BottomUp >nul 2>&1
powershell set-ProcessMitigation -System -Disable HighEntropy >nul 2>&1
powershell set-ProcessMitigation -System -Disable StrictHandle >nul 2>&1
powershell set-ProcessMitigation -System -Disable CFG >nul 2>&1
powershell set-ProcessMitigation -System -Disable StrictCFG >nul 2>&1
powershell set-ProcessMitigation -System -Disable SuppressExports >nul 2>&1
powershell set-ProcessMitigation -System -Disable SEHOP >nul 2>&1
powershell set-ProcessMitigation -System -Disable AuditSEHOP >nul 2>&1
powershell set-ProcessMitigation -System -Disable SEHOPTelemetry >nul 2>&1
powershell set-ProcessMitigation -System -Disable ForceRelocateImages >nul 2>&1

echo Disabling Error Reporting
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f >nul 2>&1

echo Disabling Telemetry
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowClipboardHistory" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowCrossDeviceClipboard" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "authenticodeenabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f >nul 2>&1

echo Scheduled tasks
schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Application Experience\StartupAppTask" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Application Experience\AitAgent" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\AppID\SmartScreenSpecific" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Autochk\Proxy" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\DiskFootprint\Diagnostics" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Maintenance\WinSAT" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\PI\Sqm-Tasks" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Time Synchronization\SynchronizeTime" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\WindowsUpdate\Automatic App Update" /disable >nul 2>&1
schtasks /change /tn "Microsoft\Windows\Device Information\Device" /disable >nul 2>&1
schtasks /change /tn "USER_ESRV_SVC_QUEENCREEK" /disable >nul 2>&1

echo Power settings
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

:: Thanks to AMIT & EverythingTech 
echo Network tweaks
netsh int tcp set global timestamps=enabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1
netsh int tcp set global chimney=disabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global autotuninglevel=disabled >nul 2>&1 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "00000001" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "23" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d "00000008" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPDelAckTicks" /t REG_DWORD /d "00000001" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "191" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "192" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "214" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "215" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "PriorityBoost" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "00000001" /f >nul 2>&1
powershell -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6" >nul 2>&1
powershell -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_msclient" >nul 2>&1
powershell -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_pacer" >nul 2>&1
powershell -Command "Disable-NetAdapterLso -Name *" >nul 2>&1
powershell -Command "Set-NetOffloadGlobalSetting -PacketCoalescingFilter disabled" >nul 2>&1
powershell -Command "Disable-NetAdapterChecksumOffload -Name * -IpIPv4 -TcpIPv4 -TcpIPv6 -UdpIPv4 -UdpIPv6" >nul 2>&1
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1

echo Uninstalling OneDrive
taskkill /f /im OneDrive.exe  >nul 2>&1
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
%SystemRoot%\System32\OneDriveSetup.exe /uninstall >nul 2>&1
goto finishscreen

:finishscreen
cls
mode con: cols=120 lines=30
color 3
title X ^| Made by: Tare#1326 ^| Enhancing your gaming experience 
echo.          
echo                                                  [-] Made by: Tare [-]
echo.             
echo                                                      `YMM'   `MP' 
echo                                                        VMb.  ,P   
echo                                                         `MM.M'    
echo                                                           MMb     
echo                                                         ,M'`Mb.   
echo                                                        ,P   `MM.  
echo                                                      .MM:.  .:MMa.
echo.
echo.
echo The script has finished. Restart your PC to apply the tweaks.
echo Exiting in 10 seconds...
timeout 10 >nul /nobreak & exit

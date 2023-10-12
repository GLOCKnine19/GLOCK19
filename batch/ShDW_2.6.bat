@echo off 
chcp 65001 >nul
color 74
set version=v2.6
set releasestatus=Official Release
set prompt=
SETLOCAL EnableDelayedExpansion
:: Checking For Admin Rights, Credit To Zusier For This.
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    echo Please click yes when prompted.
timeout 1 >nul /nobreak
color 71
timeout 1 >nul /nobreak
color 74
timeout 1 >nul /nobreak
color 71
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
goto mainscreen

:mainscreen
cls
mode con: cols=120 lines=40
title ShDW ^| Made by: jSN#2324 ^& Tare#1326 ^| %version% - %releasestatus%
echo.                   
echo                                                    ^| Made by: Jason, Tare ^|                            
echo.
echo.
echo                                         /$$$$$$  /$$       /$$$$$$$  /$$      /$$
echo                                        / $$__ $$ ^| $$      ^| $$__  $$^| $$  /$ ^| $$
echo                                       ^| $$  \__/ ^| $$$$$$$ ^| $$  \ $$^| $$ /$$$^| $$
echo                                       ^|  $$$$$$  ^| $$__  $$^| $$  ^| $$^| $$/$$ $$ $$
echo                                        \____  $$ ^| $$  \ $$^| $$  ^| $$^| $$$$_  $$$$
echo                                        /$$  \ $$ ^| $$  ^| $$^| $$  ^| $$^| $$$/ \  $$$
echo                                        ^|  $$$$$$/^| $$  ^| $$^| $$$$$$$/^| $$/   \  $$
echo                                         \______/ ^|__/  ^|__/^|_______/ ^|__/     \__/
echo.
echo                                                    ^| %releasestatus% %version% ^| 
echo.
echo                                     -------------------            -------------------
echo                                     ^|     Tweaks      ^|            ^|   Miscellaneous ^|
echo                                     -------------------            -------------------       
echo.                       
echo                                     [ 1 ] Specific Tweaks          [ 4 ] Credits	
echo.                                   
echo                                     [ 2 ] Advanced Tweaks          [ 5 ] ShDW Discord
echo.
echo                                     [ 3 ] Basic Tweaks             [ 6 ] Software Installer 
echo.   
echo.                           
set /p input=%prompt% "> "
    if "%input%"=="1" goto specifictweaks
	if "%input%"=="2" goto :confirmtweaks
    if "%input%"=="4" goto :credits
    if "%input%"=="5" goto joinshdwdiscord
    if "%input%"=="3" goto disableserviceslol
    if "%input%"=="6" goto softwareinstallermenu
echo Please enter a valid number! & goto mainscreen

:specifictweaks
cls
title ShDW ^| Made by: jSN#2324 ^& Tare#1326 ^| %version% - %releasestatus%
color 4
echo.
echo                           [ 1 ] Disable Power Saving        [ 2 ] Disable Cortana 
echo.
echo                           [ 3 ] Clear Temp                  [ 4 ] Disable Windows Update 
echo.
echo                           [ 5 ] Disable Smartscreen         [ 6 ] Disable Windows Defender
echo.
echo                           [ 7 ] Disable Devices             [ 9 ] Disable GameDVR
echo.
echo                           [ 9 ] Disable telemetry           [ 10 ] Remove  OneDrive
echo.
echo.
echo.
echo.
echo.
echo.
echo                                           Press "X" to go to the main menu
echo. 
set /p stinput="> "
if %stinput% == 1 goto PowerSaving
if %stinput% == 2 goto Cortana
if %stinput% == 3 goto Temp
if %stinput% == 4 goto Update
if %stinput% == 5 goto SmartScreen
if %stinput% == 6 goto Defender
if %stinput% == 7 goto DevicesDevMan
if %stinput% == 8 goto GameDVR
if %stinput% == 9 goto Telemetry
if %stinput% == 10 goto RemoveOneDrive
if %stinput% == x goto mainscreen
if %stinput% == X goto mainscreen
echo Wrong. & goto specifictweaks

:RemoveOneDrive
cls
taskkill /f /im OneDrive.exe >nul
echo Uninstalling One Drive, This May Take A Moment. Be Patient.
timeout 2 >nul /nobreak
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
%SystemRoot%\System32\OneDriveSetup.exe /uninstall
goto specifictweaks

:Telemetry
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
goto specifictweaks

:GameDVR
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_SZ /d "00000000" /f
goto specifictweaks

:DevicesDevMan
echo Installing Chocolatey To Install Devmanview...
timeout 2 >nul /nobreak
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 
choco install devmanview -y
timeout 2 >nul /nobreak
devmanview /disable "High Precision Event Timer"
devmanview /disable "Bluetooth"
devmanview /disable "System Timer"
goto specifictweaks

:Defender
icacls "C:\Program Files\Windows Defender" /t /c /q /grant administrators:F  
takeown /f "C:\Program Files\Windows Defender"
RD /S /Q "C:\Program Files\Windows Defender"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
sc stop WinDefend
sc config WinDefend start=disabled
sc delete WinDefend
sc stop WdNisSvc
sc config WdNisSvc start=disabled
sc delete WdNisSvc
sc stop WdFilter 
sc config WdFilter start=disabled
sc stop Sense
sc config Sense start=disabled
sc delete Sense
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "OneTimeSqmDataSent" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\UX Configuration" /v "DisablePrivacyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Scan" /v "AutomaticallyCleanAfterScan" /t REG_DWORD /d "0" /f
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d 4 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d 4 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d 4 /f
regsvr32 /s /u "%ProgramFiles%\Windows Defender\shellext.dll"
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAntiSpywareRealtimeProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DpaDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ProductStatus" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ManagedDefenderProductType" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
sc stop SecurityHealthService
sc config SecurityHealthService start=disabled
sc stop InstallService
sc config InstallService start=disabled
sc stop WdNisSvc
sc config WdNisSvc start=disabled
goto specifictweaks

:SmartScreen
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
goto specifictweaks

:Update
taskkill -F -FI "IMAGENAME eq SystemSettings.exe"
net stop wuauserv
net stop UsoSvc
sc stop wuauserv
sc config wuauserv start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "1" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontSearchWindowsUpdate" /t REG_DWORD /d "1" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DriverUpdateWizardWuSearchEnabled" /t REG_DWORD /d "0" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "1" /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\UsoSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f
gpupdate /force
rd s q "C:\Windows\SoftwareDistribution"
md "C:\Windows\SoftwareDistribution"
goto specifictweaks

:Temp
cls
echo Clearing Temp
timeout 2 >nul /nobreak
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\recent
cls
goto specifictweaks

:Cortana
cls
taskkill /f /im Cortana.exe
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d 0 /f 
rd /s /q "%WinDir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy" >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
taskkill /f /im explorer.exe
start explorer.exe
goto specifictweaks

:PowerSaving
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
goto specifictweaks

:softwareinstallermenu
cls
color 4
if exist "C:\ProgramData\chocolatey" goto simenu
if not exist "C:\ProgramData\chocolatey" goto installchocolatey
echo Installing Chocolatey (Used To Install All The Software)
timeout 2 >nul /nobreak

:installchocolatey
echo Detected That Chocolatey Isn't Installed. Installing Chocolatey.
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 
goto simenu

:simenu
color 4
cls 
echo                                                 ^|SOFTWARE INSTALLER^|
echo.                      
echo                                       [ 1 ] Brave     [ 2 ] Chrome   [ 3 ] Firefox
echo.
echo                                       [ 4 ] Autoruns  [ 5 ] Msi Afterburner
echo.
echo                                       [ 6 ] Discord   [ 7 ] Gimp    [ 8 ] Nsudo
echo.
echo.
echo.
echo                                           X To Go Back To Main Menu.
set /p swchoice=Choose:
if %swchoice% == 1 choco install brave -y & goto simenu
if %swchoice% == 2 choco install chrome -y & goto simenu
if %swchoice% == 3 choco install firefox -y & goto simenu
if %swchoice% == 4 choco install autoruns -y & goto simenu
if %swchoice% == 5 choco install msiafterburner  -y & goto simenu
if %swchoice% == 6 choco install discord -y & goto simenu
if %swchoice% == 7 choco install gimp -y & goto simenu
if %swchoice% == 8 choco install nsudo -y 7 goto simenu
if %swchoice% == X goto mainscreen
if %swchoice% == x goto mainscreen
echo Please Enter A Valid Number! & goto simenu

:disableserviceslol
cls
sc stop WpnUserService
sc config WpnUserService start=disabled
sc stop SysMain
sc config SysMain start=disabled
sc stop TroubleshootingSvc
sc config TroubleshootingSvc start=disabled
sc stop Themes
sc config Themes start=disabled
sc stop BITS
sc config BITS start=disabled
sc stop PrintNotify
sc config PrintNotify start=disabled
sc stop W32Time
sc config W32Time start=disabled
sc stop MapsBroker
sc config MapsBroker start=disabled
sc stop RemoteRegistry
sc config RemoteRegistry start=disabled
sc stop diagsvc
sc config diagsvc start=disabled
sc stop XboxGipSvc
sc config XboxGipSvc start=disabled
sc stop XblAuthManager
sc config XblAuthManager start=disabled
sc stop XblGameSave
sc config XblGameSave start=disabled
sc stop WdiServiceHost
sc config WdiServiceHost start=disabled
sc stop XboxNetApiSvc 
sc config XboxNetApiSvc start=disabled
sc stop Spooler
sc config Spooler start=disabled
sc stop UmRdpService
sc config UmRdpService start=disabled
sc stop TermService
sc config TermService start=disabled
sc stop SessionEnv
sc config SessionEnv start=disabled
sc stop RasAuto
sc config RasAuto start=disabled
sc stop RasMan
sc config RasMan start=disabled
sc stop icssvc
sc config icssvc start=disabled
sc stop MixedRealityOpenXRSvc
sc config MixedRealityOpenXRSvc start=disabled
sc stop workfolderssvc
sc config workfolderssvc start=disabled
sc stop WbioSrvc
sc config WbioSrvc start=disabled
sc stop FrameServer
sc config FrameServer start=disabled
sc stop TimeBrokerSvc
sc config TimeBrokerSvc start=disabled
sc stop lmhosts
sc config lmhosts start=disabled
sc stop PhoneSvc
sc config PhoneSvc start=disabled
sc stop vmicrdv
sc config vmicrdv start=disabled
sc stop vmictimesync 
sc config vmictimesync start=disabled
sc stop vmicvss
sc config vmicvss start=disabled
sc stop vmicheartbeat
sc config vmicheartbeat start=disabled
sc stop DoSvc
sc config DoSvc start=disabled
sc stop DPS
sc config DPS start=disabled
sc stop LanmanServer
sc config LanmanServer start=disabled
sc stop WEPHOSTSVC
sc config WEPHOSTSVC start=disabled
sc stop TabletInputService
sc config TabletInputService start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /d "1" /t REG_DWORD /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BDESVC" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
cls
echo Clearing Temp Etc.
timeout 2 >nul /nobreak
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
cls
goto mainscreen

:joinshdwdiscord
cls
echo Joining ShDW Community.
timeout 2 >nul /nobreak
start /max https://discord.gg/ZV2zqf6nMV
timeout 5 >nul /nobreak
cls
color 0f
echo Want To Share The ShDW Discord Invite With Your Friends?
echo Discord invite to ShDW: discord.gg/ZV2zqf6nMV
echo Press any key to go back to the main menu.
pause >nul
echo Going Back To Main Menu... & color 3f
timeout 2 >nul /nobreak
goto mainscreen

:info
cls
mode con: cols=120 lines=40
title ShDW ^| Made by: jSN#2324 ^& Tare#1326 ^| %version% - %releasestatus%
echo.                   
echo                                                    ^| Made by: Jason, Tare ^|                            
echo.
echo.
echo                                         /$$$$$$  /$$       /$$$$$$$  /$$      /$$
echo                                        / $$__ $$ ^| $$      ^| $$__  $$^| $$  /$ ^| $$
echo                                       ^| $$  \__/ ^| $$$$$$$ ^| $$  \ $$^| $$ /$$$^| $$
echo                                       ^|  $$$$$$  ^| $$__  $$^| $$  ^| $$^| $$/$$ $$ $$
echo                                        \____  $$ ^| $$  \ $$^| $$  ^| $$^| $$$$_  $$$$
echo                                        /$$  \ $$ ^| $$  ^| $$^| $$  ^| $$^| $$$/ \  $$$
echo                                        ^|  $$$$$$/^| $$  ^| $$^| $$$$$$$/^| $$/   \  $$
echo                                         \______/ ^|__/  ^|__/^|_______/ ^|__/     \__/
echo.         
echo.
echo ShDW is provided "AS IS" without any warranty. In no event will the Developer be liable for any special, incidental, consequential or indirect damages due to loss of data or any other reason. 
echo We made this script to help people enhance their gaming experience. We ARE NOT RESPONSIBLE FOR ANY DAMAGE YOU CAUSE.
echo.
echo Press any key to go back to the main menu.
pause >nul
echo Ok! Going Back To Main Menu... & color 3f
timeout 2 >nul /nobreak
goto mainscreen

:help
cls
mode con: cols=120 lines=40
title ShDW ^| Made by: jSN#2324 ^& Tare#1326 ^| %version% - %releasestatus%
echo.                   
echo                                                    ^| Made by: Jason, Tare ^|                            
echo.
echo.
echo                                         /$$$$$$  /$$       /$$$$$$$  /$$      /$$
echo                                        / $$__ $$ ^| $$      ^| $$__  $$^| $$  /$ ^| $$
echo                                       ^| $$  \__/ ^| $$$$$$$ ^| $$  \ $$^| $$ /$$$^| $$
echo                                       ^|  $$$$$$  ^| $$__  $$^| $$  ^| $$^| $$/$$ $$ $$
echo                                        \____  $$ ^| $$  \ $$^| $$  ^| $$^| $$$$_  $$$$
echo                                        /$$  \ $$ ^| $$  ^| $$^| $$  ^| $$^| $$$/ \  $$$
echo                                        ^|  $$$$$$/^| $$  ^| $$^| $$$$$$$/^| $$/   \  $$
echo                                         \______/ ^|__/  ^|__/^|_______/ ^|__/     \__/
echo.
echo.
echo THE DEVELOPERS OF THIS SCRIPT ARE NOT RESPONSIBLE FOR ANY DAMAGE CAUSED.
echo The whole purpose of this script is to make your PC and Games run smoother with improved FPS and minimised latency.
echo.
echo Press any key to go back to the main menu.
pause >nul
echo Going Back To Main Menu... & color 3f
timeout 2 >nul
goto mainscreen


:credits
cls
mode con: cols=120 lines=40
title ShDW ^| Made by: jSN#2324 ^& Tare#1326 ^| %version% - %releasestatus%
echo.                   
echo                                                    ^| Made by: Jason, Tare ^|                            
echo.
echo.
echo                                         /$$$$$$  /$$       /$$$$$$$  /$$      /$$
echo                                        / $$__ $$ ^| $$      ^| $$__  $$^| $$  /$ ^| $$
echo                                       ^| $$  \__/ ^| $$$$$$$ ^| $$  \ $$^| $$ /$$$^| $$
echo                                       ^|  $$$$$$  ^| $$__  $$^| $$  ^| $$^| $$/$$ $$ $$
echo                                        \____  $$ ^| $$  \ $$^| $$  ^| $$^| $$$$_  $$$$
echo                                        /$$  \ $$ ^| $$  ^| $$^| $$  ^| $$^| $$$/ \  $$$
echo                                        ^|  $$$$$$/^| $$  ^| $$^| $$$$$$$/^| $$/   \  $$
echo                                         \______/ ^|__/  ^|__/^|_______/ ^|__/     \__/
echo.                                          
echo.
echo Credits:
echo Tare - UI, Tweaks
echo Jason - Tweaks 
echo.
echo We do not claim all of the tweaks are ours. Tweaks are credited in the code.
echo.
echo Press any key to go back to main menu.
pause >nul
echo Going back to main menu... & color 3f
timeout 2 >nul
color 4
goto mainscreen


:invalidreq
echo Please enter a valid number.
timeout 2 >nul & goto mainscreen


:invalidreq2
color cf
echo Please enter a valid letter
timeout 2 >nul
goto confirmtweaks


:confirmtweaks
color 4
cls
set /p confirm=Are you sure you want to run the script? I am not responsible for any Damages caused. (y/n)
if  %confirm% == y goto mainconfirm
if  %confirm% == Y goto mainconfirm
if  %confirm% == n cls & echo [44;97mGoing Back To Mainscreen...[1m & color 4 & timeout 3 >nul & goto mainscreen
if  %confirm% == N cls & echo [44;97mGoing Back To Mainscreen...[1m & color 4 & timeout 3 >nul & goto mainscreen
goto invalidreq2


:mainconfirm
mode con: cols=92 lines=21
color 4
cls
echo Notice: By running this script, YOU agree to run it.
echo YOU MUST UNLINK YOUR MICROSOFT ACCOUNT IF YOU WANT TO RUN THIS SCRIPT
echo IF YOU DO RUN THIS SCRIPT SIGNED IN WITH A MICROSOFT ACCOUNT
echo YOU WON'T BE ABLE TO SIGN IN TO WINDOWS.
echo Here is a link to a tutorial which teaches you how to unlink it. 
echo https://youtu.be/gyhf66brmmM
timeout 3 >nul /nobreak
echo.
echo.
echo.
echo.
echo This script removes microsoft store, disables defender etc.
echo I AM NOT RESPONSIBLE, DO NOT COMPLAIN ABOUT THINGS BEING BROKEN.
echo NO FUCKING SHIT SHERLOCK. IF YOU DON'T AGREE TO THIS, DON'T RUN IT. IT'S NOT MY PROBLEM FOR WHAT YOU RUN ON YOUR PC!
set /p confirm21=Are you sure you want to run this script? (Y/N)
if %confirm21% == y goto tweaksmain
if %confirm21% == Y goto tweaksmain
if %confirm21% == n goto mainscreen
if %confirm21% == N goto mainscreen
echo Wrong. & goto mainconfirm

:tweaksmain
if exist "C:\Registry\regbackup.reg" goto registrybackupdetected
set backupcmd=xcopy /s /c /d /e /h /i /r /y
cls
echo [ (...Backing up the Registry...) ]
echo THE REGISTRY BACKUP IS LOCATED AT C:\Registry
timeout 2 >nul /nobreak
if not exist "C:\Registry" mkdir "C:\Registry"
regedit /e "C:\Registry\regbackup.reg"
echo Backup Complete!
cls

:restorepoint2
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f >nul
echo [44;97mCreating a restore point... [1m
timeout 2 >nul /nobreak
@powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Before ShDW' -RestorePointType 'MODIFY_SETTINGS'"
set SR_STATUS=%ERRORLEVEL%
IF %SR_STATUS%==0 color 2f & echo System Restore point made succesfully!
timeout 3 >nul /nobreak
cls
IF NOT %SR_STATUS%==0 color f1 & echo Failed to make a restore point, please make sure you have enabled protection in System Restore.
timeout 3 >nul /nobreak
goto chocolatey

:registrybackupdetected
cls
color f1
echo Registry backup detected. Skipping registry backup to avoid issues.
timeout 2 >nul /nobreak
cls
goto restorepoint2

timeout 2 >nul /nobreak
:chocolatey
cls
color f1
echo [44;97m Installing Chocolatey (Used to download third party software like Open-Shell.)[1m
timeout 2 >nul /nobreak
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 
goto devmanview


:devmanview
cls
color f9
echo Installing DevManView...
chocolatey install devmanview -y


:disabledev
cls
echo Disabling Devices.. Please wait.
timeout 3 >nul /nobreak
devmanview /disable "High Precision Event Timer"
devmanview /disable "System Timer"
devmanview /disable "Microsoft Kernel Debug Network Adapter"
cls
timeout 2 >nul
color f9
echo Devices Disabled.
timeout 2 >nul /nobreak
sc stop wuauserv
sc config wuauserv start=disabled
sc stop RmSvc
sc config RmSvc start=disabled
sc stop W32Time
sc config W32Time start=disabled
sc stop PrintNotify
sc config PrintNotify start=disabled
sc stop spectrum
sc config spectrum start=disabled
sc stop RpcLocator
sc config RpcLocator start=disabled
sc stop wisvc
sc config wisvc start=disabled
sc stop MixedRealityOpenXRSvc
sc config MixedRealityOpenXRSvc start=disabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "1" /f
sc stop icssvc
sc config icssvc start=disabled
powercfg -h off
sc stop WerSvc
sc config WerSvc start=disabled
sc stop WpnUserService
sc config WpnUserService start=disabled
sc delete WpnUserService
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "1" /f >nul
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontSearchWindowsUpdate" /t REG_DWORD /d "1" /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\NaturalAuthentication" /v "Start" /t REG_DWORD /d "4" /f
sc stop WinRM
sc config WinRM start=disabled
sc stop TroubleshootingSvc
sc config TroubleshootingSvc start=disabled
sc stop SysMain
sc config SysMain start=disabled
sc stop lmhosts
sc config lmhosts start=disabled
sc stop Themes
sc config Themes start=disabled
sc stop TermService
sc config TermService start=disabled
sc stop workfolderssvc
sc config workfolderssvc start=disabled
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
sc stop UmRdpService
sc config UmRdpService start=disabled
sc stop SessionEnv
sc stop BITS
sc config BITS start=disabled
sc config SessionEnv start=disabled
sc stop MapsBroker
sc config MapsBroker start=disabled
sc stop WpcMonSvc
sc config WpcMonSvc start=disabled
sc stop RasMan
sc config RasMan start=disabled
sc stop PcaSvc
sc config PcaSvc start=disabled
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
sc stop RasAuto
sc config RasAuto start=disabled
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t Reg_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableCredentialsSettingSync" /t Reg_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableWindowsSettingSyncUserOverride" /t Reg_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisablePersonalizationSettingSyncUserOverride" /t Reg_DWORD /d 1 /
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "5000" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "4000" /f
reg add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_SZ /d "150000" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsAll" /t REG_DWORD /d "1" /f
sc stop RemoteRegistry
sc stop diagsvc
sc config diagsvc start=disabled
sc delete diagsvc
sc stop DoSvc
sc config DoSvc start=disabled
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "FastDRAM" /t REG_DWORD /d "1" /f
sc config RemoteRegistry start=disabled
sc stop XboxGipSvc
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f 
sc config XboxGipSvc start=disabled
sc stop Fax
sc config Fax start=disabled
sc stop XblAuthManager
sc config XblAuthManager start=disabled
sc stop XblGameSave
sc config XblGameSave start=disabled
sc stop WdiServiceHost
sc config WdiServiceHost start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\iphlpsvc" /v "Start" /t REG_DWORD /d "4" /f
sc stop DiagTrack
sc delete DiagTrack
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f 
sc stop XboxNetApiSvc 
sc config XboxNetApiSvc start=disabled
sc stop PushToInstall 
sc config PushToInstall start=disabled
sc stop Sense
sc config Sense start=disabled
sc stop WEPHOSTSVC
sc config WEPHOSTSVC start=disabled
sc stop WdiSystemHost
sc config WdiSystemHost start=disabled
sc stop lfsvc
sc config lfsvc start=disabled
sc stop WpnService
sc config WpnService start=disabled
sc stop PhoneSvc
sc config PhoneSvc start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /d "1" /t REG_DWORD /f
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
sc stop AppXSvc
sc config AppXSvc start=disabled
sc delete AppXSvc
sc stop WbioSrvc
sc config WbioSrvc start=disabled
sc stop HvHost
sc config HvHost start=disabled
sc stop TabletInputService
sc config TabletInputService start=disabled
sc stop vmickvpexchange
sc config vmickvpexchange start=disabled
sc stop vmicguestinterface
sc config vmicguestinterface start=disabled
sc stop vmicshutdown
sc config vmicshutdown start=disabled
sc stop FrameServer
sc config FrameServer start=disabled
sc stop vmicheartbeat
sc config vmicheartbeat start=disabled
sc stop vmicvmsession
sc config vmicvmsession start=disabled
sc stop vmicrdv
sc config vmicrdv start=disabled
sc stop vmictimesync
sc config vmictimesync start=disabled
sc stop vmicvss 
sc config vmicvss start=disabled
bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick Yes
bcdedit /set quietboot yes
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "MiscPolicyInfo" /t REG_DWORD /d "2" /f
schtasks /Change /DISABLE /TN "\Microsoft\Windows\InstallService\ScanForUpdates"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WaaSMedic\PerformRemediation"
goto VFX

:VFX
cls
echo Tweaking visual effects in Control Panel...
timeout 3 >nul /nobreak 
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows" /v "DefaultApplied" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled" /v "DefaultApplied" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled" /v "DefaultApplied" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing" /v "DefaultApplied" /t REG_SZ /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_SZ /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f 
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "1" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f

:disableXboxDVR
echo Disabling GameDVR...
timeout 2 >nul /nobreak
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_SZ /d "00000000" /f

:Search & Cortana 
rd /s /q "%WinDir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy" >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f

::disable other useless things 
echo Disabling useless things...
timeout 2 >nul /nobreak
cls
sc stop DPS
sc config DPS start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\NaturalAuthentication" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EFS" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dot3svc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MessagingService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MSDTC" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MSiSCSI" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\msiserver" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "4" /f

::fastStartup
cls
echo Disabling fast startup
timeout 2 >nul /nobreak
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
timeout 2 >nul /nobreak



:ds
timeout 5 >nul /nobreak
:: disabling defender, credits to zusier :)
icacls "C:\Program Files\Windows Defender" /t /c /q /grant administrators:F  
takeown /f "C:\Program Files\Windows Defender"
RD /S /Q "C:\Program Files\Windows Defender"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
sc stop WinDefend
sc config WinDefend start=disabled
sc delete WinDefend
sc stop WdNisSvc
sc config WdNisSvc start=disabled
sc delete WdNisSvc
sc stop WdFilter 
sc config WdFilter start=disabled
sc stop Sense
sc config Sense start=disabled
sc delete Sense
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "OneTimeSqmDataSent" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\UX Configuration" /v "DisablePrivacyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Scan" /v "AutomaticallyCleanAfterScan" /t REG_DWORD /d "0" /f
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable > NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d 4 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d 4 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d 4 /f
regsvr32 /s /u "%ProgramFiles%\Windows Defender\shellext.dll"
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAntiSpywareRealtimeProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DpaDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ProductStatus" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ManagedDefenderProductType" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
sc stop SecurityHealthService
sc config SecurityHealthService start=disabled
sc stop InstallService
sc config InstallService start=disabled
sc stop WdNisSvc
sc config WdNisSvc start=disabled

:: App Tracking
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d 0 /t REG_DWORD /f

:: Disable Gamebar Presence Writer
chdir /d C:\Windows\System32
ren GameBarPresenceWriter.exe GameBarPresenceWriter.old
taskkill /F /FI "IMAGENAME eq GameBarPresenceWriter.exe"

:: Smartscreen
chdir /d C:\Windows\System32
ren smartscreen.exe smartscreen.old
taskkill /F /FI "IMAGENAME eq smartscreen.exe"

:: Adding onto privacy & Cortana - Credit https://n1kobg.blogspot.com/
sc stop WSearch
sc delete WSearch

taskkill /F /IM SearchUI.exe

move "%windir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy" "%windir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy.bak"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI" /v "EnableCortana" /t REG_DWORD /d "0" /f >nul

:: CPU Priority + SFIO
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "CPUPriority" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f

:Removepackages
cls
Echo Removing useless packages... (THIS WILL TAKE A WHILE, BE PATIENT.)
timeout 3 >nul /nobreak
Echo Removing useless packages... (THIS WILL TAKE A WHILE, BE PATIENT.)
Powershell -Command "Get-AppxPackage *Photos* | Remove-AppxPackage"
Powershell -Command "Get-AppXPackage *Microsoft.XboxGamingOverlay* | Remove-AppXPackage"
Powershell -Command "Get-AppXPackage *Microsoft.WindowsMaps* | Remove-AppXPackage"
Powershell -Command "Get-AppXPackage *Microsoft.WindowsFeedbackHub* | Remove-AppXPackage"                      
Powershell -Command "Get-AppXPackage *Microsoft.XboxApp* | Remove-AppXPackage"
Powershell -Command "Get-AppXPackage *Microsoft.WindowsSoundRecorder* | Remove-AppXPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.VP9VideoExtensions* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *AppInstaller* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *3DViewer* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Skype* | Remove-AppxPackage"
Powershell -Command "Get-AppXPackage *Microsoft.WindowsCamera* | Remove-AppXPackage"
PowerShell -Command "Get-AppxPackage *StickyNotes* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *FeedbackHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Snip & Sketch* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.GetHelp_10.1706.13331.0_x64__8wekyb3d8bbwe* Remove-AppxPackage"
Powershell -Command "Get-AppXPackage *Microsoft.HEIFImageExtension* | Remove-AppXPackage"
cls
PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
Echo Removing useless packages... (THIS WILL TAKE A WHILE, BE PATIENT.)
cls
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
Echo Removing useless packages... (THIS WILL TAKE A WHILE, BE PATIENT.)
cls
PowerShell -Command "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
Echo Removing useless packages... (THIS WILL TAKE A WHILE, BE PATIENT.)
cls
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
Echo Removing useless packages... (THIS WILL TAKE A WHILE, BE PATIENT.)
cls
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Paint3D* | Remove-AppxPackage"
cls
echo Deleting background UWP tasks in Registry...
timeout 2 >nul /nobreak
reg delete HKCR\Extensions\ContractId\Windows.AppService\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.BingWeather_4.25.20211.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.GetHelp_10.1706.13331.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Getstarted_8.2.22942.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MicrosoftEdge_44.19041.423.0_neutral__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MicrosoftOfficeHub_18.1903.1152.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MixedReality.Portal_2000.19081.1301.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Office.OneNote_16001.12026.20112.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.People_10.1902.633.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsAlarms_10.1906.2182.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsFeedbackHub_1.1907.3152.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsMaps_5.1906.1972.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Xbox.TCUI_1.23.28002.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.19041.423.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameOverlay_1.46.11001.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGamingOverlay_2.34.28001.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxSpeechToTextOverlay_1.17.29001.0_x64__8wekyb3d8bbwe /f
cls

:: Disable Smart Screen
cls
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f

:RemoveUWPChoice
cls
color cf
echo This Next Script Will Remove Basically Every UWP App If You're running the script with Nsudo. YOU RUN THIS AT YOUR OWN RISK.
timeout 5 >nul /nobreak
echo THIS SCRIPT WILL BREAK WINDOWS SEARCH, SO OPENSHELL WILL BE INSTALLED IF IT'S NOT ALREADY INSTALLED. 
echo This Will Also Completely Break The start menu So you won't be able to use it. You will have to use openshell.
timeout 3 >nul /nobreak
set /p confirmchoice=[44;97mDo You Want To Run This Script? (Y/N)[1m:
if %confirmchoice% == Y goto removeuwp
if %confirmchoice% == y goto removeuwp
if %confirmchoice% == n goto wucache
if %confirmchoice% == N goto wucache
echo Please Enter A Valid Response.
timeout 3 >nul /nobreak & goto RemoveUWPChoice

:removeuwp
TAKEOWN /F "C:\Program Files\WindowsApps"
TAKEOWN /F "C:\ProgramData\Packages"
TAKEOWN /F "%LOCALAPPDATA%\Microsoft\WindowsApps"
TAKEOWN /F "C:\Windows\SystemApps"
TAKEOWN /F "%LOCALAPPDATA%\Packages
RD /S /Q "C:\Program Files\WindowsApps"
RD /S /Q "C:\ProgramData\Packages"
RD /S /W "C:\Windows\SystemApps"
cd "C:\Program Files"
mkdir WindowsApps
Powershell -Command "get-appxpackage *store* |remove-appxpackage"
Powershell -Command "Get-AppxPackage *windowsstore*|Remove-AppxPackage"
sc stop WSearch
sc delete WSearch

:: Credits to zusier for removing search & start menu
icacls "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy" /t /c /q /grant administrators:F  
takeown /F C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy /R /D Y  
taskkill /F /IM StartMenuExperienceHost*  >nul 2>nul
rmdir /S /Q C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy
icacls "C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy" /T /C /Q /grant administrators:F  >nul 2>nul
takeown /F C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy /R /D Y  >nul 2>nul
taskkill /F /IM SearchApp*  >nul 2>nul
rmdir /S /Q C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy  >nul 2>nul
taskkill /F /IM SearchApp*  >nul 2>nul
rmdir /S /Q C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy  >nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
reg delete HKCR\Extensions\ContractId\Windows.Search\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.ComponentUI\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.ComponentUI\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.AppService\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.AppService\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.BingWeather_4.25.20211.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.GetHelp_10.1706.13331.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Getstarted_8.2.22942.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MicrosoftEdge_44.19041.423.0_neutral__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MicrosoftOfficeHub_18.1903.1152.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MixedReality.Portal_2000.19081.1301.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MSPaint_6.1907.29027.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Office.OneNote_16001.12026.20112.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.People_10.1902.633.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsAlarms_10.1906.2182.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsCamera_2018.826.98.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsFeedbackHub_1.1907.3152.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsCalculator_10.1906.55.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsMaps_5.1906.1972.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsStore_11910.1002.5.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Xbox.TCUI_1.23.28002.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.19041.423.0_neutral_neutral_cw5n1h2txyewy /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameOverlay_1.46.11001.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGamingOverlay_2.34.28001.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxSpeechToTextOverlay_1.17.29001.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.ZuneMusic_10.19071.19011.0_x64__8wekyb3d8bbwe /f
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.ZuneVideo_10.19071.19011.0_x64__8wekyb3d8bbwe /f
timeout 2 >nul /nobreak
if exist "C:\Program Files\Open-Shell"  goto openshelldetected
if not exist "C:\Program Files\Open-Shell" goto openshellnotdetected
timeout 6 >nul /nobreak 
cd C:\Users\%username%\Downloads\
timeout 3 >nul /nobreak
timeout 2 >nul /nobreak & goto wucache


:openshellnotdetected
cls
color f1
echo Detected that Open-Shell is not installed! Installing Open-Shell...
timeout 3 >nul /nobreak
choco install open-shell -y
cd C:\Users\%username%\Downloads\
timeout 8 >nul /nobreak

:openshelldetected
cls
color f1
echo Detected that Open-Shell is installed! Skipping Open-Shell install...
timeout 3 >nul /nobreak
goto wucache

:wucache
:: Del WU Cache
net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution

:: Del Auto Updates / Break Functionality
taskkill -F -FI "IMAGENAME eq SystemSettings.exe"
net stop wuauserv
net stop UsoSvc
sc stop wuauserv
sc config wuauserv start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
gpupdate /force
rd s q "C:\Windows\SoftwareDistribution"
md "C:\Windows\SoftwareDistribution"

:memcompress
color f0
SET /P decision=[44;97mDisable Memory Compression? (I recommend disabling this. Doesn't matter if you're on an HDD or SSD.) (Y/N)[1m  
IF %decision% == y goto disablememcmp
if %decision% == Y goto disablememcmp
if %decision% == N goto HDD 
if %decision% == n goto HDD 
echo Please Enter A Valid Response.
timeout 3 >nul /nobreak & goto memcompress

:disablememcmp
cls
color f1
echo [44;97m Disabling Memory Compression...:[1m 
timeout 2 >nul /nobreak
powershell Disable-MMAgent -mc

:HDD 
cls
color f1
set /p tweakhdd=[44;97mTweak HDD? (ONLY RUN THIS IF YOU'RE ON AN HDD.) Press N to skip this and tweak SSD instead. (Y/N)[1m
if %tweakhdd% == y goto hdddisablelastaccess
if %tweakhdd% == Y goto hdddisablelastaccess
if %tweakhdd% == n goto ssddisablelastaccess
if %tweakhdd% == N goto ssddisablelastaccess
echo Please Enter A Valid Response.
timeout 3 >nul /nobreak & goto HDD

:hdddisablelastaccess
color f1
fsutil behavior set disableLastAccess 1
fsutil behavior set disable8dot3 1

:ssddisablelastaccess
cls
color f1
set /p tweakssd=[44;97mTweak SSD? (ONLY RUN THIS IF YOU'RE ON AN SSD.) (Y/N)[1m
if %tweakssd% == y goto ssddisablelastaccess2
if %tweakssd% == Y goto ssddisablelastaccess2
if %tweakssd% == n goto temp
if %tweakssd% == N goto temp
echo Please Enter A Valid Response.
timeout 3 >nul /nobreak & goto ssddisablelastaccess

:ssddisablelastaccess2
cls
color f1
fsutil behavior set disableLastAccess 0
fsutil behavior set disable8dot3 1

:temp
cls
color f1
echo Clearing Temp Etc.
timeout 2 >nul /nobreak
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
cls
sc stop wuauserv
sc config wuauserv start=disabled

:: FPS Tweaks. Applied some tweaks again just incase they didn't apply before.
cls
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "ValueMax" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ValueMax" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "1298" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NTFSDisable8dot3NameCreation" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NTFSDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "ContigFileAllocSize" /t REG_DWORD /d "64" /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "5000" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "4000" /f
reg add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_SZ /d "150000" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsAll" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "GameFluidity" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGames" /t REG_DWORD /d "16" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGamesAll" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Priority" /t REG_DWORD /d "2" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "CPUPriority" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "FastDRAM" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "PCIConcur" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "AGPConcur" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "2000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AlwaysUnloadDLL" /v "Default" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
cls

:notif
cls
color f1
set /p notifchoice=Do you want to disable notification services? (Y/N)
if %notifchoice% == y goto disablenotif
if %notifchoice% == Y goto disablenotif
if %notifchoice% == n goto btchoice
if %notifchoice% == N goto btchoice
echo Please Enter A Valid Response.
timeout 3 >nul /nobreak & goto notif

:disablenotif
cls
color f1
sc config WpnService start=disabled
sc stop WpnService 
sc delete WpnService
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t REG_DWORD /d "1" /f

:btchoice
cls 
color f1
set /p btchoice=Do you want to disable bluetooth support? (Y/N)
if %btchoice% == y goto disablebt
if %btchoice% == Y goto disablebt
if %btchoice% == n goto delivoptimisation
if %btchoice% == N goto delivoptimisation
echo Please Enter A Valid Response.
timeout 3 >nul /nobreak & goto btchoice


:svcdisable
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CredentialEnrollmentManagerUserSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CaptureService" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 4 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DusmSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Eaphost" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EFS" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\embeddedmode" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MessagingService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BDESVC" /v "Start" /t REG_DWORD /d "4" /f

:: WU Tweaks
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "1" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontSearchWindowsUpdate" /t REG_DWORD /d "1" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DriverUpdateWizardWuSearchEnabled" /t REG_DWORD /d "0" /f 
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "1" /f >nul
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\UsoSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f

:onedrive
cls
color f1
set /p odchoice=Do you want to uninstall onedrive? (Y/N)
if %odchoice% == y goto disableonedrive
if %odchoice% == Y goto disableonedrive
if %odchoice% == N goto WIP
if %odchoice% == n goto WIP
echo Please Enter A Valid Response.
timeout 3 >nul /nobreak & goto onedrive

:disableonedrive
cls
color f1
echo Uninstalling One Drive. This may take a while. Be patient.
timeout 2 >nul /nobreak
taskkill /f /im OneDrive.exe >nul
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
%SystemRoot%\System32\OneDriveSetup.exe /uninstall


:WIP
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d "0.0.0.0" /f

:: Block Nvidia Driver Searching
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 00000000 /f 

:: Network Optimisations (Credit to everythingtech for the powershell commands.)
netsh int tcp set supplemental Internet congestionprovider=ctcp 
netsh int tcp set heuristics disabled 
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched /v TimerResolution /t REG_DWORD /d 1 /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 10 /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f 
powershell -Command "Disable-NetAdapterLso -Name *" > nul
powershell -Command "Set-NetOffloadGlobalSetting -PacketCoalescingFilter disabled" > nul
powershell -Command "Disable-NetAdapterChecksumOffload -Name * -IpIPv4 -TcpIPv4 -TcpIPv6 -UdpIPv4 -UdpIPv6" > nul

:: Disable spectre and meltdown
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f 

:schtasks
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\Scheduled" /disable
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /Change /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable

:: Set SvcHostTH
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "%ram%" /f

:: Disable NA (QoS Packet Sched)
powershell -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_pacer"

:WifiDChoice
cls
color f1
set /p WifiDChoice=Do you want to disable wifi? (Y/N)
if %WifiDChoice% == y goto DWifi
if %WifiDChoice% == Y goto DWifi
if %WifiDChoice% == n goto Xboxpckg
if %WifiDChoice% == N goto Xboxpckg

:DWifi
cls
color f1
echo Disabling Wifi.
sc stop NlaSvc
sc config NlaSvc start=disabled
sc stop WlanSvc
sc config WlanSvc start=disabled
sc stop vwififlt 
sc config vwififlt start=disabled
cls
timeout 2 >nul /nobreak
echo Disabled Wifi!
timeout 2 >nul /nobreak

:Xboxpckg
cls
color f1
set /p xboxpckgchoice=Do You Want To Remove All Xbox Packages? (Y/N)
if %xboxpckgchoice% == y goto removexboxpckg
if %xboxpckgchoice% == Y goto removexboxpckg
if %xboxpckgchoice% == n goto rmt
if %xboxpckgchoice% == N goto rmt

:removexboxpckg
cls
color f1
echo Removing Xbox Packages... Please Wait (Credits To Zusier For This.)
cd C:\Windows\SystemApps
timeout 3 >nul /nobreak
icacls "C:\Windows\SystemApps\Microsoft.XboxGameCallableUI_cw5n1h2txyewy" /t /c /q /grant administrators:F  
takeown /F C:\Windows\SystemApps\Microsoft.XboxGameCallableUI_cw5n1h2txyewy /R /D Y  
rmdir /S /Q C:\Windows\SystemApps\Microsoft.XboxGameCallableUI_cw5n1h2txyewy 
icacls "C:\Windows\SystemApps\Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe" /t /c /q /grant administrators:F
takeown /F C:\Windows\SystemApps\Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe /R /D Y
rmdir /S /Q C:\Windows\SystemApps\Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe

:rmt
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /f

:powerplan
cls
if exist "C:\Users\%username%\Downloads\ShDWPowerPlan.pow" ( del "C:\Users\%username%\Downloads\ShDWPowerPlan.pow" )
color 3f
set /p powerplanchoice=Import The ShDW Powerplan? (Y/N)
if %powerplanchoice% == y goto importpowerplan
if %powerplanchoice% == Y goto importpowerplan
if %powerplanchoice% == n goto skiplol123
if %powerplanchoice% == N goto skiplol123
echo Please Enter A Valid Response! & goto powerplan

:importpowerplan
cls
echo Installing The ShDW Powerplan
timeout 2 >nul /nobreak
start https://cdn.discordapp.com/attachments/862892845542277190/866128969773219850/ShDWPowerPlan.pow
timeout 2 >nul /nobreak
cls
echo Installed .pow
timeout 2 >nul /nobreak
echo Importing Power Plan! Please Wait.
cd C:\Users\%username%\Downloads
powercfg -import "C:\Users\%username%\Downloads\ShDWPowerPlan.pow 
timeout 2 >nul /nobreak
cls
echo Succesfully Imported Power Plan.
timeout 2 >nul /nobreak

:skiplol123
goto smxy

:smxy
cls
echo Setting Mouse X Y Mouse Curve..
timeout 2 >nul /nobreak
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "000000000000000000a0000000000000004001000000000000800200000000000000050000000000" /f
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "000000000000000066a6020000000000cd4c050000000000a0990a00000000003833150000000000" /f

:: Power throttling
echo Disabling Power Throttling..
timeout 2 >nul /nobreak
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f

:: Disable Biometrics
echo Disabling Biometrics..
timeout 2 >nul /nobreak
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f

:: WER (Windows Error Reporting)
echo WER...
timeout 2 >nul /nobreak
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f

:: Disable RD Through Registry
echo Disabling RD Through Registry...
timeout 2 >nul /nobreak
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\RpcLocator" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\UmRdpService" /v "Start" /t REG_DWORD /d "4" /f

:: Mem
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f 

:powersavingchoice
cls
set /p psc=Do you want to disable power saving? (Y/N)
if %psc% == y goto disablepowersaving
if %psc% == Y goto disablepowersaving
if %psc% == n goto skiplol123456
if %psc% == N goto skiplol123456

:disablepowersaving
cls
echo Disabling Power Saving...
timeout 2 >nul /nobreak
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
cls
echo Successfully Disabled Power Saving!
timeout 2 >nul /nobreak

:skiplol123456
cls

:: Disable Themes Svc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f

:debloatspotifychoice
cls
set /p dspotifychoice=Do you want to debloat spotify? (Y/N)
if %dspotifychoice% == y goto checkifspotifyisinstalled
if %dspotifychoice% == Y goto checkifspotifyisinstalled
if %dspotifychoice% == n goto nvtelemetry2
if %dspotifychoice% == N goto nvtelemetry2

:checkifspotifyisinstalled
cls
color a
echo Checking If Spotify Is Installed...
timeout 2 >nul /nobreak
if exist "%HOMEPATH%\appdata\Roaming\Spotify" goto debloatspotify
if not exist "%HOMEPATH%\appdata\Roaming\Spotify" goto spotifynotdetected

:spotifynotdetected
cls
color a
echo Spotify Not Detected! Skipping Debloat.
timeout 2 >nul /nobreak & goto nvtelemetry2

:debloatspotify
cls
color a
echo Detected That Spotify Is Installed! Debloating... (Credits To Matekoo)
timeout 3 >nul /nobreak
echo Taskkilling Spotify...
taskkill /F Spotify.exe > NUL 2>&1
echo Deleting Spotify Migrator...
timeout 2 >nul /nobreak
del "%HOMEPATH%\appdata\Roaming\Spotify\SpotifyMigrator.exe" /F /Q
echo Deleting Spotify Startup Task...
timeout 2 >nul /nobreak
del "%HOMEPATH%\appdata\Roaming\Spotify\SpotifyStartupTask.exe" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\buddy-list.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\concert.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\concerts.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\lyrics.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\error.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\findfriends.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\show.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\station.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\stations.spa" /F /Q
del "%HOMEPATH%\appdata\Roaming\Spotify\Apps\legacy-lyrics.spa" /F /Q
cls
timeout 2 >nul /nobreak
echo Removing Other Languages...
timeout 2 >nul /nobreak
del "%appdata%\Spotify\locales\am.pak" /F /Q
del "%appdata%\Spotify\locales\ar.mo" /F /Q
del "%appdata%\Spotify\locales\ar.pak" /F /Q
del "%appdata%\Spotify\locales\bg.pak" /F /Q
del "%appdata%\Spotify\locales\bn.pak" /F /Q
del "%appdata%\Spotify\locales\ca.pak" /F /Q
del "%appdata%\Spotify\locales\cs.mo" /F /Q
del "%appdata%\Spotify\locales\cs.pak" /F /Q
del "%appdata%\Spotify\locales\da.pak" /F /Q
del "%appdata%\Spotify\locales\de.mo" /F /Q
del "%appdata%\Spotify\locales\de.pak" /F /Q
del "%appdata%\Spotify\locales\el.mo" /F /Q
del "%appdata%\Spotify\locales\el.pak" /F /Q
del "%appdata%\Spotify\locales\es.mo" /F /Q
del "%appdata%\Spotify\locales\es.pak" /F /Q
del "%appdata%\Spotify\locales\es-419.mo" /F /Q
del "%appdata%\Spotify\locales\es-419.pak" /F /Q
del "%appdata%\Spotify\locales\et.pak" /F /Q
del "%appdata%\Spotify\locales\fa.pak" /F /Q
del "%appdata%\Spotify\locales\fi.mo" /F /Q
del "%appdata%\Spotify\locales\fi.pak" /F /Q
del "%appdata%\Spotify\locales\fil.pak" /F /Q
del "%appdata%\Spotify\locales\fr.mo" /F /Q
del "%appdata%\Spotify\locales\fr.pak" /F /Q
del "%appdata%\Spotify\locales\fr-CA.mo" /F /Q
del "%appdata%\Spotify\locales\gu.pak" /F /Q
del "%appdata%\Spotify\locales\he.mo" /F /Q
del "%appdata%\Spotify\locales\he.pak" /F /Q
del "%appdata%\Spotify\locales\hi.pak" /F /Q
del "%appdata%\Spotify\locales\hr.pak" /F /Q
del "%appdata%\Spotify\locales\hu.mo" /F /Q
del "%appdata%\Spotify\locales\hu.pak" /F /Q
del "%appdata%\Spotify\locales\id.mo" /F /Q
del "%appdata%\Spotify\locales\id.pak" /F /Q
del "%appdata%\Spotify\locales\it.mo" /F /Q
del "%appdata%\Spotify\locales\it.pak" /F /Q
del "%appdata%\Spotify\locales\ja.mo" /F /Q
del "%appdata%\Spotify\locales\ja.pak" /F /Q
del "%appdata%\Spotify\locales\kn.pak" /F /Q
del "%appdata%\Spotify\locales\ko.mo" /F /Q
del "%appdata%\Spotify\locales\ko.pak" /F /Q
del "%appdata%\Spotify\locales\lt.pak" /F /Q
del "%appdata%\Spotify\locales\lv.pak" /F /Q
del "%appdata%\Spotify\locales\ml.pak" /F /Q
del "%appdata%\Spotify\locales\mr.pak" /F /Q
del "%appdata%\Spotify\locales\ms.mo" /F /Q
del "%appdata%\Spotify\locales\ms.pak" /F /Q
del "%appdata%\Spotify\locales\nb.pak" /F /Q
del "%appdata%\Spotify\locales\nl.mo" /F /Q
del "%appdata%\Spotify\locales\nl.pak" /F /Q
del "%appdata%\Spotify\locales\pl.mo" /F /Q
del "%appdata%\Spotify\locales\pl.pak" /F /Q
del "%appdata%\Spotify\locales\pt-BR.mo" /F /Q
del "%appdata%\Spotify\locales\pt-BR.pak" /F /Q
del "%appdata%\Spotify\locales\pt-PT.pak" /F /Q
del "%appdata%\Spotify\locales\ro.pak" /F /Q
del "%appdata%\Spotify\locales\ru.mo" /F /Q
del "%appdata%\Spotify\locales\ru.pak" /F /Q
del "%appdata%\Spotify\locales\sk.pak" /F /Q
del "%appdata%\Spotify\locales\sl.pak" /F /Q
del "%appdata%\Spotify\locales\sr.pak" /F /Q
del "%appdata%\Spotify\locales\sv.mo" /F /Q
del "%appdata%\Spotify\locales\sv.pak" /F /Q
del "%appdata%\Spotify\locales\sw.pak" /F /Q
del "%appdata%\Spotify\locales\ta.pak" /F /Q
del "%appdata%\Spotify\locales\te.pak" /F /Q
del "%appdata%\Spotify\locales\th.mo" /F /Q
del "%appdata%\Spotify\locales\th.pak" /F /Q
del "%appdata%\Spotify\locales\tr.mo" /F /Q
del "%appdata%\Spotify\locales\tr.pak" /F /Q
del "%appdata%\Spotify\locales\uk.pak" /F /Q
del "%appdata%\Spotify\locales\vi.mo" /F /Q
del "%appdata%\Spotify\locales\vi.pak" /F /Q
del "%appdata%\Spotify\locales\zh-CN.pak" /F /Q
del "%appdata%\Spotify\locales\zh-Hant.mo" /F /Q
del "%appdata%\Spotify\locales\zh-TW.pak" /F /Q
cls
echo Debloated Spotify Successfully!
timeout 4 >nul /nobreak

:: MS License TLM
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t "REG_DWORD" /d "1" /f

:: Disable Media Player Usage Tracking/reports
cls
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f

:: MMCSS
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "LazyModeTimeout" /t REG_DWORD /d "150000" /f >nul 2>&1

:: Disable Sleep Study
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f >nul 2>&1

:: Large System Cache (may fix microstutters)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

:: Unhide Hidden Folders
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f

:: Cortana
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d 0 /f 

:: Don't Show Feedback Notifications
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f

:: Disable Useless Scheduled Tasks Through Powershell
echo Disabling Useless Tasks Through Powershell.
timeout 1 >nul /nobreak
echo Disabling Useless Tasks Through Powershell..
timeout 1 >nul /nobreak
echo Disabling Useless Tasks Through Powershell...
timeout 2 >nul /nobreak
Powershell -Command "Get-ScheduledTask -TaskName XblGameSaveTask | Disable-ScheduledTask"
Powershell -Command "Get-ScheduledTask -TaskName Consolidator | Disable-ScheduledTask"
Powershell -Command "Get-ScheduledTask -TaskName UsbCeip | Disable-ScheduledTask"
Powershell -Command "Get-ScheduledTask -TaskName DmClient | Disable-ScheduledTask"
Powershell -Command "Get-ScheduledTask -TaskName DmClientOnScenarioDownload | Disable-ScheduledTask"

:scriptfinished
cls
mode con: cols=120 lines=40
title ShDW ^| Made by: jSN#2324 ^& Tare#1326 ^| %version% - %releasestatus%
echo.                   
echo                                                    ^| Made by: Jason, Tare ^|                            
echo.
echo.
echo                                         /$$$$$$  /$$       /$$$$$$$  /$$      /$$
echo                                        / $$__ $$ ^| $$      ^| $$__  $$^| $$  /$ ^| $$
echo                                       ^| $$  \__/ ^| $$$$$$$ ^| $$  \ $$^| $$ /$$$^| $$
echo                                       ^|  $$$$$$  ^| $$__  $$^| $$  ^| $$^| $$/$$ $$ $$
echo                                        \____  $$ ^| $$  \ $$^| $$  ^| $$^| $$$$_  $$$$
echo                                        /$$  \ $$ ^| $$  ^| $$^| $$  ^| $$^| $$$/ \  $$$
echo                                        ^|  $$$$$$/^| $$  ^| $$^| $$$$$$$/^| $$/   \  $$
echo                                         \______/ ^|__/  ^|__/^|_______/ ^|__/     \__/
echo.
echo.
echo This is the end of the script!
timeout 3 >nul /nobreak
cls
timeout 2 >nul /nobreak
color 04
set /p confirmreboot=Do you want to restart your PC to apply the changes? (Y/N):
if %confirmreboot% == Y goto reboot
if %confirmreboot% == y goto reboot
if %confirmreboot% == N goto exitscript
if %confirmreboot% == n goto exitscript

:reboot
cls
color f9
echo ( [ Ok! Rebooting... ] )
timeout 3 >nul /nobreak
shutdown /r /t 3 /c "Rebooting PC, ShDW On Top discord.gg/uX74hnR4Vp"
cls

:exitscript
cls
color 3f
echo [ Ok! Exiting script... ]
timeout 3 >nul /nobreak
exit
@echo off 
mode con: cols=120 lines=30
chcp 65001 >nul
color 1
set version=v1.2
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
color 4
title Dynamite - Maximizing performance  ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.                             
echo                                                 [-] Made by: Tare [-]
echo.
echo                         _____   __     __  _   _              __  __   _____   _______   ______ 
echo                        ^|  __ \  \ \   / / ^| \ ^| ^|     /\     ^|  \/  ^| ^|_   _^| ^|__   __^| ^|  ____^|
echo                        ^| ^|  ^| ^|  \ \_/ /  ^|  \^| ^|    /  \    ^| \  / ^|   ^| ^|      ^| ^|    ^| ^|__   
echo                        ^| ^|  ^| ^|   \   /   ^| ^. ` ^|   / /\ \   ^| ^|\/^| ^|   ^| ^|      ^| ^|    ^|  __^|  
echo                        ^| ^|__^| ^|    ^| ^|    ^| ^|\  ^|  / ____ \  ^| ^|  ^| ^|  _^| ^|_     ^| ^|    ^| ^|____ 
echo                        ^|_____/     ^|_^|    ^|_^| \_^| /_/    \_\ ^|_^|  ^|_^| ^|_____^|    ^|_^|    ^|______^|
echo.
echo.
echo                                             [+] %releasestatus% %version% [+]
echo.
echo                                 [ 1 ] Optimize  [ 2 ] Info  [ 3 ] Discord [ 4 ] Credits
echo.
echo.
echo.
set /p input=%prompt% "> "
    if "%input%"=="1" goto restore
    if "%input%"=="2" goto info
    if "%input%"=="3" goto discord
    if "%input%"=="4" goto credits
echo Please enter a valid number! & goto main

:credits
cls
mode con: cols=120 lines=30
color 4
title Dynamite - Maximizing performance  ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo Credits:
echo -Redwans batch optimizer 
echo -EchoX Script 
echo -BTC
echo -Nani and Flashy Discord
echo -Zusiers script
echo.
echo Press any key to go back to the main menu.
pause >nul
echo Going back to main menu...
timeout 2 >nul /nobreak
goto main

:info
cls
mode con: cols=120 lines=30
color 4
title Dynamite - Maximizing performance  ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo DYNAMITE is a script made for optimising computers. 
echo There is no guaranteed performance boost since every computer acts differently when tweaked.
echo.
echo If you're skeptical about this being unsafe you can always view the code.
echo To view the code right click the .bat file and click EDIT, you will se the source code.
echo.
echo DYNAMITE is provided "AS IS" without any warranty. In no event will the Developer be liable for any special,incidental,consequential or indirect damages due to loss of data or any other reason. 
echo This script was made to increase performance, not to decrease it.. We ARE NOT RESPONSIBLE FOR ANY DAMAGE YOU CAUSE.
echo.
echo.
echo Press any key to go back to the main menu.
pause >nul
echo.
echo Going back to main menu...
timeout 2 >nul /nobreak
goto main

:discord
cls
mode con: cols=120 lines=30
color 4
title Dynamite - Maximizing performance  ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.                             
echo                                                  [-] Made by: Tare [-]
echo.
echo                           _____   __     __  _   _              __  __   _____   _______   ______ 
echo                          ^|  __ \  \ \   / / ^| \ ^| ^|     /\     ^|  \/  ^| ^|_   _^| ^|__   __^| ^|  ____^|
echo                          ^| ^|  ^| ^|  \ \_/ /  ^|  \^| ^|    /  \    ^| \  / ^|   ^| ^|      ^| ^|    ^| ^|__   
echo                          ^| ^|  ^| ^|   \   /   ^| ^. ` ^|   / /\ \   ^| ^|\/^| ^|   ^| ^|      ^| ^|    ^|  __^|  
echo                          ^| ^|__^| ^|    ^| ^|    ^| ^|\  ^|  / ____ \  ^| ^|  ^| ^|  _^| ^|_     ^| ^|    ^| ^|____ 
echo                          ^|_____/     ^|_^|    ^|_^| \_^| /_/    \_\ ^|_^|  ^|_^| ^|_____^|    ^|_^|    ^|______^|
echo.
echo.
echo.
echo Joining Tare's Tweaking Community...
timeout 2 >nul /nobreak
start /max https://discord.gg/sjbXarvddK
timeout 2 >nul /nobreak
echo Going back to main menu...
timeout 3 >nul /nobreak
goto main

:restore
cls
mode con: cols=120 lines=30
color 4
title Dynamite - Maximizing performance  ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.                             
echo                           _____   __     __  _   _              __  __   _____   _______   ______ 
echo                          ^|  __ \  \ \   / / ^| \ ^| ^|     /\     ^|  \/  ^| ^|_   _^| ^|__   __^| ^|  ____^|
echo                          ^| ^|  ^| ^|  \ \_/ /  ^|  \^| ^|    /  \    ^| \  / ^|   ^| ^|      ^| ^|    ^| ^|__   
echo                          ^| ^|  ^| ^|   \   /   ^| ^. ` ^|   / /\ \   ^| ^|\/^| ^|   ^| ^|      ^| ^|    ^|  __^|  
echo                          ^| ^|__^| ^|    ^| ^|    ^| ^|\  ^|  / ____ \  ^| ^|  ^| ^|  _^| ^|_     ^| ^|    ^| ^|____ 
echo                          ^|_____/     ^|_^|    ^|_^| \_^| /_/    \_\ ^|_^|  ^|_^| ^|_____^|    ^|_^|    ^|______^|
echo.
echo READ "INFORMATION" [2] BEFORE RUNNING OPTIMISATIONS.
echo.
echo.
set /p input=%prompt% "Would you like to create a Restore Point and a Registry backup? (Y/N): "
    if "%input%"=="Y" goto restore1
	if "%input%"=="y" goto restore1
    if "%input%"=="n" goto tweaks
	if "%input%"=="N" goto tweaks
echo Please enter a valid number! & goto restore

:restore1
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

:restore2
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f >nul
echo Creating a restore point... 
timeout 2 >nul /nobreak
@powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Before DYNAMITE' -RestorePointType 'MODIFY_SETTINGS'"
set SR_STATUS=%ERRORLEVEL%
IF %SR_STATUS%==0 color 2f & echo System Restore point made succesfully!
timeout 3 >nul /nobreak
cls
IF NOT %SR_STATUS%==0 color f1 & echo Failed to create a restore point, please make sure you have enabled protection in System Restore.
timeout 3 >nul /nobreak
goto tweaks

:tweaks

echo Optimising your System, please wait.

:: Installing Chocolatey to install Devmanview...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"  >nul 2>&1
choco install devmanview -y >nul 2>&1
devmanview /disable "System Speaker" >nul 2>&1
devmanview /disable "System Timer" >nul 2>&1
devmanview /disable "WAN Miniport (IKEv2)" >nul 2>&1
devmanview /disable "WAN Miniport (IP)" >nul 2>&1
devmanview /disable "WAN Miniport (IPv6)" >nul 2>&1
devmanview /disable "WAN Miniport (L2TP)" >nul 2>&1
devmanview /disable "WAN Miniport (Network Monitor)" >nul 2>&1
devmanview /disable "WAN Miniport (PPPOE)" >nul 2>&1
devmanview /disable "WAN Miniport (PPTP)" >nul 2>&1
devmanview /disable "WAN Miniport (SSTP)" >nul 2>&1
devmanview /disable "UMBus Root Bus Enumerator" >nul 2>&1
devmanview /disable "Microsoft System Management BIOS Driver" >nul 2>&1
devmanview /disable "Programmable Interrupt Controller" >nul 2>&1
devmanview /disable "High Precision Event Timer" >nul 2>&1
devmanview /disable "PCI Encryption/Decryption Controller" >nul 2>&1
devmanview /disable "AMD PSP" >nul 2>&1
devmanview /disable "Intel SMBus" >nul 2>&1
devmanview /disable "Intel Management Engin >nul 2>&1e"
devmanview /disable "PCI Memory Controller" >nul 2>&1
devmanview /disable "PCI standard RAM Controller" >nul 2>&1
devmanview /disable "Composite Bus Enumerator" >nul 2>&1
devmanview /disable "Microsoft Kernel Debug Network Adapter" >nul 2>&1
devmanview /disable "SM Bus Controller" >nul 2>&1
devmanview /disable "NDIS Virtual Network Adapter Enumerator" >nul 2>&1
devmanview /disable "Microsoft Virtual Drive Enumerator" >nul 2>&1
devmanview /disable "Numeric Data Processor" >nul 2>&1
devmanview /disable "Microsoft RRAS Root Enumerator" >nul 2>&1

::removing apps
Powershell -Command "Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *alarms* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *calculator* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *camera* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *communications* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *maps* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage people | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *soundrecorder* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.WindowsMaps* | Remove-AppXPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *yourphone* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage" >nul 2>&1

::Disable SEHOP
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t Reg_DWORD /d "1" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t Reg_DWORD /d "0" /f  >nul 2>&1

::Disable ASLR
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t Reg_DWORD /d "0" /f  >nul 2>&1 

::Disable Spectre And Meltdown
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t Reg_DWORD /d "3" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t Reg_DWORD /d "3" /f  >nul 2>&1

::Disable CFG Lock
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t Reg_DWORD /d "0" /f  >nul 2>&1

:: Disable NTFS/ReFS and FS Mitigations
Reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t Reg_DWORD /d "0" /f  >nul 2>&1

::Reliable Timestamp
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t Reg_DWORD /d "1" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "IoPriority" /t Reg_DWORD /d "3" /f  >nul 2>&1

::Enable Hardware Accelerated Scheduling
Reg add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t Reg_DWORD /d "2" /f  >nul 2>&1

::System responsiveness + Network throttling
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t Reg_DWORD /d "10" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t Reg_DWORD /d "20" /f  >nul 2>&1

::Wallpaper quality 100%
Reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t Reg_DWORD /d "100" /f  >nul 2>&1

::Speedup Startup
Reg add "HKEY_CURRENT_USER\AppEvents\Schemes" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimeout" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t Reg_DWORD /d "0" /f  >nul 2>&1

::Background Apps
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t Reg_DWORD /d "1" /f  >nul 2>&1
Reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t Reg_DWORD /d "2" /f  >nul 2>&1

::Optimize NTFS
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NTFSDisable8dot3NameCreation" /t Reg_DWORD /d "1" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NTFSDisableLastAccessUpdate" /t Reg_DWORD /d "1" /f  >nul 2>&1

::Disk Optimizations
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Superfetch" /v "StartedComponents" /t Reg_DWORD /d "513347" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Superfetch" /v "AdminDisable" /t Reg_DWORD /d "8704" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Superfetch" /v "AdminEnable" /t Reg_DWORD /d "0" /f  >nul 2>&1

::Disable Prefetch
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t Reg_DWORD /d "0" /f  >nul 2>&1

::Animations
if "%Animations%" equ "0x0" (
Reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /f >nul 2>&1
Reg delete "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /f >nul 2>&1
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "1" /f  >nul 2>&1
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "1" /f  >nul 2>&1
Reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9e3e078012000000" /f  >nul 2>&1

)
if "%Animations%" equ "0x1" (
Reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f  >nul 2>&1
Reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_DWORD /d "0" /f  >nul 2>&1
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f  >nul 2>&1
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f  >nul 2>&1
Reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f  >nul 2>&1
)

::Disable FTH
Reg add "HKLM\Software\Microsoft\FTH\State" /f  >nul 2>&1
Reg delete "HKLM\Software\Microsoft\FTH\State" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t Reg_DWORD /d "0" /f  >nul 2>&1

::MMCSS
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\MMCSS" /v "Start" /t Reg_DWORD /d "4" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t Reg_DWORD /d "1" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "LazyModeTimeout" /t Reg_DWORD /d "10000" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t Reg_SZ /d "False" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t Reg_DWORD /d "10000" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t Reg_DWORD /d "18" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t Reg_DWORD /d "6" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t Reg_SZ /d "High" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t Reg_SZ /d "High" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t Reg_SZ /d "True" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "NoLazyMode" /t Reg_DWORD /d "1" /f  >nul 2>&1

::Priority
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Affinity" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t Reg_SZ /d "True" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "BackgroundPriority" /t Reg_DWORD /d "24" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t Reg_DWORD /d "10000" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t Reg_DWORD /d "18" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Priority" /t Reg_DWORD /d "8" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t Reg_SZ /d "High" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t Reg_SZ /d "High" /f  >nul 2>&1
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Latency Sensitive" /t Reg_SZ /d "True" /f  >nul 2>&1

set /p input=%prompt% "Type 1 for Nvidia GPU & 2 for AMD gpu > "
    if "%input%"=="1" goto nvidia
    if "%input%"=="2" goto amd

:nvidia
::Enable GameMode
Reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t Reg_DWORD /d "1" /f  >nul 2>&1
Reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t Reg_DWORD /d "1" /f  >nul 2>&1

::Opt out of nvidia telemtry 
reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f  >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d 0 /f  >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d 0 /f  >nul 2>&1
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d 0 /f  >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f  >nul 2>&1

::Disable GpuEnergyDrv
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t Reg_DWORD /d "4" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t Reg_DWORD /d "4" /f  >nul 2>&1

::Nvidia Reg
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TCCSupported" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak\Devices\509901423-0\Color" /v "NvCplUseColorCorrection" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t Reg_DWORD /d "1" /f  >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t Reg_DWORD /d "0" /f  >nul 2>&1

::Disable Preemption
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t Reg_DWORD /d "0" /f  >nul 2>&1

:amd
::Disable Gamemode
Reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t Reg_DWORD /d "0" /f >nul
Reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t Reg_DWORD /d "0" /f >nul

::AMD Reg Keys
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableeRecord" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_SDIEnable" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAspmSWL1" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ForcePcieLinkSpeed" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_GameManagerSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_10BitMode" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL1SS" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSamuBypassMode" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableLBPWSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablePllOffInL1" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablePPSMSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableSpreadSpectrum" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_AllowTDRAfterECC" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DVRSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableDceVmSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableEDIDManagementSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableEventLog" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableHWSHighPriorityQueue" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableSDMAPaging" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableSVMSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FramePacingSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_UseBestGPUPowerOption" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MobileServerEnabled" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalDisableHDCP" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalEnableHDMI20" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalForceAbmEnable" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalForceMaxDisplayClock" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalOptimizeEdpLinkRate" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalPSRFeatureEnable" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAspmL0s" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAspmL1" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePllOffInL1" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSamuClockGating" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSamuLightSleep" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableGPUVirtualizationFeature" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_BlockchainSupport" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_ChillEnabled" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableGDIAcceleration" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_IoMmuGpuIsolation" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableSeamlessBoot" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_IsGamingDriver" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_RadeonBoostEnabled" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_CCCNextEnabled" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DisableAutoWattman" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DisableLightSleep" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "3D_Refresh_Rate_Override_DEF" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "3to2Pulldown_NA" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Adaptive De-interlacing" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t Reg_SZ /d "false" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSkins" /t Reg_SZ /d "false" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSubscription" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t Reg_SZ /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AreaAniso_NA" /t Reg_SZ /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t Reg_SZ /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AutoColorDepthReduction_NA" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSAMUPowerGating" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableUVDPowerGatingDynamic" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableVCEPowerGating" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL0s" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL1" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t Reg_SZ /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FRTEnabled" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableComputePreemption" /t Reg_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t Reg_SZ /d "1" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t Reg_BINARY /d "3100" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FlipQueueSize" /t Reg_BINARY /d "3100" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t Reg_BINARY /d "3200" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION" /t Reg_BINARY /d "3200" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation" /t Reg_BINARY /d "3100" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "VSyncControl" /t Reg_BINARY /d "3000" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TFQ" /t Reg_BINARY /d "3200" /f >nul 2>&1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t Reg_BINARY /d "0100000001000000" /f >nul 2>&1

::BCD EDIT
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

::System energy saving
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1

::Large System Cache (may fix microstutters)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disabling mitigations
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

:: Scheduled tasks
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

:: Accounts Tab ( Disable Syncing )
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Personalization Tab ( Disable Transparency )
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f >nul 2>&1

:: Enable Hardware Accelerated GPU Scheduling (Windows 10 2004 + NVIDIA 10 Series Above + AMD 5000 and Above)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1

:: Disable Variable Refresh Rate
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=0;" /f >nul 2>&1

:: General Tab
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Inking & Typing Personalization Tab
reg "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f >nul 2>&1
reg "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f >nul 2>&1
reg "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f >nul 2>&1
reg "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f >nul 2>&1

:: Diagnostics & Feedback Tab
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v "EnableEventTranscript" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f >nul 2>&1
reg del "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /f >nul 2>&1

:: Activity History Tab
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Notifications - Location - App Diagnostics - Account Info Access
sc stop "WpnService" >nul 2>&1
sc config "WpnService" start=disabled >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1

:: Disable Background apps
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f >nul 2>&1

:: Balloon Tips
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f >nul 2>&1

:: disabling telemetry
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

:: Disable Mouse accel
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d "0" /f  >nul 2>&1

:: Lowest keyboard delay
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d "0" /f  >nul 2>&1

:: Data queue size 20 for keyboard ^&^ Mouse
reg add "HKLM\SYSTEM\CurrentControlSet\services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f  >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "20" /f  >nul 2>&1

::CSRSS Realtime Priority, lower input latency.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t Reg_DWORD /d "4" /f  >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t Reg_DWORD /d "3" /f  >nul 2>&1

:: Disable Mouse smoothing
reg add "HKU\!USER_SID!\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "0000000000000000c0cc0c0000000000809919000000000040662600000000000033330000000000" /f >nul 2>&1
reg add "HKU\!USER_SID!\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000a800000000000000e00000000000" /f >nul 2>&1

:: Don't Show Feedback Notifications
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f >nul 2>&1

:: MS License TLM
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t "REG_DWORD" /d "1" /f >nul 2>&1

:: Disable Media Player Usage Tracking/reports
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f >nul 2>&1

:: Webcam telemetry
schtasks /change /TN "Microsoft\Windows\Device Information\Device" /DISABLE >nul 2>&1

:finish
cls
mode con: cols=120 lines=30
color 3
title Dynamite - Maximizing performance  ^| Made by: Tare#1326 ^| %version% - %releasestatus%
echo.                             
echo                           _____   __     __  _   _              __  __   _____   _______   ______ 
echo                          ^|  __ \  \ \   / / ^| \ ^| ^|     /\     ^|  \/  ^| ^|_   _^| ^|__   __^| ^|  ____^|
echo                          ^| ^|  ^| ^|  \ \_/ /  ^|  \^| ^|    /  \    ^| \  / ^|   ^| ^|      ^| ^|    ^| ^|__   
echo                          ^| ^|  ^| ^|   \   /   ^| ^. ` ^|   / /\ \   ^| ^|\/^| ^|   ^| ^|      ^| ^|    ^|  __^|  
echo                          ^| ^|__^| ^|    ^| ^|    ^| ^|\  ^|  / ____ \  ^| ^|  ^| ^|  _^| ^|_     ^| ^|    ^| ^|____ 
echo                          ^|_____/     ^|_^|    ^|_^| \_^| /_/    \_\ ^|_^|  ^|_^| ^|_____^|    ^|_^|    ^|______^|
echo.
echo.
echo.
echo The tweaks have been set. Restart your PC to apply the tweaks.
echo Exiting in 10 seconds...
timeout 10 >nul /nobreak & exit 
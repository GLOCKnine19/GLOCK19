��
O OFF
@ECHO ON
@echo off 
mode con: cols=120 lines=30
chcp 65001 >nul
color 1
set version=0.1
set releasestatus=Official Release
SETLOCAL EnableDelayedExpansion

:: Checking For Admin Rights
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
:: delete script after getting admin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
color 4
goto mainscreen

:mainscreen
:Warning Message
SET msgboxTitle=Warning!
SET msgboxBody=Please create a System Restore point and registry backup before starting!
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"

cls
echo               ESPORT OPTIMIZER V0.0.0.0.0.1
echo              Press Enter to run the Optimizer
echo        (Please wait until the progrmam automatically closes)
set /p MenuItem=[97m

color a
:Disable Hibernation
title Disabling Hibernation
powercfg -h off
:Disable Automatic Maintenance
title Disabling Automatic Maintenance [...]
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v MaintenanceDisabled /t Reg_DWORD /d 1 /f
:Powerplan
title Importing Power Plan [...]
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/907738910573101116/909513110057000991/PTU_Powerplan.pow" -OutFile "%temp%\esportpowerplan.pow"
powercfg -import "%temp%\esportpowerplan.pow"
:Win32PrioritySeparation
title win32 [...]
title Changing Win32PrioritySeparation [...]
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t Reg_DWORD /d 40 /f
:Nvidia Tweaks
title nvidia tweaks [...]
move "C:\Users\"%USERPROFILE%\Desktop\Unrestricted Clocks\NVSMI" "C:\Program Files\NVIDIA Corporation"
cd C:\Program Files\NVIDIA Corporation\NVSMI
nvidia-smi.exe -acp 0
timeout /t -1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul 2>&1	
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileOffset" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableAutoBoost" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ThreadDpcEnable" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogPeriod" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PerfCalculateActualUtilization" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "AcpiFirmwareWatchDog" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "AmliWatchdogAction" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "AmliWatchdogTimeout" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "WatchdogTimeout" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Throttle" /v "PerfEnablePackageIdle" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "AllowPepPerfStates" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "CPPCEnable" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NvTelemetryContainer" /v "Start" /t REG_DWORul 2>&1
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS /v EnableRID61684 /t REG_DWORD /d 1 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000 /v RMHdcpKeyglobZero /t REG_DWORD /d 1 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0001 /v RMHdcpKeyglobZero /t REG_DWORD /d 1 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm /v EnableBugcheckDisplay /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm /v DisableMshybridNvsrSwitch /t REG_DWORD /d 1 /f
:Enable HAGS
title Enabling Hardware Accelerated Scheduling [...]
Reg.exe add "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t Reg_DWORD /d 2 /f
:Power Throttling
title power throttling [...]
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Processor /v Cstates /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Processor /v Capabilities /t REG_DWORD /d 7e066 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v HighPerformance /t REG_DWORD /d 1 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v HighestPerformance /t REG_DWORD /d 1 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v MinimumThrottlePercent /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v MaximumThrottlePercent /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v MaximumPerformancePercent /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v Class1InitialUnparkCount /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v Class1InitialUnparkCount /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v InitialUnparkCount /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling /v PowerThrottlingOff /t REG_DWORD /d 1 /f
Reg.exe add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy /v fDisablePowerManagement /t REG_DWORD /d 1 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\Default\VetoPolicy /v EA:EnergySaverEngaged /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\28\VetoPolicy /v EA:PowerStateDischarging /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Misc /v DeviceIdlePolicy /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPMinCores /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPMaxCores /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPMinCores1 /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPMaxCores1 /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CpLatencyHintUnpark1 /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPDistribution /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CpLatencyHintUnpark /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v MaxPerformance1 /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v MaxPerformance /t REG_DWORD /d 64 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPDistribution1 /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPHEADROOM /t REG_DWORD /d 0 /f
Reg.exe add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor /v CPCONCURRENCY /t REG_DWORD /d 0 /f
:bcedit
title bcedit [...]
bcdedit /set firstmegabytepolicy UseAll
bcdedit /set avoidlowmemory 0x8000000
bcdedit /set nolowmem Yes
bcdedit /set linearaddress57 OptOut
bcdedit /set increaseuserva 268435328
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes 
bcdedit /set tscsyncpolicy enhanced 
:Disable tracking & temeletry
title telemetry [...]
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLua /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowSharedUserAppData" /v value /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowStore" /v value /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v MaintenanceDisabled /t REG_DWORD /d 00000001 /f
:cortana
title cortana [...]
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

:miscellaneous debloating
title debloating [...]
Powershell -Command "Get-AppxPackage *Photos* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.XboxGamingOverlay* | Remove-AppXPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.WindowsMaps* | Remove-AppXPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.WindowsFeedbackHub* | Remove-AppXPackage"  >nul 2>&1                     
Powershell -Command "Get-AppXPackage *Microsoft.XboxApp* | Remove-AppXPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.WindowsSoundRecorder* | Remove-AppXPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.VP9VideoExtensions* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *AppInstaller* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *3DViewer* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *store* |remove-appxpackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *windowstore*|Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Skype* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.WindowsCamera* | Remove-AppXPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *StickyNotes* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *FeedbackHub* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Paint* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Calculator* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Snip & Sketch* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.GetHelp_10.1706.13331.0_x64__8wekyb3d8bbwe* Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.HEIFImageExtension* | Remove-AppXPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Paint3D* | Remove-AppxPackage" >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Search\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.ComponentUI\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.ComponentUI\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.AppService\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.AppService\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.BackgroundTasks\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.Search_1.14.0.19041_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.ShellExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Launch\PackageId\MicrosoftWindows.UndockedDevKit_10.0.19041.423_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0 /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.BingWeather_4.25.20211.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.GetHelp_10.1706.13331.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Getstarted_8.2.22942.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MicrosoftEdge_44.19041.423.0_neutral__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MicrosoftOfficeHub_18.1903.1152.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MixedReality.Portal_2000.19081.1301.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.MSPaint_6.1907.29027.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Office.OneNote_16001.12026.20112.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.People_10.1902.633.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsAlarms_10.1906.2182.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsCamera_2018.826.98.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsFeedbackHub_1.1907.3152.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsCalculator_10.1906.55.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsMaps_5.1906.1972.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.WindowsStore_11910.1002.5.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.Xbox.TCUI_1.23.28002.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.19041.423.0_neutral_neutral_cw5n1h2txyewy /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameOverlay_1.46.11001.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGamingOverlay_2.34.28001.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxSpeechToTextOverlay_1.17.29001.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.ZuneMusic_10.19071.19011.0_x64__8wekyb3d8bbwe /f >nul 2>&1
reg delete HKCR\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.ZuneVideo_10.19071.19011.0_x64__8wekyb3d8bbwe /f >nul 2>&1
:mouse tweaks
title mouse tweaks [...]
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "000000000000000000a0000000000000004001000000000000800200000000000000050000000000" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "000000000000000066a6020000000000cd4c050000000000a0990a00000000003833150000000000" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "50" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "50" /f >nul 2>&1
:disable FSO
title fullscreen optimization [...]
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_FSEBehaviourMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f >nul 2>&1
:delete annoying security health service
title security health service [...]
taskkill /f /im SecurityHealthSystray.exe >nul 2>&1
takeown /F "C:\Windows\System32\SecurityHealthSystray.exe" >nul 2>&1
icacls "C:\Windows\System32\SecurityHealthSystray.exe" /t /c /q /grant administrators:F >nul 2>&1 
cd C:\Windows\System32 >nul 2>&1
rmdir /s /q SecurityHealthSystray.exe >nul 2>&1
del /s /f /q SecurityHealthSystray.exe >nul 2>&1
taskkill /f /im SecurityHealthSystray.exe >nul 2>&1
takeown /f "C:\Windows\System32\SecurityHealthSystray.exe" /R /D Y >nul 2>&1
icacls "C:\Windows\System32\SecurityHealthSystray.exe" /t /c /q /grant administrators:F >nul 2>&1 
cd C:\Windows\System32 >nul 2>&1
rmdir /s /q SecurityHealthSystray.exe >nul 2>&1
del /s /f /q SecurityHealthSystray.exe >nul 2>&1

:useless services
title debloat [...]
sc stop WSearch >nul
sc config WSearch start=disabled >nul
sc delete wsearch >nul
sc stop SysMain >nul 
sc stop RemoteRegistry >nul
sc config RemoteRegistry start=disabled >nul
sc config SysMain start=disabled >nul
sc stop Themes >nul
sc config Themes start=disabled >nul
sc stop WdiServiceHost >nul
sc config WdiServiceHost start=disabled >nul
sc stop WdiSystemHost >nul
sc config WdiSystemHost start=disabled >nul
sc stop DPS >nul
sc config DPS start=disabled >nul 
sc stop diagsvc >nul
sc config diagsvc start=disabled >nul
sc stop BITS >nul
sc config BITS start=disabled >nul
sc stop LanmanServer >nul
sc config LanmanServer start=disabled >nu
sc stop lmhosts >nul
sc config lmhosts start=disabled >nul
sc start vds >nul
sc config vds start=auto >nul

:network throttling
title network tweaks [...]
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul 2>&1

:network tweaks
title network tweaks [...]
netsh int tcp set global timestamps=enabled
netsh int tcp set heuristics disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global autotuninglevel=disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "00000001" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "00000001" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "23" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d "00000008" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPDelAckTicks" /t REG_DWORD /d "00000001" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "191" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "192" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "214" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "215" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "PriorityBoost" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "00000001" /f
:memory
title memory compression [...]
powershell -Command "Disable-MMAgent -mc" >nul 2>&1

:windows update
title disabling windows update [...]
taskkill -F -FI "IMAGENAME eq SystemSettings.exe" >nul 2>&1
net stop wuauserv >nul 2>&1
net stop UsoSvc >nul 2>&1
sc stop wuauserv >nul 2>&1
sc config wuauserv start=disabled >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DontSearchWindowsUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DriverUpdateWizardWuSearchEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
Reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\UsoSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
rd s q "C:\Windows\SoftwareDistribution" >nul 2>&1
md "C:\Windows\SoftwareDistribution" >nul 2>&1

:drivers
disabling useless drivers [...]
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

:mmcss/duplicate tweaks
title mmcss [...]
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "LazyModeTimeout" /t REG_DWORD /d "150000" /f >nul 2>&1
:more miscelaneous that i am too lazy to document/duplicate tweaks
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableEngine" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul 2>&1
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

:usb power saving credit @TCTWEAKTOOLS
for /f %%a in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "USB\VID_"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" -ot reg -actn setowner -ownr "n:Administrators"
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" -ot reg -actn ace -ace "n:Administrators;p:full"
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 00000000 /f
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v SelectiveSuspendEnabled /t REG_BINARY /d 00 /f
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 00000000 /f
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters" /v AllowIdleIrpInD3 /t REG_DWORD /d 00000000 /f
)
for /f %%a in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\ROOT_HUB"') do (
C:\Windows\SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators"
reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f
)
for /f "tokens=*" %%s in ('reg query "HKLM\System\CurrentControlSet\Enum" /S /F "StorPort" ^| findstr /e "StorPort"') do Reg add "%%s" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f

:question
Echo What kind of diskdrive do you have?
Echo Press "1" for HDD
Echo Press "2" for SSD
SET /P choice= I chose: 
IF /I "%choice%"=="1" GOTO HDD
IF /I "%choice%"=="2" GOTO SSD
cls

:HDD
Echo Applying HDD Tweaks
timeout /t 3
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DisableDeleteNotification" /t REG_DWORD /d "1" /f
cls
Echo HDD Tweaked
timeout /t 3
cls
GOTO :Disk Tweaks

:SSD
cls
Echo Applying SSD Tweaks
timeout /t 3
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DisableDeleteNotification" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f
cls
Echo SSD Tweaked
timeout /t 3
cls
goto Disk Tweaks

:Disk Tweaks
Echo Applying Additional Disk Tweaks
timeout /t 3
fsutil behavior set disabledeletenotify 0 
fsutil behavior set disable8dot3 1
fsutil behavior set disablelastaccess 1
fsutil behavior set encryptpagingfile 0
fsutil behavior set disablecompression 1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f
cls
Echo Additional Disk Tweaks Applied
timeout /t 3
cls

set /p choice="How much RAM do you have?: 
if defined choice (
set /a svc_split_threshold=%choice% * 1024 * 1024
)
cls
Echo Applying SvcHostSplitThreshold
timeout /t 3
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "%svc_split_threshold%" /f
cls
Echo SvcHostSplitThreshold Applied!
timeout /t 3
cls

Echo Applying Memory tweaks
timeout /t 3
fsutil behavior set memoryusage 1
fsutil behavior set mftzone 2
cls
Echo Memory Tweaks Applied!
timeout /t 3
cls

Echo Your disk was successfully tweaked, restart your PC to make the changes work! ;)
timeout /t 3
goto finishscreen

:finishscreen
echo PC is optimized, thank you for using the program.
timeout /t 10
exit






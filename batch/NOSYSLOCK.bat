@echo off
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceNoSysLock" /t reg_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "ForceNoSysLock" /t reg_DWORD /d "0" /f

pause
exit
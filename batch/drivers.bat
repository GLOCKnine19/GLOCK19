@echo off
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumReference" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumReference" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumRamp" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumRamp" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumNullDevice" /t reg_DWORD /d "1" /f
pause
exit
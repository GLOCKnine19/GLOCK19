@echo off
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableMMX" /t reg_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DirectDraw" /v "DisableMMX" /t reg_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableMMX" /t reg_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "DisableMMX" /t reg_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMX Fast Path" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMXFastPath" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "MMXFastPath" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "UseMMXForRGB" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "UseMMXForRGB" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "UseMMXForRGB" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D\Drivers" /v "EnumSeparateMMX" /t reg_DWORD /d "1" /f
pause
exit
@echo off
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FewVertices" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Direct3D" /v "FewVertices" /t reg_DWORD /d "1" /f
pause
exit
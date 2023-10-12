@echo off
TITLE GRAPHIC MONITOR BY F4FIX

echo                                                         [1] For Enable
echo. 
echo. 
echo                                                         [2] For Revert Changes
SET /P choice=SELECT:

IF /I "%choice%"=="1" Goto 1
IF /I "%choice%"=="2" Goto 2
IF /I "%choice%"=="3" Goto 3
:1
sc config GraphicsPerfSvc start= Disabled
net stop GraphicsPerfSvc

:2
sc config GraphicsPerfSvc start= demand
net start GraphicsPerfSvc
cls

pause
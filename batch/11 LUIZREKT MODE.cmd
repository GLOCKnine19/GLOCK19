@echo off
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/798652558351794196/798666504190296064/Hone_Power_Plan.pow" -OutFile "%temp%\Hone_Power_Plan.pow"
powercfg -import "%temp%\Hone_Power_Plan.pow" 44444444-4444-4444-4444-444444444448
powercfg -SETACTIVE "44444444-4444-4444-4444-444444444448"
powercfg /changename 44444444-4444-4444-4444-444444444448 "LUIZREKT MODE" "O melhor plano de energia para reduzir latencia e aumentar FPS."
goto success

:success
SET msgboxTitle=Success
SET msgboxBody=The Power Plan has been imported and activated!
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"






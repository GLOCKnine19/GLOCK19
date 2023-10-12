@echo off
bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set tscyncpolicy enhanced
pause
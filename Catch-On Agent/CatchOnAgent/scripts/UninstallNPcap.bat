@echo off
title Uninstalling
setlocal 

cd "%~dp0..\logs\"

echo Please wait until the setup is finished uninstalling Npcap...
echo/ >> "%~dp0..\logs\CatchOn.log"
echo [%DATE% %TIME%]: Npcap uninstall started >> CatchOn.log

REM Uninstall NPcap
%1 /S /Q

cd "%~dp0..\logs\"
echo/ >> "%~dp0..\logs\CatchOn.log"
echo [%DATE% %TIME%]: Npcap uninstall finished >> CatchOn.log

endlocal



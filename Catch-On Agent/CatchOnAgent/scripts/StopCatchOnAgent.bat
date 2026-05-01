@echo off
title Lightspeed Insight Agent
echo Stopping Lightspeed Insight Agent ...
setlocal

echo/ >> "%~dp0..\logs\CatchOn.log"
cd %~dp0..\files\CatchOnAgent\

echo [%DATE% %TIME%]: Stopping Lightspeed Insight Agent... >> "%~dp0..\logs\CatchOn.log"
echo/ >> "%~dp0..\logs\CatchOn.log"

rem Stop CatchOnAgent service
echo [%DATE% %TIME%]: NET Stop message: >> "%~dp0..\logs\CatchOn.log"
echo/ >> "%~dp0..\logs\CatchOn.log"
net stop CatchOnAgent >> "%~dp0..\logs\CatchOn.log"

rem Uninstall CatchOnAgent service
echo [%DATE% %TIME%]: Uninstalling Lightspeed Insight Agent... >> "%~dp0..\logs\CatchOn.log"
%~1 service remove

endlocal


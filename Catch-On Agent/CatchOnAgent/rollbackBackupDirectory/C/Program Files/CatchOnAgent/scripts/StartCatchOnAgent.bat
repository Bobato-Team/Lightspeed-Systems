@echo off
title Lightspeed Insight Agent
echo Starting Lightspeed Insight Agent ...
setlocal

echo/ >> "%~dp0..\logs\CatchOn.log"
cd %~dp0..\files\CatchOnAgent\

rem Install CatchOnAgent service
echo [%DATE% %TIME%]: Installing Lightspeed Insight Agent... >> "%~dp0..\logs\CatchOn.log"
%~1 service install
ping 127.0.0.1 -n 6 > nul

echo/ >> "%~dp0..\logs\CatchOn.log"
echo [%DATE% %TIME%]: Starting Lightspeed Insight Agent... >> "%~dp0..\logs\CatchOn.log"
echo/ >> "%~dp0..\logs\CatchOn.log"

rem set CatchOnAgent service restart
sc failure CatchOnAgent reset= 0 actions= restart/60000

rem Start CatchOnAgent service
echo [%DATE% %TIME%]: NET Start message: >> "%~dp0..\logs\CatchOn.log"
echo/ >> "%~dp0..\logs\CatchOn.log"
net start CatchOnAgent >> "%~dp0..\logs\CatchOn.log"

rem Get CatchOnAgent service version
%~1 -v >> "%~dp0..\logs\CatchOn.log"

if /I "%~1"=="catchon-agent.exe" set fileToDetele="catchon-agent_32bit.exe"
if /I "%~1"=="catchon-agent_32bit.exe" set fileToDetele="catchon-agent.exe"

del %fileToDetele%

endlocal


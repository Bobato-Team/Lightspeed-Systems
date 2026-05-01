@echo off
setlocal

set FILE_TO_DELETE=%~dp0..\AutoUpdate\autoupdate-windows.exe
set FILE_TO_RENAME=%~dp0..\AutoUpdate\autoupdate-windows-latest.exe

echo Waiting for 10 seconds...
timeout /t 10 /nobreak > nul

if exist "%FILE_TO_DELETE%" (
    echo Deleting "%FILE_TO_DELETE%"...
    del /q "%FILE_TO_DELETE%"
    ren "%FILE_TO_RENAME%" "autoupdate-windows.exe" 
) else (
    echo "%FILE_TO_DELETE%" does not exist.
)

endlocal
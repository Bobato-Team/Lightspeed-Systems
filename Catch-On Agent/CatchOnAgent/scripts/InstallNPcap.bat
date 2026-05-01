@echo off
title Install Npcap
echo Please wait until the setup is finished installing Npcap ...
echo/
setlocal 

echo/ >> "%~dp0..\logs\CatchOn.log"
echo [%DATE% %TIME%]: Npcap install started >> "%~dp0..\logs\CatchOn.log"
echo/ >> "%~dp0..\logs\CatchOn.log"

cd "%~dp0..\files\Npcap\"

REM Compute installer Npcap version
for /f %%i in ('powershell -command "(Get-Item '%1').VersionInfo.ProductVersion"') do set installerVersion=%%i

REM Compute installed Npcap version
if "%~2" NEQ "null" (
for /f %%i in ('powershell -command "(Get-Item '%~2').VersionInfo.ProductVersion"') do set installedVersion=%%i
) else (
set installedVersion=0
)

REM Install Npcap only if current version is not found
if %installerVersion% NEQ %installedVersion% (
    %1 /S /npf_startup=yes /loopback_support=no /dlt_null=no /admin_only=yes /dot11_support=yes /vlan_support=yes /winpcap_mode=yes

	REM /npf_startup=yes: 		Automatically start the Npcap driver at boot time
	REM /loopback_support=no:   Support loopback traffic (“Npcap Loopback Adapter” will be created)
	REM /dlt_null=no: 			Use DLT_EN10MB (Ethernet) as the “Npcap Loopback Adapter”'s link layer protocol instead of the default DLT_NULL.
	REM /admin_only=yes: 		Restrict Npcap driver's access to Administrators only
	REM /dot11_support=yes: 	Support raw 802.11 traffic (and “Monitor Mode”) for wireless adapters
	REM /vlan_support=yes: 		Support 802.1Q VLAN tag when capturing and sending data
	REM /winpcap_mode=yes:		Install Npcap in WinPcap API-compatible Mode

	IF %errorlevel% == 0 (
		echo Npcap has been successfully installed.
		echo [%DATE% %TIME%]: Npcap has been successfully installed. >> "%~dp0..\logs\CatchOn.log"
	) ELSE (
		echo ERROR: Unexpected error while installing Npcap
		echo [%DATE% %TIME%]: ERROR: Unexpected error while installing Npcap >> "%~dp0..\logs\CatchOn.log"
		goto :EOF
	)

	echo installed > %~dp0..\files\Npcap\InstallNpcap.txt
)
endlocal


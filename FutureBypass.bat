@shift /0
@echo off
title FUTURE MENU - Made by rodyz#3247
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:MENU
title FUTURE MENU - Made by rodyz#3247
@shift /0
chcp 65001
mode 130,30
color 1
echo.
echo.
echo                               ╭━━━╮  ╭╮          ╭━━━╮         ╭━╮
echo                               ┃╭━━╯ ╭╯╰╮         ┃╭━╮┃         ┃╭╯
echo                               ┃╰━━┳╮┣╮╭╋╮╭┳━┳━━╮ ┃╰━━┳━━┳━━┳━━┳╯╰┳━━┳━╮
echo                               ┃╭━━┫┃┃┃┃┃┃┃┃╭┫┃━┫ ╰━━╮┃╭╮┃╭╮┃╭╮┣╮╭┫┃━┫╭╯
echo                               ┃┃  ┃╰╯┃╰┫╰╯┃┃┃┃━┫ ┃╰━╯┃╰╯┃╰╯┃╰╯┃┃┃┃┃━┫┃
echo                               ╰╯  ╰━━┻━┻━━┻╯╰━━╯ ╰━━━┫╭━┻━━┻━━╯╰╯╰━━┻╯
echo                                                      ┃┃
echo                                                      ╰╯
echo.						
echo                                ┏──────────────Cracked by Bom──────────────────────────────┓
echo.
echo.
echo                                       [34m[INFO] [0m- start with administrator 
echo.
echo                                       [34m[1] [0m- Signout Rockstar
echo. 
echo                                       [34m[2] [0m- Enable Bypass
echo.
echo                                       [34m[3] [0m- Disable Bypass
echo.
echo                                       [34m[4] [0m- Unlink Xbox / Discord
echo.
echo.
echo                                           [34m[Status] [0m- [36m[Safe]
echo.
echo                                [34m┗────────────────────────────────────────────┛ [0m
echo.
set /p key=Enter here : 
if %key%==1 goto Rockstar
if %key%==2 goto Enable
if %key%==3 goto Disable
if %key%==4 goto XBOX

:Rockstar
cls
echo.
color 1
echo.
echo.
echo                               ╭━━━╮  ╭╮          ╭━━━╮         ╭━╮
echo                               ┃╭━━╯ ╭╯╰╮         ┃╭━╮┃         ┃╭╯
echo                               ┃╰━━┳╮┣╮╭╋╮╭┳━┳━━╮ ┃╰━━┳━━┳━━┳━━┳╯╰┳━━┳━╮
echo                               ┃╭━━┫┃┃┃┃┃┃┃┃╭┫┃━┫ ╰━━╮┃╭╮┃╭╮┃╭╮┣╮╭┫┃━┫╭╯
echo                               ┃┃  ┃╰╯┃╰┫╰╯┃┃┃┃━┫ ┃╰━╯┃╰╯┃╰╯┃╰╯┃┃┃┃┃━┫┃
echo                               ╰╯  ╰━━┻━┻━━┻╯╰━━╯ ╰━━━┫╭━┻━━┻━━╯╰╯╰━━┻╯
echo                                                      ┃┃
echo                                                      ╰╯
rmdir /s /q %userprofile%\AppData\Roaming\CitizenFX
rmdir /s /q "%LocalAppData%\DigitalEntitlements"
rmdir /s /q "%userprofile%\Documents\Rockstar Games\Social Club\Profiles"
echo.
echo Deleted successfully
goto MENU

:Enable
cls
echo.
color 1
echo. 
echo.
echo Activate Bypass.
echo.
netsh advfirewall firewall add rule name="FiveM2372Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2372_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2372Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2372_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=out new enable=yes > nul

netsh advfirewall firewall add rule name="FiveMSteamBlock" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_SteamChild.exe" > nul
netsh advfirewall firewall add rule name="FiveMSteamBlock" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_SteamChild.exe" > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=out new enable=yes > nul

netsh advfirewall firewall add rule name="FiveMRockstarBlock" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_GTAProcess.exe" > nul
netsh advfirewall firewall add rule name="FiveMRockstarBlock" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_GTAProcess.exe" > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=out new enable=yes > nul

netsh advfirewall firewall add rule name="FiveM2189Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_b2189_GTAProcess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2189Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_b2189_GTAProcess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=out new enable=yes > nul

netsh advfirewall firewall add rule name="FiveM2060Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2060_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2060Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2060_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=out new enable=yes > nul

netsh advfirewall firewall add rule name="FiveM2545Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2545_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2545Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2545_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=out new enable=yes > nul


goto MENU

:Disable
cls
echo.
color 1
echo. 
echo.
echo Deactivate Bypass.
echo.
netsh advfirewall firewall set rule name="FiveM2372Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveM2189Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveM2060Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveM2545Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveMROSServiceBlock" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMROSServiceBlock" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveMChromeBrowser" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMChromeBrowser" dir=out new enable=no > nul

netsh advfirewall firewall set rule name="FiveMROSLauncher" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMROSLauncher" dir=out new enable=no > nul

goto MENU

:XBOX
cls
echo.
color 1
echo. 
echo.
echo Deactivate Bypass.
cls
powershell -Command "& {Get-AppxPackage -AllUsers xbox | Remove-AppxPackage}"
sc stop XblAuthManager
sc stop XblGameSave
sc stop XboxNetApiSvc
sc stop XboxGipSvc
sc delete XblAuthManager
sc delete XblGameSave
sc delete XboxNetApiSvc
sc delete XboxGipSvc
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /f
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /disableL
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
cls
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
rd %userprofile%\AppData\Local\DigitalEntitlements /q /s
cls
del /s /q /f %LocalAppData%\FiveM\FiveM.app\discord.dll > nul
rmdir /s /q " %userprofile%\AppData\Roaming\discord\0.0.309"

stop
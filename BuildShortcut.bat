@echo off
setlocal enabledelayedexpansion

:init
color F0
title BuildShortcut
mode con: cols=80 lines=25

:Ipt-Dstn
cls
set "dstn="
set /p "dstn=Input: "

if not defined dstn (
    set /a failCount+=1

    if !failCount! geq 2 (
        exit
    )
    goto Ipt-Dstn
)

set "dstn=%dstn:"=%"

if not exist "!dstn!" (
    echo.
    echo [Error]
    timeout /t 3 >nul
    goto Ipt-Dstn
)

set "Dft=USER"

:START
cls
echo.
echo ^|BuildShortcut
echo.
echo [!Dft!]
echo [!dstn!]
echo ----------------
echo.

set "failCount=0"

:Ipt-FxFl
set "FxFl="
set /p "FxFl=Input: "

if not defined FxFl (
    set /a failCount+=1

    if !failCount! geq 2 (
        goto Ipt-Dstn
    )
    goto Ipt-FxFl
)

set "FxFl=%FxFl:"=%"

if /i "!FxFl!"=="UAC" (
    set "Dft=UAC"
    goto START
)
if /i "!FxFl!"=="USER" (
    set "Dft=USER"
    goto START
)

if not exist "!FxFl!" (
    echo.
    echo [Error]
    timeout /t 3 >nul
    goto Ipt-FxFl
)

set "failCount=0"

:Ipt-Nm
cls
set "nm="
set /p "nm=Input: "

if not defined nm (
    set /a failCount+=1

    if !failCount! geq 2 (
        goto START
    )
    goto Ipt-Nm
)

set "failCount=0"

for %%F in ("!FxFl!") do (
    set "TARGET_PATH=%%~fF"
    set "SHORTCUT_DIR=%%~dpF"
)

set "SHORTCUT_NAME=!nm!.lnk"

set "SHORTCUT_PATH=!dstn!\!SHORTCUT_NAME!"

if "!Dft!"=="UAC" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%'); $s.TargetPath = '%TARGET_PATH%'; $s.WorkingDirectory = '%SHORTCUT_DIR%'; $s.Save(); $bytes = [System.IO.File]::ReadAllBytes('%SHORTCUT_PATH%'); $bytes[0x15] = $bytes[0x15] -bor 0x20; [System.IO.File]::WriteAllBytes('%SHORTCUT_PATH%', $bytes)"
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%'); $s.TargetPath = '%TARGET_PATH%'; $s.WorkingDirectory = '%SHORTCUT_DIR%'; $s.Save()"
)

echo.
echo [Success]
echo [!SHORTCUT_PATH!] (!Dft!)
timeout /t 5 >nul
goto START

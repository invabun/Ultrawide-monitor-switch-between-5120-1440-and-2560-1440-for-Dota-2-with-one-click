@echo off
REM Resolution Switch - Toggles between 2560x1440 and 5120x1440
REM Requires nircmd.exe in the same folder
REM Window closes automatically after switching

if not exist "%~dp0nircmd.exe" (
    echo NirCmd.exe not found!
    echo Please run setup_nircmd.ps1 to download it automatically,
    echo or download manually from: https://www.nirsoft.net/utils/nircmd.html
    echo.
    pause
    exit /b 1
)

powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0switch_resolution_nircmd.ps1" 2>nul
exit /b %errorLevel%


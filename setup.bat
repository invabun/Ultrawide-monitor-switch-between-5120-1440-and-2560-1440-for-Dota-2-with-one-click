@echo off
REM Setup script - Downloads NirCmd automatically
REM Double-click this file to run setup

echo ========================================
echo Resolution Switcher - Setup
echo ========================================
echo.
echo This will download NirCmd automatically.
echo.
pause

powershell.exe -ExecutionPolicy Bypass -File "%~dp0setup_nircmd.ps1"

echo.
echo Setup complete!
echo You can now use switch_resolution.bat
echo.
pause



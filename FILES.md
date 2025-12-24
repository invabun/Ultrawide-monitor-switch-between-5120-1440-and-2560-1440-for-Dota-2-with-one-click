# File Structure

## Essential Files (Required for Distribution)

These files are **required** for the tool to work:

1. **`switch_resolution.bat`** - Main launcher (double-click this to switch resolution)
2. **`switch_resolution_nircmd.ps1`** - PowerShell script that performs the resolution switch
3. **`nircmd.exe`** - NirCmd utility (required, can be downloaded via setup script)

## Optional Files

1. **`setup_nircmd.ps1`** - Automatic setup script to download NirCmd (convenient but not required if you already have nircmd.exe)
2. **`README.md`** - Documentation (helpful for users)

## For GitHub Distribution

**Minimum files needed:**
- `switch_resolution.bat`
- `switch_resolution_nircmd.ps1`
- `setup_nircmd.ps1` (so users can auto-download nircmd.exe)
- `README.md`
- `.gitignore`

**Note:** `nircmd.exe` should NOT be included in the repository (users download it via setup script or manually). Add it to `.gitignore` if it exists.

## Quick Start for New Users

1. Clone/download repository
2. Run `setup_nircmd.ps1` (downloads nircmd.exe automatically)
3. Use `switch_resolution.bat` to switch resolutions

That's it! Only 3 essential files needed (after setup).



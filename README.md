# Resolution Switcher

A simple Windows utility to quickly toggle between **2560x1440** and **5120x1440** display resolutions with a single click. The window closes automatically after switching - no clicks required!

## Features

- ✅ **One-click resolution switching** between 2560x1440 and 5120x1440
- ✅ **Silent operation** - window closes automatically (no "Press any key" prompts)
- ✅ **No administrator privileges required** (in most cases)
- ✅ **Lightweight and fast** - uses NirCmd utility
- ✅ **Desktop shortcut ready** - create a shortcut for instant access

## Requirements

- Windows 10/11
- PowerShell (included with Windows)
- Display/monitor that supports both 2560x1440 and 5120x1440 resolutions

## Installation

### Option 1: Automatic Setup (Recommended)

1. Download or clone this repository
2. **Double-click `setup.bat`** - it will automatically download NirCmd
3. Done! You can now use `switch_resolution.bat`

**Alternative:** If `setup.bat` doesn't work, right-click `setup_nircmd.ps1` → **Run with PowerShell**

### Option 2: Manual Setup

1. Download or clone this repository
2. Download NirCmd from [nirsoft.net](https://www.nirsoft.net/utils/nircmd.html)
3. Extract `nircmd.exe` and place it in the same folder as `switch_resolution.bat`
4. Done!

## Usage

### ⚠️ Important: Which File to Run?

**Always double-click `switch_resolution.bat`** - NOT the .ps1 files!

- ✅ **DO**: Double-click `switch_resolution.bat` (this is the main file)
- ❌ **DON'T**: Double-click `.ps1` files directly (Windows will open them as text files)

The `.ps1` files are PowerShell scripts that are called automatically by the `.bat` file. You don't need to run them manually.

### Basic Usage

Simply double-click `switch_resolution.bat` to toggle between resolutions:
- If current resolution is **2560x1440** → switches to **5120x1440**
- If current resolution is **5120x1440** → switches to **2560x1440**
- If current resolution is neither → switches to **2560x1440**

The command window will close automatically after switching (no clicks needed).

### Create Desktop Shortcut

1. Right-click on `switch_resolution.bat`
2. Select **Send to** → **Desktop (create shortcut)**
3. Optionally rename the shortcut (e.g., "Switch Resolution")
4. Optionally change the icon: Right-click shortcut → Properties → Change Icon

Now you can switch resolutions with a single double-click from your desktop!

## Files Included

### Essential Files (Required)

- **`switch_resolution.bat`** - Main launcher script (double-click this)
- **`switch_resolution_nircmd.ps1`** - PowerShell script that performs the resolution switch
- **`nircmd.exe`** - NirCmd utility (required, downloaded by setup script)

### Optional Files

- **`setup.bat`** - Easy setup launcher (double-click to download NirCmd)
- **`setup_nircmd.ps1`** - Automatic setup script (called by setup.bat)
- **`README.md`** - This file
- **`QUICK_START.txt`** - Quick reference guide

## How It Works

1. The script detects the current screen resolution
2. Determines the target resolution (switches between the two)
3. Uses NirCmd to change the display resolution
4. Exits silently (window closes automatically)

## Troubleshooting

### ".ps1 File Opens as Text File" / "PowerShell Script Won't Run"

**This is normal!** Windows treats `.ps1` files as text files by default. 

**Solution:**
- **Don't double-click `.ps1` files directly**
- **Always use `switch_resolution.bat`** - it will automatically run the PowerShell scripts
- For `setup_nircmd.ps1`: Right-click → **Run with PowerShell**, or open PowerShell and type: `.\setup_nircmd.ps1`

### "NirCmd.exe not found" Error

- **Double-click `setup.bat`** to download it automatically
- Or manually download from [nirsoft.net](https://www.nirsoft.net/utils/nircmd.html) and place `nircmd.exe` in the script folder

### Resolution Change Fails

- **Check if your monitor supports the target resolution** - Open Windows Settings → Display → Advanced display settings
- **Try running as Administrator** - Right-click `switch_resolution.bat` → Run as administrator
- **Update your graphics driver** - Outdated drivers may not support certain resolutions
- **Check Windows display settings** - Ensure the resolution is available in Windows Settings

### Window Still Shows / Doesn't Close

- Make sure you're using the latest version of the script
- The window should close automatically - if it doesn't, there may be an error (check the output)
- Try running `switch_resolution.bat` directly (not through a shortcut that might have issues)

### Customizing Resolutions

To switch between different resolutions, edit `switch_resolution_nircmd.ps1`:

```powershell
# Change these values to your desired resolutions
if ($currentRes -eq "2560x1440") {
    $targetWidth = 5120
    $targetHeight = 1440
} elseif ($currentRes -eq "5120x1440") {
    $targetWidth = 2560
    $targetHeight = 1440
}
```

## Technical Details

- **NirCmd**: A command-line utility by NirSoft for Windows system operations
- **PowerShell**: Used for resolution detection and script execution
- **Window Style**: Hidden window mode prevents command prompt from showing
- **Exit Codes**: 0 = success, 1 = error (only shown if error occurs)

## License

This project uses:
- **NirCmd** by NirSoft - Freeware ([nirsoft.net](https://www.nirsoft.net/utils/nircmd.html))
- Scripts are provided as-is for personal use

## Credits

- Resolution switching powered by [NirCmd](https://www.nirsoft.net/utils/nircmd.html) by NirSoft
- Script created for quick resolution toggling

## Contributing

Feel free to submit issues or pull requests if you have improvements or encounter problems!

## Changelog

### Version 1.0
- Initial release
- Toggle between 2560x1440 and 5120x1440
- Silent operation (auto-closing window)
- Automatic NirCmd setup script


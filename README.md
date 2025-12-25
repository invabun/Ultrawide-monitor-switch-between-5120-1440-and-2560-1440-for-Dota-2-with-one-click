# Dota2 Ultrawide Resolution Switcher

A simple Windows utility to **instantly switch between 5120x1440 and 2560x1440 resolutions** for **Dota 2** on **ultrawide monitors** — with one double-click.
The window closes automatically after switching. No extra clicks.

--


## 🎮 Why This Tool Exists

I am still prefer play dota in 2560x1440 due to minimap focus and overall performance. 
but every time like to play had to right click display scroll click click clikc .....
yeah I am lazy . 

This tool lets me:
* Use **5120x1440** for desktop/work
* Switch to **2560x1440** before launching Dota 2 just double click a desktop shortcut.
* Switch back after gaming — instantly

here is short video (now updated no need admin so the yes no popup screen no longer show)
https://www.youtube.com/shorts/znN8-oXJh4I

---

## ⚡ Quick Start

1. Download or clone this repository
2. Double-click `setup.bat` (first time only)
3. Then double-click `switch_resolution.bat`
4. Resolution toggles instantly

That’s it.

---

## ✨ Features

* ✅ One-click toggle between **5120x1440 ↔ 2560x1440**
* ✅ Optimized for **Dota 2** on ultrawide monitors
* ✅ Silent operation — window closes automatically
* ✅ No admin rights required (in most cases)
* ✅ Lightweight — uses NirCmd utility
* ⭐ **Desktop shortcut ready for instant access**

---

## 🖥️ Requirements

* Windows 10 / 11
* PowerShell (included with Windows)
* Monitor that supports both **5120x1440** and **2560x1440**

---

## 📦 Installation

### Option 1: Automatic Setup (Recommended)

1. Download or clone this repository
2. **Double-click `setup.bat`** — it will automatically download NirCmd
3. Done! You can now use `switch_resolution.bat`

**Alternative:** If `setup.bat` doesn’t work, right-click `setup_nircmd.ps1` → **Run with PowerShell**

---

### Option 2: Manual Setup

1. Download or clone this repository
2. Download NirCmd from [https://www.nirsoft.net/utils/nircmd.html](https://www.nirsoft.net/utils/nircmd.html)
3. Extract `nircmd.exe` and place it in the same folder as `switch_resolution.bat`
4. Done!

---

## ▶️ Usage

### ⚠️ Important: Which File to Run?

👉 **Always double-click `switch_resolution.bat`** — NOT the `.ps1` files.

* ✅ DO: Double-click `switch_resolution.bat`
* ❌ DON’T: Double-click `.ps1` files directly (Windows opens them as text)

The `.ps1` scripts are called automatically by the `.bat` file.

---

### 🎯 Basic Usage

Just double-click `switch_resolution.bat`:

* If current is **5120x1440** → switches to **2560x1440**
* If current is **2560x1440** → switches to **5120x1440**
* If neither → defaults to **2560x1440**

The window closes automatically after switching.

---

### ⭐ Create Desktop Shortcut (Highly Recommended)

For the best experience, create a desktop shortcut so you can switch resolution before and after gaming in one click:

1. Right-click on `switch_resolution.bat`
2. Select **Send to → Desktop (create shortcut)**
3. Rename it (e.g., `Dota2 Resolution Switcher`)
4. (Optional) Change icon: Right-click shortcut → **Properties → Change Icon**

Now you can switch resolutions instantly from your desktop before launching Dota 2.

---

## 📁 Files Included

### Essential Files

* `switch_resolution.bat` — Main launcher (double-click this)
* `switch_resolution_nircmd.ps1` — PowerShell script to detect and switch resolution
* `nircmd.exe` — NirCmd utility (downloaded by setup)

### Optional Files

* `setup.bat` — Automatic NirCmd setup launcher
* `setup_nircmd.ps1` — Setup PowerShell script
* `README.md` — This guide
* `QUICK_START.txt` — Quick reference

---

## ⚙️ How It Works

1. Detects current screen resolution
2. Chooses the target resolution (toggles between the two)
3. Uses NirCmd to change display resolution
4. Exits silently

---

## 🛠️ Troubleshooting

### ".ps1 file opens as text"

This is normal on Windows.

✅ Always run `switch_resolution.bat` instead.

---

### "NirCmd.exe not found"

* Double-click `setup.bat` to download automatically
* Or manually place `nircmd.exe` in the script folder

---

### Resolution change fails

* Ensure your monitor supports the target resolutions
* Try **Run as administrator**
* Update graphics drivers
* Check Windows display settings

---

### Window doesn’t close

* Use the latest version
* Errors may be shown if something fails

---

## 🔧 Customizing Resolutions

Edit `switch_resolution_nircmd.ps1`:

```powershell
if ($currentRes -eq "2560x1440") {
    $targetWidth = 5120
    $targetHeight = 1440
} elseif ($currentRes -eq "5120x1440") {
    $targetWidth = 2560
    $targetHeight = 1440
}
```

---

## 📜 License

* Scripts in this project: **MIT License**
* Uses **NirCmd** by NirSoft (freeware)

---

## 👤 Author

Created by [invabun](https://github.com/invabun)

If this tool helps you, feel free to star the repo or open an issue.

---

## 🗑️ Uninstall

1. Delete the project folder
2. Remove any desktop shortcuts

No system changes remain.

---

## 📝 Changelog

### v1.0

* Initial release
* Toggle between 5120x1440 and 2560x1440
* Silent operation
* Automatic NirCmd setup

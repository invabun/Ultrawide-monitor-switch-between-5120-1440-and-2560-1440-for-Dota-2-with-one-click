# Dota2 Ultrawide Resolution Switcher

A tiny Windows tool to **instantly switch between 5120x1440 and 2560x1440** for **Dota 2** on ultrawide monitors — with one double-click.

---

## 🎮 Why This Tool Exists

I use a **5120x1440 ultrawide monitor**, but for **Dota 2**, I still prefer **2560x1440**:
- The minimap feels more focused
- The UI looks better
- Performance is often more stable

But every time I wanted to play, I had to:
right-click → display settings → scroll → click → click → click…

So I made this.  
Because I’m lazy — and gamers should be too.

This tool lets you:
- Use **5120x1440** for desktop/work
- Double-click to switch to **2560x1440** before Dota 2
- Double-click again to switch back after gaming

No menus. No setup every time. Just one click.

🎥 Short demo:  
https://www.youtube.com/shorts/znN8-oXJh4I

---

## ⚡ Quick Start (For Gamers)

1. Download **`Dota2ResolutionSwitcher.exe`** from the Releases page
2. Put it anywhere (Desktop, Downloads, etc.)
3. **Double-click it once** → first run does a simple setup
4. A desktop shortcut **“Dota2 Resolution Switcher”** will be created
5. From now on, just double-click the shortcut to toggle resolution

That’s it.  
No scripts. No folders. One file.

---

## ⭐ How to Use

- Double-click → switches:
  - **5120x1440 → 2560x1440**
  - or **2560x1440 → 5120x1440**
- The app runs silently and exits.
- Use it before and after launching Dota 2.

👉 Tip: Keep the shortcut on your desktop for fast access.

---

## ✨ Features

- ✅ One-click toggle between **5120x1440 ↔ 2560x1440**
- 🎮 Designed for **Dota 2** ultrawide players
- 🔇 Silent — no console windows
- 🖥️ Portable — single EXE, no install
- ⭐ Auto creates desktop shortcut on first run

---

## 🖥️ Requirements

- Windows 10 / 11
- Primary monitor supports **5120x1440** and **2560x1440**

---

## 🛠️ Troubleshooting

- ❗ If switching fails:  
  Right-click the EXE → **Run as Administrator**
- ❗ On work/school PCs:  
  Security policies may block downloads or shortcuts.
- ❗ Multi-monitor setups:  
  Tool targets the **primary display**.

---

## 🗑️ Uninstall

1. Delete `Dota2ResolutionSwitcher.exe`
2. Delete the desktop shortcut
3. (Optional) Delete folder:  
   `%LOCALAPPDATA%\Dota2ResolutionSwitcher`

Nothing else is left behind.

---

## ⚙️ How It Works (Brief)

On first run:
- Downloads **NirCmd** (from NirSoft) into your local app data folder
- Creates a desktop shortcut

On every run:
- Calls NirCmd to change screen resolution
- Exits immediately

No background process.

---

## 🙏 Credits

- Resolution switching powered by **NirCmd** by NirSoft  
  https://www.nirsoft.net/utils/nircmd.html  
- EXE packaging via **PS2EXE**

NirCmd is downloaded from the official site on first run.  
It is not redistributed in this repo.

---

## 📜 License

This project’s scripts are released under the **MIT License**.  
See `LICENSE` for details.

---

## 👤 Author

Created by **Bruce from Malaysia**  
GitHub: https://github.com/invabun

If this helps you, feel free to star the repo or share it with other ultrawide Dota players.

---

## 📝 Changelog

### v1.0
- First release
- Single portable EXE
- One-click toggle between 5120x1440 and 2560x1440
- Silent operation
- Auto desktop shortcut

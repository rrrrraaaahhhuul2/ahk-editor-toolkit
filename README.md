```markdown
# AHK Editor Toolkit

Hey guys, welcome! I've been working as a video editor for a few years now,
primarily in Premiere Pro and Photoshop. To make my workflow faster and more
efficient I use [AutoHotkey](https://www.autohotkey.com) for macros — and I
want to give back to the community by sharing the scripts I use day to day.

I'm always looking for new ways to streamline my editing, so if you have any
tips, advice, or macros of your own, I'd love to check them out.
Cheers and happy editing! ✌️

---

## Scripts

### 📋 Basics.ahk
Not editing-related — just quality of life improvements for my laptop.
Run this always in the background.

> 💡 **Pro Tip:** Press `Win+R`, type `shell:startup`, and drop a shortcut
> to your AHK files there so they launch automatically on boot.

- **Media keys** — Numpad controls play/pause, prev/next, volume up/down
- **Taskbar volume** — Scroll wheel on taskbar adjusts volume
- **Brightness** — `Win+NumpadUp/Down` to adjust gamma; `Win+NumpadHome` to reset
- **Night Light** — `Win+Space` toggles Windows Night Light instantly
- **Text expanders** — Type `r1`, `r2`, `sp`, `pls` to expand to full text
- **Middle mouse** → Backspace
- **RAlt** → remapped to Win key
- **Copilot key** → opens Windows Clipboard history
- **Photoshop** — Backtick remapped to `Ctrl+Alt+Z` (step back in history)
- **Pause all scripts** — `Ctrl+Alt+Shift+P` pauses every running AHK at once

---

### 🎬 z_PREMIERE.ahk
Master Premiere Pro script — launches Premiere and loads all sub-scripts
automatically. Also includes my full keyboard shortcut map.

> Import `My Premiere Pro Keyboard May 16 2026.kys` at: Documents\Adobe\Premiere Pro\[Version]\Profile-[Username]\Win or
C:\Users\<username>\Documents\Adobe\Premiere Pro\<version>\Profile-<profilename>\Win. 
> before using this script.

- **F2** → Ripple Cut
- **F5** → Paste Attributes
- **Ctrl+1 / F7** → Apply Warp Stabilizer
- **Shift+3** → Set 50% speed and move to next clip
- **Shift+F2** → Apply 50% speed to next 5 clips
- **Tab** → Delete
- **W** → Add Edit + select next clip etc

---

### 🎥 z_DAVINCI_2_PREMIERE.ahk
DaVinci Resolve keybinds mirrored to match Premiere Pro muscle memory,
making switching between the two apps seamless.

> ⚠️ Work in progress — my main workflow is in Premiere Pro.

---

### 🔌 Charger_Plug_In.ahk *(Laptop only)*
Automatically switches power plan, brightness, and energy saver mode
on plug/unplug so your laptop is always at the right performance level.
Built for HP Victus but adaptable to any Windows laptop.

- **Plugged in** → High Performance, Energy Saver OFF, Brightness 100%
- **Unplugged** → Power Saver, Energy Saver ON, Brightness 30%

---

### 🖥️ Auto_Hide_Taskbar.ahk
Hides the taskbar and reclaims screen real estate when Premiere Pro or
DaVinci Resolve is in focus. Restores automatically when you switch away.

- **RShift** → toggle taskbar on/off manually
- **Win key** → peek at taskbar, re-hides when Start menu closes

---

### 📋 Copy_Paste.ahk
Smart copy-paste macros for heavy text workflows.

- **Hold LAlt + drag** → selects, cuts, and pastes in one gesture
- **F1** → highlight then paste
- **F2 / F3** → Cut / Paste

> Starts suspended by default — enable from the tray icon or remove
> `Suspend, On` from the top of the file.

---

## Requirements

- [AutoHotkey v1.1](https://www.autohotkey.com)
- Windows 10 / 11
- Adobe Premiere Pro and/or DaVinci Resolve

---

## Notes

- Update file paths in `z_PREMIERE.ahk` and `z_DAVINCI_2_PREMIERE.ahk`
  to match your system before running
- Warp Stabilizer mouse coordinates (`MouseMove, 240, 312`) may need
  adjusting for your screen resolution — see comments in the script
- `Charger_Plug_In.ahk` is built for HP Victus but works on any Windows laptop
- `Copy_Paste.ahk` starts suspended by default — enable from the tray icon
  or remove `Suspend, On` from the top of the file

---

## Acknowledgements

Huge thanks to the [AutoHotkey](https://www.autohotkey.com) team and community
for building and maintaining such a powerful free and open-source automation tool.
```

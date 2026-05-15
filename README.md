# AHK Editor Toolkit

## Acknowledgements
Thanks to the [AutoHotkey](https://www.autohotkey.com) team and community
for building and maintaining such a powerful free and open-source automation tool.

A collection of AutoHotkey (v1) scripts built for video editors and
power users on Windows. Tuned for Adobe Premiere Pro and DaVinci
Resolve workflows, with general productivity utilities on top.

## Scripts

### Basic_LF.ahk ⭐ Not related to Editing but just quality of life improvements for my Laptop
General purpose daily driver script. Run this always-on in the background.
- **Media keys** — Numpad controls play/pause, prev/next, volume up/down
- **Taskbar volume** — Scroll wheel on taskbar to change volume
- **Brightness** — Win+NumpadUp/Down to adjust gamma; Win+NumpadHome to reset
- **Night Light** — Win+Space toggles Windows Night Light instantly
- **Text expanders** — Type shortcuts like `r1`, `r2`, `LLF`, `sp`, `pls`, `blore` to expand to full text
- **Middle mouse** → Backspace
- **RAlt** → remapped to Win key
- **Copilot key** → opens Windows Clipboard history
- **Photoshop** — Backtick remapped to Ctrl+Alt+Z (undo history)
- **Pause all AHK scripts** — Ctrl+Alt+Shift+P pauses every running AHK at once

### z_PREMIERE.ahk
Master Premiere Pro macro script. Launches Premiere and loads sub-scripts.
Includes ripple cut (F2), paste attributes (F5), warp stabilizer (Ctrl+1 / F7),
50% speed macro (Shift+3), and full keyboard remapping for faster editing.

### z_DAVINCI_2_PREMIERE.ahk
DaVinci Resolve keybinds mirrored to match Premiere Pro muscle memory.
Makes switching between the two apps seamless.

### Charger_Plug_In.ahk
Automatically switches power plan, brightness, and energy saver mode
when charger is plugged or unplugged. Built for HP Victus laptops.

### Auto_Hide_Taskbar.ahk
Hides the taskbar and reclaims screen space when Premiere Pro or
DaVinci Resolve is focused. Restores it when you switch away.
Toggle manually with RShift or peek with the Win key.

### Copy_Paste.ahk
Smart copy-paste macros. Hold LAlt and drag to cut-paste selected text.
F1 for highlight-then-paste. F2/F3 remapped to Cut/Paste.

## Requirements
- AutoHotkey v1.1 — https://www.autohotkey.com
- Windows 10 / 11
- Adobe Premiere Pro (for Premiere scripts)

## Notes
- Update file paths in z_PREMIERE.ahk and z_DAVINCI_2_PREMIERE.ahk
  to match your system before running
- Text expanders in Basic_LF.ahk (emails, address) are personal —
  update them to your own before sharing or using
- Warp Stabilizer mouse coordinates (MouseMove, 240, 312) may need
  adjusting for your screen resolution — see comments in the script
- Charger_Plug_In.ahk works best on HP laptops but is adaptable
- Copy_Paste.ahk starts suspended by default — enable it from
  the tray icon or remove `Suspend, On` from the top of the file

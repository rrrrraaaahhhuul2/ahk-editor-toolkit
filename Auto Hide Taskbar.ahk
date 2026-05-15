#Persistent
#SingleInstance Force

; ==========================================
; APP GROUPS
; ==========================================
GroupAdd, EditingApps, ahk_exe Adobe Premiere Pro.exe
GroupAdd, EditingApps, ahk_exe resolve.exe

; ==========================================
; GLOBALS
; ==========================================
global TaskbarHidden  := false
global ManualOverride := false

; Save original work area on startup so we can restore it later
global OrigWorkAreaBottom := 0
SaveOriginalWorkArea()

SetTimer, CheckEditor, 500
return

; ==========================================
; SAVE ORIGINAL WORK AREA (run once)
; ==========================================
SaveOriginalWorkArea() {
    global OrigWorkAreaBottom
    VarSetCapacity(RECT, 16, 0)
    DllCall("SystemParametersInfo", "UInt", 48, "UInt", 0, "Ptr", &RECT, "UInt", 0)
    OrigWorkAreaBottom := NumGet(RECT, 12, "Int")   ; Save bottom edge of work area
}

; ==========================================
; MAIN LOGIC
; ==========================================
CheckEditor:
    if WinActive("ahk_group EditingApps") {
        if (!TaskbarHidden && !ManualOverride)
            HideTaskbar()
    } else {
        if (TaskbarHidden) {
            ShowTaskbar()
            ManualOverride := false
        }
    }
return

; ==========================================
; WIN KEY — peek at taskbar then re-hide
; ==========================================
LWin::
    if (TaskbarHidden) {
        ShowTaskbar()
        ManualOverride := true
    }
    Send, {LWin}
return

RWin::
    if (TaskbarHidden) {
        ShowTaskbar()
        ManualOverride := true
    }
    Send, {RWin}
return

WatchStartMenu:
    if (ManualOverride) {
        if WinActive("ahk_group EditingApps") {
            if (!WinExist("ahk_class Shell_TrayWnd ahk_exe SearchHost.exe")) {
                Sleep, 600
                HideTaskbar()
                ManualOverride := false
            }
        }
    }
return
SetTimer, WatchStartMenu, 300

; ==========================================
; HIDE — hides taskbar AND expands work area
; ==========================================
HideTaskbar() {
    global TaskbarHidden

    ; Step 1: Hide the taskbar visually
    WinHide, ahk_class Shell_TrayWnd
    WinHide, ahk_class Shell_SecondaryTrayWnd

    ; Step 2: Expand work area to full screen height
    ; This is what actually gives you the extra screen space
    VarSetCapacity(RECT, 16, 0)
    NumPut(0,             RECT, 0,  "Int")   ; left
    NumPut(0,             RECT, 4,  "Int")   ; top
    NumPut(A_ScreenWidth, RECT, 8,  "Int")   ; right
    NumPut(A_ScreenHeight,RECT, 12, "Int")   ; bottom  ← full height, no taskbar gap
    DllCall("SystemParametersInfo", "UInt", 47, "UInt", 0, "Ptr", &RECT, "UInt", 0)

    TaskbarHidden := true
}

; ==========================================
; SHOW — restores taskbar AND shrinks work area back
; ==========================================
ShowTaskbar() {
    global TaskbarHidden, OrigWorkAreaBottom

    ; Step 1: Show taskbar
    WinShow, ahk_class Shell_TrayWnd
    WinSet, AlwaysOnTop, On, ahk_class Shell_TrayWnd
    WinShow, ahk_class Shell_SecondaryTrayWnd

    ; Step 2: Restore original work area (taskbar height gap comes back)
    VarSetCapacity(RECT, 16, 0)
    NumPut(0,                RECT, 0,  "Int")   ; left
    NumPut(0,                RECT, 4,  "Int")   ; top
    NumPut(A_ScreenWidth,    RECT, 8,  "Int")   ; right
    NumPut(OrigWorkAreaBottom, RECT, 12, "Int") ; bottom ← original height
    DllCall("SystemParametersInfo", "UInt", 47, "UInt", 0, "Ptr", &RECT, "UInt", 0)

    TaskbarHidden := false
}

; ==========================================
; SAFETY NET — always restore on exit
; ==========================================
OnExit, Cleanup
return

Cleanup:
    ShowTaskbar()
ExitApp

; ==========================================
; RShift tap alone — toggle taskbar
; (won't interfere with RShift+other keys)
; ==========================================
~RShift::
    KeyWait, RShift
    if (A_TimeSinceThisHotkey < 200)
        if (TaskbarHidden) {
            ShowTaskbar()
            ManualOverride := true
        } else {
            HideTaskbar()
            ManualOverride := false
        }
return
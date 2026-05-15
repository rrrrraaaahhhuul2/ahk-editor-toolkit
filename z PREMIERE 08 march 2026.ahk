#Persistent
#SingleInstance Force
#NoEnv
#Warn

SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2

Run, C:\Program Files\Adobe\Adobe Premiere Pro 2026\Adobe Premiere Pro.exe
Sleep, 20
Run, "C:\Users\Rahul Devagiri\Documents\! AHKs\Charger Plug In.ahk"
Sleep, 20
Run, "C:\Users\Rahul Devagiri\Documents\! AHKs\Copy Paste.ahk"
Sleep, 20

; =========================================================
; PREMIERE PRO AHK MACROS
; =========================================================

; MY PREMIERE SHORTCUTS 
; W = Add Edit
; Q = Ripple Delete
; A = Go To Previous Edit Point
; S = Go To Next Edit Point
; X = Clear In & Out
; Z = Mark Clip
; NumPad. = Speed/Duration
; Numpad1 = Keyboard Shortcuts
; NumPad2 = Paste Attributes
; Numpad4 = Lock/Unlock all audio tracks
; Numpad5 = Lock/Unlock all video tracks
; Numpad7 = Goto sequence start
; Numpad9 = Goto sequence end
; ` = undo
; 1/Left = Step Back 1 Frame
; 2/Right = Step Back 1 Frame
; 3 = Effects Panel
; 4 = Effect Controls
; 5 = Text panel
; 6/B = Projects Panel
; 5 = Essential Sound panel
; F3 = Paste
; F4 = Copy
; F5 ahk → used for Paste Attributes
; F6 / F1 = Paste Insert
; F10 = Export
; F11 = maximise or restore frame under scursor


; Remove these Premiere default shortcuts before using AHK
; F2 → used for Ripple Cut
; F5 → used for Paste Attributes
; TAB → fully remapped as Delete
; Ctrl+1 → used for Warp Stabilizer
; Shift+3 → used for Speed macro


#IfWinActive ahk_exe Adobe Premiere Pro.exe


; =========================================================
; ESSENTIAL MACROS
; =========================================================

; W = ADD CUT + SELECT NEXT CLIP 
W::
Send, ^k
Sleep, 20
Send, ^{Down}
return


; F2 = RIPPLE CUT (crown jewel)
F2::
Send, ^x
Sleep, 90

Click
Sleep, 90

Send, +{Delete}
return


; F5 = PASTE ATTRIBUTES
F5::
Send, ^!v
Sleep, 90
Send, {Enter}
return


; SHIFT + 3 = 50% SPEED + NEXT CLIP
+3::
Send, {NumpadDot}
Sleep, 90

Send, 50
Sleep, 180

Send, {NumpadEnter}
Sleep, 90

Send, ^{Down}
return


; SHIFT + F2 = APPLY 50% SPEED TO 5 CLIPS
+F2::
Loop, 5
{
    Send, {NumpadDot}
    Sleep, 90

    Send, 50
    Sleep, 180

    Send, {NumpadEnter}
    Sleep, 90

    Send, ^{Down}
}
return

; TAB = DELETE
TAB::
Send, {Delete}
return


; =========================================================
; KEYBINDS MACRO 
; =========================================================



; CTRL + 1 = APPLY WARP STABILIZER

^1::
F7::
CoordMode, Mouse, Window


Send, +7 ; Open Effects panel
Sleep, 200

Send, +f ; Focus Effects search
Sleep, 300


Send, stabilizer ; Only type "stabilizer" because "W" (in warp) is already used in Essential Macros
Sleep, 100

; Move mouse to first result , change the vlaues for different resoultion use get mousepos.ahk 
MouseMove, 240, 312, 0
Sleep, 100

Click ; Select result
Sleep, 150

Send, {Alt Down} ; Apply effect
Sleep, 50

Click, 2
Sleep, 50

Send, {Alt Up}
return



; ---------------------------------------------------------
; CTRL + 2 = RESERVED
; ---------------------------------------------------------
; Add future effects macro here
;
; Example:
;
; ^2::
; Send, hello
; return
;
; ---------------------------------------------------------



#IfWinActive
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Suspend, On

; =========================================================
; EXTESNION MACROS / COPY PASTE
; useful when you have lot of text 
; By default this script starts in suspended mode will need to manully enable from notification or remove Suspend, On from header
; =========================================================


; Remap F2 to CUT as in OG premiere F2 is for ripple cut 

F2::
^x
Return

F3::
^v
Return

; =========================================================

; Hold LAlt + drag LMouse to select → auto cuts and pastes on release
LAlt::
    ; Wait for Left Mouse Button press
    KeyWait, LButton, D T3
    if (ErrorLevel)
        return

    ; Wait for Left Mouse Button release
    KeyWait, LButton

    ; Cut
    Send, ^x
    Sleep, 100

    ; Wait for Left Alt release
    KeyWait, LAlt

    ; Paste
    Send, ^v
return

; =========================================================

; mouse drag
; copy Trigger when F1 is pressed
F1::
    ; Wait for you to press the Left Mouse Button (start highlighting)
    ; Timeout after 3 seconds if no click occurs
    KeyWait, LButton, D T3
    if (ErrorLevel) {
        return
    }

    ; Wait for you to RELEASE the Left Mouse Button (finish highlighting)
    KeyWait, LButton
    
    ; Perform the Copy
    Send, ^c
    
    ; Wait for you to release the F1 key to trigger the Paste
    KeyWait, F1
    Send, ^v
return

; Emergency Exit: Press Ctrl + Esc to stop the script
^Esc::ExitApp


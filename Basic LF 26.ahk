#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ^ ctrl # winkey ! alt + Shift   & two keys

^!+p:: ; PAUSE ALL RUNNING AHK
DetectHiddenWindows On
WinGet, ID, List, ahk_class AutoHotkey
Loop, %id%  ; For each AutoHotkey script (normal or compiled):
{
	this_id := id%A_Index%
	; The following is the same as the user having selected "Pause Script"
	; from the tray menu:
	PostMessage, 0x111, 65305,,, ahk_id %this_id%  ; Use 65305 if you prefer Suspend 6 for pause.
}
return
 


::r1::rahulrdrocks@gmail.com
Return

::home1:: H.no 549, Behind ”Keshav Kunj” , Maruti Nagar Heggeri , Gokul Road , Hubli
Return




; AutoHotkey Media Keys
NumpadMult::Send {Media_Play_Pause}
NumpadLeft::Send {Media_Prev}
NumpadRight::Send {Media_Next}
NumpadUp::Send {Volume_Up}
NumpadDown::Send {Volume_Down}

;taskbar volume control
#If MouseIsOver("ahk_class Shell_TrayWnd")
   WheelUp::Send {Volume_Up}
   WheelDown::Send {Volume_Down}
#If

MouseIsOver(WinTitle)
{  MouseGetPos,,, Win
   Return WinExist(WinTitle . " ahk_id " . Win)
}


MButton::Backspace


;Tilda to Control,alt + Z when Photoshop is active

#IfWinActive ahk_class Photoshop
`::^!z
Return
~::+^z
Return
#IfWinActive


; NIGHT LIGHT win+space
#SPACE::
run ms-settings:nightlight 
sleep 400 
WinWait Settings 
Send {Enter} 
WinClose, Settings 
return

;Brightness

#Persistent
OnExit, EOF

; ===============================================================================================================================

; Win + NumpadDown (oder Numpad Pfeil Links)     ==>    Gamma -1 (runter) (Min:   0)
#NumpadDown::     AdjustBrightness(-1)

; Win + NumpadHome (oder Numpad 5)               ==>    Gamma zurück auf Ausgangswert (Normal 128)
#NumpadHome::     DisplaySetBrightness(128)

; Win + NumpadUp (oder Numpad Pfeil Rechts)    ==>    Gamma +1 (hoch)   (Max: 255)
#NumpadUp::     AdjustBrightness(+1)

; ===============================================================================================================================

AdjustBrightness(V = 0)
{
    SB := (SB := DisplayGetBrightness() + V) > 255 ? 255 : SB < 0 ? 0 : SB
    DisplaySetBrightness(SB)
}

DisplaySetBrightness(SB := 128)
{
    loop % VarSetCapacity(GB, 1536) / 6
        NumPut((N := (SB + 128) * (A_Index - 1)) > 65535 ? 65535 : N, GB, 2 * (A_Index - 1), "UShort")
    DllCall("RtlMoveMemory", "Ptr", &GB +  512, "Ptr", &GB, "UPtr", 512, "Ptr")
    , DllCall("RtlMoveMemory", "Ptr", &GB + 1024, "Ptr", &GB, "UPtr", 512, "Ptr")
    return DllCall("gdi32.dll\SetDeviceGammaRamp", "Ptr", hDC := DllCall("user32.dll\GetDC", "Ptr", 0, "Ptr"), "Ptr", &GB), DllCall("user32.dll\ReleaseDC", "Ptr", 0, "Ptr", hDC)
}

DisplayGetBrightness(ByRef GB := "")
{
    VarSetCapacity(GB, 1536, 0)
    , DllCall("gdi32.dll\GetDeviceGammaRamp", "Ptr", hDC := DllCall("user32.dll\GetDC", "Ptr", 0, "Ptr"), "Ptr", &GB)
    return NumGet(GB, 2, "UShort") - 128, DllCall("user32.dll\ReleaseDC", "Ptr", 0, "Ptr", hDC)
}

; ===============================================================================================================================

EOF:
    DisplaySetBrightness(128)                 ; ==>    Gamma zurück auf Ausgangswert (Normal 128)
ExitApp


; for LF

; LAlt remap to Winkey
RAlt::LWin 
return

::LLF::LabourNet foundation
return

::r2::rahul.devagiri@labournetfoundation.in
return

::sp::rephrase to sound pro ""
return

::pls::please
return

::blore::Bengaluru
Return

; Remap Copilot key (F23 / SC06E, co pilot key presses this codde +#F23 ) to open clipboard
+#F23::Send, {#v}
return

; Calculator key (Launch_App2) → Open WhatsApp Web in Microsoft Edge
Launch_App2::Send, #v
return


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; ^ ctrl # winkey ! alt + Shift   & two keys

Run,"C:\Program Files\Blackmagic Design\DaVinci Resolve\Resolve.exe"

; REMAP THESE keys in premier C-add edit remove f2,f5 key


#IfWinActive ahk_exe Resolve.exe


; Select next clip rather than previous (KEYBIND ^up (select) NEEDED)
w::
send,^+j
sleep 10
send,^{up}
return

; RIPPLE CUT EXISTS IN reslove
;TAB key clear exists 

; DID NOT CHECK paste attributes idea find if ahk supports one click to copy another click to paste
; F5:: send,^!v , sleep,90 ,send,{enter} return



#If



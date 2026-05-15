#Persistent
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%

; ==========================================
; CONFIGURATION
; ==========================================
global LastPowerState    := ""
global BatteryBrightness := 30
global ACBrightness      := 100

global PlanHighPerformance := "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
global PlanPowerSaver      := "a1841308-3541-4fab-bc81-f71556f20b4a"

; ==========================================
; STARTUP (no admin check)
; ==========================================
SetTimer, CheckPower, 2000
GoSub, CheckPower
return

; ==========================================
; TRAY MENU
; ==========================================
Menu, Tray, Tip, HP Victus Power Manager
Menu, Tray, Add, Reload, ReloadScript
Menu, Tray, Add, Exit, ExitScript
return

ReloadScript:
    Reload
return
ExitScript:
    ExitApp
return

; ==========================================
; MAIN LOOP
; ==========================================
CheckPower:
    CurrentState := GetPowerState()

    if (CurrentState != LastPowerState) {

        if (CurrentState = "AC") {
            SetPowerPlan(PlanHighPerformance)
            SetEnergySaver(0)
            Sleep, 300
            SetBrightness(ACBrightness)
            ShowTrayTip("Charger Connected", "Performance Mode ON | Energy Saver OFF | Brightness 100%")

        } else if (CurrentState = "BATTERY") {
            SetPowerPlan(PlanPowerSaver)
            SetEnergySaver(1)
            Sleep, 300
            SetBrightness(BatteryBrightness)
            ShowTrayTip("Charger Disconnected", "Power Saver ON | Energy Saver ON | Brightness " . BatteryBrightness . "%")
        }

        LastPowerState := CurrentState
    }
return

; ==========================================
; POWER STATE DETECTION
; ==========================================
GetPowerState() {
    VarSetCapacity(SYSTEM_POWER_STATUS, 12, 0)
    if !DllCall("kernel32.dll\GetSystemPowerStatus", "Ptr", &SYSTEM_POWER_STATUS)
        return "Unknown"
    return (NumGet(SYSTEM_POWER_STATUS, 0, "UChar") = 1) ? "AC" : "BATTERY"
}

; ==========================================
; POWER PLAN SWITCHER
; Runs via Task Scheduler task (no UAC popup)
; ==========================================
SetPowerPlan(guid) {
    ; Try direct first (works if already elevated)
    Run, powercfg /setactive %guid%, , Hide
}

; ==========================================
; ENERGY SAVER TOGGLE
; Uses PowerShell self-elevation silently
; ==========================================
SetEnergySaver(state) {
    threshold := state ? 100 : 0

    ; Bundle all privileged commands into one silent self-elevating PowerShell call
    psCmd =
    (
    $threshold = %threshold%;
    $state = %state%;
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Name 'EnergySaverStatus' -Value $state -Type DWord;
    powercfg /setdcvalueindex SCHEME_CURRENT SUB_ENERGYSAVER ESBATTTHRESHOLD $threshold;
    powercfg /setactive SCHEME_CURRENT
    )

    ; -Verb RunAs triggers one-time silent UAC if not already elevated
    Run, powershell -WindowStyle Hidden -Command "%psCmd%", , Hide
}

; ==========================================
; BRIGHTNESS via WMI (no admin needed)
; ==========================================
SetBrightness(level) {
    level := (level > 100) ? 100 : (level < 0 ? 0 : level)
    try {
        wmi := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI")
        for item in wmi.ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods WHERE Active=True")
            item.WmiSetBrightness(1, level)
    } catch {
        RunWait, powershell -WindowStyle Hidden -Command "(Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,%level%)", , Hide
    }
}

; ==========================================
; TRAY NOTIFICATION
; ==========================================
ShowTrayTip(title, msg) {
    TrayTip, %title%, %msg%, 3, 1
}
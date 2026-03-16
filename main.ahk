#Requires Autohotkey v2
CoordMode "Mouse", "Screen"
SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"


global App := {}
global NextIndex
global disconnected

disconnected:=False

scripts := Map(
    "Winter", "\Scripts\Winter.ahk",
    "Namek","\Scripts\Namek.ahk",
    "test","\Scripts\test.ahk",
    "cid","\Scripts\cid.ahk"
)

NextIndex:= Map(
    "Slot1",1,
    "Slot2",1,
    "Slot3",1,
    "Slot4",1,
    "Slot5",1,
    "Slot6",1,
    "Slot7",1,
    "Slot8",1
)

scriptNames := []
for name, path in scripts
    scriptNames.Push(name)

; Create GUI (borderless so client coords == screen coords)
MyGui := Gui()
MyGui.Opt("-Caption +ToolWindow +AlwaysOnTop") ; remove title bar/frame, keep small tool style
MyGui.BackColor := "0x1a1a1a"
MyGui.Add("Text", "x10 y10 w300 h20 cWhite", "All in one macro")

; Set default font for GUI (Consolas, size 10 - clean monospace for readability)
MyGui.SetFont("s10", "Verdana") 

; Left log box (multiline read-only) — shows recent actions with dark blue background
logCtl := MyGui.Add("Edit", "x10 y45 w300 h600 vLogBox Background0x001133 cWhite ReadOnly")

; Game window placeholder (solid black area exactly where WinMove will place the game)
; This black area will be made transparent with WinSetTransColor
MyGui.Add("Text", "x335 y45 w800 h600 Background0x000000", "")

; Right-side help: function keys
MyGui.Add("Text", "x1145 y45 w230 h200 cWhite", "Function keys:`nF1: (reserved)`nF2: Reload script`nF3: Align Roblox window`nF8: Start macro`nF9: Stop macro")

; Controls

MyGui.Add("Button", "x120 y660 w100 h30", "Reload").OnEvent("Click", ReloadScript)
MyGui.Add("Button", "x230 y660 w100 h30", "Stop").OnEvent("Click", StopMacro)
MyGui.Add("Text", "x10 y700 w400 h20 cGreen", "Status: Ready")
MyGui.Add("Text","x1145 y330 w200 h25 cWhite", "Select Macro:")
; Make the black color transparent
WinSetTransColor("0x000000", MyGui.Hwnd)

; === OPTIONS PANEL ON RIGHT SIDE ===
MyGui.Add("Text", "x1250 y50 w200 cWhite", "Options")
runBtn :=MyGui.Add("Button", "x10 y660 w100 h30", "Start Macro")

ddl := myGui.Add("DropDownList", "x1145 y350 w200", scriptNames)
btnMain   := MyGui.Add("Button", "x1145 y153  w200 h25", "Main")
btnConfig := MyGui.Add("Button", "x1145 y183 w200 h25", "Config")
btnTasks  := MyGui.Add("Button", "x1145 y213 w200 h25", "Tasks")
btnExtras := MyGui.Add("Button", "x1145 y243 w200 h25", "Extras")
btnSupport:= MyGui.Add("Button", "x1145 y273 w200 h25", "Support")
btnCredit := MyGui.Add("Button", "x1145 y303 w200 h25", "Credit")

; Button events
btnMain.OnEvent("Click", ShowMain)
btnConfig.OnEvent("Click", ShowConfig)
btnTasks.OnEvent("Click", ShowTasks)
btnExtras.OnEvent("Click", ShowExtras)
btnSupport.OnEvent("Click", ShowSupport)
btnCredit.OnEvent("Click", ShowCredit)
runBtn.OnEvent("Click", RunSelected)

RunSelected(*) {
    selected := ddl.Text
    if selected
        Run A_ScriptDir . "\Scripts\" . selected ".ahk"
}

ShowMain(*) {
    global
    if !IsSet(GUIMain) {
        GUIMain := Gui("+AlwaysOnTop -Caption +ToolWindow")
        GUIMain.BackColor := "0x1a1a1a"
        GUIMain.Add("Text", "x10 y10 cWhite", "MAIN PAGE")
    }
    GUIMain.Show("xCenter yCenter")
}

ShowConfig(*) {
    global
    if !IsSet(GUIConfig) {
        GUIConfig := Gui("+AlwaysOnTop -Caption +ToolWindow")
        GUIConfig.BackColor := "0x1a1a1a"
        GUIConfig.Add("Text", "x10 y10 cWhite", "CONFIG PAGE")
    }
    GUIConfig.Show("xCenter yCenter")
}

ShowTasks(*) {
    global
    if !IsSet(GUITasks) {
        GUITasks := Gui("+AlwaysOnTop -Caption +ToolWindow")
        GUITasks.BackColor := "0x1a1a1a"
        GUITasks.Add("Text", "x10 y10 cWhite", "TASKS PAGE")
    }
    GUITasks.Show("xCenter yCenter")
}

ShowExtras(*) {
    global
    if !IsSet(GUIExtras) {
        GUIExtras := Gui("+AlwaysOnTop -Caption +ToolWindow")
        GUIExtras.BackColor := "0x1a1a1a"
        GUIExtras.Add("Text", "x10 y10 cWhite", "EXTRAS PAGE")
    }
    GUIExtras.Show("xCenter yCenter")
}

ShowSupport(*) {
    global
    if !IsSet(GUISupport) {
        GUISupport := Gui("+AlwaysOnTop -Caption +ToolWindow")
        GUISupport.BackColor := "0x1a1a1a"
        GUISupport.Add("Text", "x10 y10 cWhite", "SUPPORT PAGE")
    }
    GUISupport.Show("xCenter yCenter")
}

ShowCredit(*) {
    global
    if !IsSet(GUICredit) {
        GUICredit := Gui("+AlwaysOnTop -Caption +ToolWindow")
        GUICredit.BackColor := "0x1a1a1a"
        GUICredit.Add("Text", "x10 y10 cWhite", "CREDIT PAGE")
    }
    GUICredit.Show("xCenter yCenter")
}


; Show full GUI at top-left of screen (widened to fit help panel)
MyGui.Show("w1400 h750 x0 y0")



StartMacro(GuiObjParam, Info) {
    if WinExist(RobloxWindow) {

    }
}

ReloadScript(GuiObjParam, Info) {
    AppendLog("Reload called (manual)")
    Sleep 100
    Reload
}
StopMacro(GuiObjParam, Info) {
    AppendLog("Stop requested — exiting")
    Sleep 50
    ExitApp
}

f3::{
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(327, 15, 800, 600, RobloxWindow)
        Sleep 50
        AppendLog("Aligned Roblox window to 327x15, 800x600")
    }
}

f2::{
    AppendLog("F2 pressed: Reloading script")
    Sleep 100
    Reload
}

; Append a line to the on-GUI log box (no timestamps, just message sequence)
AppendLog(msg) {
    global logCtl
    text := msg
    if IsObject(logCtl) {
        ; Prepend so newest messages are on top: combine and set
        current := logCtl.Value
        if current = ""
            logCtl.Value := text
        else
            logCtl.Value := current "`n" text
    }
}

App.AppendLog := (msg) => (
    App.LogCtl.Value :=(App.LogCtl.Value = ""
            ? msg
            : App.LogCtl.Value "`n" msg)
)

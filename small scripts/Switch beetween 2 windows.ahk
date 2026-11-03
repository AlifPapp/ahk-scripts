#SingleInstance, Force
#NoEnv
CoordMode,Mouse,Screen
SetTimer, ToolTipFollowMouse, 25 
SetTimer,ToolTipFollowMouse,Off
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On
SetControlDelay, 50
return
F4::
ExitApp
return
XBUTTON2::
    SetTimer,ToolTipFollowMouse, On
    WinGetTitle, WinTitle1, ahk_id %ID1%
	WinName = %WinTitle1%
	ToolTip, Switched to [ %WinName% ]
	WinActivate, ahk_id %ID1%
    SetTimer,Switch_Window_EndToolTip,-1500
Return
XBUTTON1::
	SetTimer,ToolTipFollowMouse, On
    WinGetTitle, WinTitle2, ahk_id %ID2%
	WinName = %WinTitle2%
	ToolTip, Switched to [ %WinName% ]
	WinActivate, ahk_id %ID2%
    SetTimer,Switch_Window_EndToolTip,-1500
Return

^+o::
	ID1 := WinExist("A")
	WinGetTitle, WinTitle1, ahk_id %ID1%
	WinName = %WinTitle1%
	ToolTip, Saved [ %WinName% ] to Slot 1
    Sleep, 1500
    ToolTip
Return

^+p::
	ID2 := WinExist("A")
	WinGetTitle, WinTitle2, ahk_id %ID2%
	WinName = %WinTitle2%
	ToolTip, Saved [ %WinName% ] to Slot 2
    Sleep, 1500
    ToolTip
Return
Switch_Window_EndToolTip(){
	ToolTip
	SetTimer,ToolTipFollowMouse,Off
}
ToolTipFollowMouse:
    MouseGetPos,MouseXpos,MouseYpos
    Process,Exist 
    hwnd:=WinExist("ahk_class tooltips_class32 ahk_pid " ErrorLevel) 
    WinGetPos,,,w,h,ahk_id %hwnd% 
    DllCall("MoveWindow","Uptr",hwnd,"Int",MouseXpos+12,"Int",MouseYpos,"Int",w,"Int",h,"Int",0)
return
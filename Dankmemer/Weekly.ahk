;register
;https://discordapp.com/register
;random letters then @gmail.com then tab
;random username then tab
;random password
;click continue
;click im not robot
;click on green human for buster add on
;unsure
;click skip 
;click away from box
;click on the [+] to join a server
;click join server
;type invter %invite%
;type pls weekly and daily
;click on server name then click on leave
;click on the [+] to join a server
;type invter %invite%
;click join
;type pls give %user%
;click user config/settings
;clck on the left side then press down key
;click log out
;click again to confirm log out


;
;Quick acc create Sleep, 6500 for each step
;1 click on open discord, towards right of middle
;2 type random username ->enter               32 characters of random numbers and letters
;3 click proceed for capcha
;4 when capcha done click skip
;5 click away from box
;6 click on the [+] to join a server
;7 click join server
;8 type invter %invite%
;9 click join
;10 type pls weekly and daily
;11 click on server name then 
;12 click on leave
;13 click confirm leave
;14 click on the [+] to join a server

;15 type invter %invite%
;16 click join
;17 type pls give %user%
;18 click user config/settings
;19 clck on the left side then press down key
;20 click log out
;21 click again to confirm log out
;22 click on url bar slap url enter
;reapete
#SingleInstance, Force
#NoEnv
CoordMode,Mouse,Screen
SetTimer, ToolTipFollowMouse, 25 
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On
SetControlDelay, 50

SetBatchLines -1
SendMode Input 
SetWorkingDir %A_ScriptDir%

Global X1, Y1
Global FirstLetter
Global X2, Y2
Global X3, Y3
Global X4, Y4
Global X5, Y5
Global X6, Y6
Global InviteLink1
Global X7, Y7
Global X8, Y8
Global X9, Y9
Global X10, Y10
Global X11, Y11
Global InviteLink2
Global X12, Y12
Global UserGive
Global X13, Y13
Global X14, Y14
Global X15, Y15
Global X16, Y16
Global X17, Y17

Create_Main_Window() ;Gui 1

Create_Main_Window(){
	Gui,1: +AlwaysOnTop -DPIScale
	Gui,1: Font, S8, Verdana
	Gui,1: Add, Text, x10 y10, -------------Step-1-------------
	Gui,1: Add, Text, x10 y25, Click on Open Discord
	Gui,1: add, Button, x145 y20 gSet-1, Set-1
	Gui,1: Add, Text, x10 y48 Section, X1: 
	Gui,1: Add, Edit, x36 y45 vX1 Disabled Center
	Gui,1: Add, Text, x10 y72 Section, Y1: 
	Gui,1: Add, Edit, x36 y70 vY1 Disabled Center
	Gui,1: Add, Text, x10 y95, -------------Step-2-------------
	Gui,1: Add, Text, x10 y110, First 3 characters
	Gui,1: Add, Text, x10 y132 Section, Charcater: 
	Gui,1: Add, Edit, x75 y130 w50 vFirstLetter, abc
	Gui,1: Add, Text, x10 y155, -------------Step-3-------------
	Gui,1: Add, Text, x10 y170, Click im not a robot
	Gui,1: add, Button, x145 y165 gSet-3, Set-3
	Gui,1: Add, Text, x10 y192 Section, X2: 
	Gui,1: Add, Edit, x36 y189 vX2 Disabled Center
	Gui,1: Add, Text, x10 y216 Section, Y2: 
	Gui,1: Add, Edit, x36 y213 vY2 Disabled Center
	Gui,1: Add, Text, x10 y238, -------------Step-4-------------
	Gui,1: Add, Text, x10 y252, Click skip
	Gui,1: add, Button, x145 y248 gSet-4, Set-4
	Gui,1: Add, Text, x10 y275 Section, X3: 
	Gui,1: Add, Edit, x36 y272 vX3 Disabled Center
	Gui,1: Add, Text, x10 y299 Section, Y3: 
	Gui,1: Add, Edit, x36 y296 vY3 Disabled Center
	Gui,1: Add, Text, x10 y321, -------------Step-5-------------
	Gui,1: Add, Text, x10 y335, Click away from box ;+14
	Gui,1: add, Button, x145 y331 gSet-5, Set-5     ;-4
	Gui,1: Add, Text, x10 y358 Section, X4:         ;+27
	Gui,1: Add, Edit, x36 y355 vX4 Disabled Center  ;-3
	Gui,1: Add, Text, x10 y385 Section, Y4:         ;+27
	Gui,1: Add, Edit, x36 y382 vY4 Disabled Center  ;-3
	Gui,1: Add, Text, x10 y407, -------------Step-6------------- ;+25
	Gui,1: Add, Text, x10 y421, Click [+] join server
	Gui,1: add, Button, x145 y417 gSet-6, Set-6
	Gui,1: Add, Text, x10 y444 Section, X5:
	Gui,1: Add, Edit, x36 y441 vX5 Disabled Center
	Gui,1: Add, Text, x10 y468 Section, Y5:
	Gui,1: Add, Edit, x36 y465 vY5 Disabled Center
	Gui,1: Add, Text, x10 y490, -------------Step-7-------------
	Gui,1: Add, Text, x10 y504, Click join server
	Gui,1: add, Button, x145 y500 gSet-7, Set-7 
	Gui,1: Add, Text, x10 y527 Section, X6:
	Gui,1: Add, Edit, x36 y524 vX6 Disabled Center
	Gui,1: Add, Text, x10 y551 Section, Y6: 
	Gui,1: Add, Edit, x36 y548 vY6 Disabled Center
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Gui,1: Add, Text, x200 y10, -------------Step-8-------------
	Gui,1: Add, Text, x200 y25, Invite link to premiume server
	Gui,1: Add, Text, x200 y47 Section, Link: 
	Gui,1: Add, Edit, x235 y45 w135 h20 vInviteLink1, https://discord.gg/0000000
	Gui,1: Add, Text, x200 y80, -------------Step-9-------------
	Gui,1: Add, Text, x200 y94, Click Join
	Gui,1: add, Button, x330 y90 gSet-9, Set-9     
	Gui,1: Add, Text, x200 y117 Section, X7:         
	Gui,1: Add, Edit, x226 y115 vX7 Disabled Center  
	Gui,1: Add, Text, x200 y142 Section, Y7:         
	Gui,1: Add, Edit, x226 y139 vY7 Disabled Center  
	Gui,1: Add, Text, x200 y174, -------------Step-10-------------
	Gui,1: Add, Text, x200 y188, Sends (pls weekly) and (pls daily)
	Gui,1: Add, Text, x200 y205, -------------Step-11-------------
	Gui,1: Add, Text, x200 y219, Click on server name
	Gui,1: add, Button, x330 y215 gSet-11, Set-11     
	Gui,1: Add, Text, x200 y242 Section, X8:         
	Gui,1: Add, Edit, x226 y239 vX8 Disabled Center  
	Gui,1: Add, Text, x200 y266 Section, Y8:         
	Gui,1: Add, Edit, x226 y263 vY8 Disabled Center 
    Gui,1: Add, Text, x200 y298, -------------Step-12-------------
	Gui,1: Add, Text, x200 y312, Click on leave
	Gui,1: add, Button, x330 y308 gSet-12, Set-12     
	Gui,1: Add, Text, x200 y335 Section, X9:         
	Gui,1: Add, Edit, x226 y332 vX9 Disabled Center  
	Gui,1: Add, Text, x200 y359 Section, Y9:         
	Gui,1: Add, Edit, x226 y356 vY9 Disabled Center 
	Gui,1: Add, Text, x200 y391, -------------Step-13-------------
	Gui,1: Add, Text, x200 y405, Click confirm leave
	Gui,1: add, Button, x330 y401 gSet-13, Set-13     
	Gui,1: Add, Text, x200 y428 Section, X10:         
	Gui,1: Add, Edit, x230 y425 vX10 Disabled Center  
	Gui,1: Add, Text, x200 y452 Section, Y10:         
	Gui,1: Add, Edit, x230 y449 vY10 Disabled Center 
	Gui,1: Add, Text, x200 y484, -------------Step-14-------------
	Gui,1: Add, Text, x200 y498, Click [+] join server
	Gui,1: add, Button, x330 y494 gSet-14, Set-14     
	Gui,1: Add, Text, x200 y521 Section, X11:         
	Gui,1: Add, Edit, x230 y518 vX11 Disabled Center  
	Gui,1: Add, Text, x200 y545 Section, Y11:         
	Gui,1: Add, Edit, x230 y542 vY11 Disabled Center 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Gui,1: Add, Text, x390 y10, -------------Step-15-------------
	Gui,1: Add, Text, x390 y25, Invite link to hiden server
	Gui,1: Add, Text, x390 y47 Section, Link2: 
	Gui,1: Add, Edit, x430 y45 w135 h20 vInviteLink2, https://discord.gg/0000000
	
	Gui,1: Add,Text,x0 y0 w600 h575 BackgroundTrans gMove_Window
	Gui,1: Show,w600 h575
}
return
/*
	Gui,1: Add, Text, x10 y335, Click away from box ;+14
	Gui,1: add, Button, x145 y331 gSet-5, Set-5     ;-4
	Gui,1: Add, Text, x10 y358 Section, X4:         ;+27
	Gui,1: Add, Edit, x36 y355 vX4 Disabled Center  ;-3
	Gui,1: Add, Text, x10 y385 Section, Y4:         ;+27
	Gui,1: Add, Edit, x36 y382 vY4 Disabled Center  ;-3
*/
;----------Step-1----------
Set-1:
;vX1, vY1
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X1, % MouseX
	GuiControl,,Y1, % MouseY
	ToolTip,
return
;----------Step-2----------
;VFirstLetter
;----------Step-3----------
Set-3:
;vX2, vY2
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X2, % MouseX
	GuiControl,,Y2, % MouseY
	ToolTip,
return
;----------Step-4----------
Set-4:
;vX3, vY3
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X3, % MouseX
	GuiControl,,Y3, % MouseY
	ToolTip,
return
;----------Step-5----------
Set-5:
;vX4, vY4
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X4, % MouseX
	GuiControl,,Y4, % MouseY
	ToolTip,
return
;----------Step-6----------
Set-6:
;vX5, vY5
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X5, % MouseX
	GuiControl,,Y5, % MouseY
	ToolTip,
return
;----------Step-7----------
Set-7:
;vX6, vY6
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X6, % MouseX
	GuiControl,,Y6, % MouseY
	ToolTip,
return
;----------Step-8----------
;vInviteLink1
;----------Step-9----------
Set-9:
;vX7, vY7
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X7, % MouseX
	GuiControl,,Y7, % MouseY
	ToolTip,
return
;----------Step-10----------
;pls weekly and pls daily
;----------Step-11----------
Set-11:
;vX8, vY8
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X8, % MouseX
	GuiControl,,Y8, % MouseY
	ToolTip,
return
;----------Step-12----------
Set-12:
;vX9, vY9
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X9, % MouseX
	GuiControl,,Y9, % MouseY
	ToolTip,
return
;----------Step-13----------
Set-13:
;vX10, vY10
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X10, % MouseX
	GuiControl,,Y10, % MouseY
	ToolTip,
return
;----------Step-14----------
Set-14:
;vX10, vY10
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X11, % MouseX
	GuiControl,,Y11, % MouseY
	ToolTip,
return
;----------Step-15----------
;vInviteLink2

/*
^s::
	Gui, Submit, NoHide
	IF (!X1) OR (!Y1)
		Return	
	MouseClick, Left, % X1, % Y1, 1, 1
Return
Set-1:
^r::
	SetTimer, ToolTip, 10
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X1, % MouseX
	GuiControl,,Y1, % MouseY
	SetTimer, ToolTip, OFF
	ToolTip
Return
*/

return
Loop ;5.45 sec
{
	Gui, Submit, NoHide
	;----------Step-1----------
	IF (!X1) OR (!Y1)
		Return	
	MouseClick, Left, % X1, % Y1, 1, 1
	Sleep, 5500
	;----------Step-2----------
	;random username -> enter
	Sleep, 5500
	;----------Step-3----------
	IF (!X2) OR (!Y2)
		Return	
	MouseClick, Left, % X2, % Y2, 1, 1
	Sleep, 5500
	;----------Step-4----------
	IF (!X3) OR (!Y3)
		Return	
	MouseClick, Left, % X3, % Y3, 1, 1
	Sleep, 5500
	;----------Step-5----------
	IF (!X4) OR (!Y4)
		Return	
	MouseClick, Left, % X4, % Y4, 1, 1
	Sleep, 5500
	;----------Step-6----------
	IF (!X5) OR (!Y5)
		Return	
	MouseClick, Left, % X5, % Y5, 1, 1
	Sleep, 5500
	;----------Step-7----------
	IF (!X6) OR (!Y6)
		Return	
	MouseClick, Left, % X6, % Y6, 1, 1
	Sleep, 5500
	;----------Step-8----------
	;invite link 
	Sleep, 5500
	;----------Step-9----------
	IF (!X7) OR (!Y7)
		Return	
	MouseClick, Left, % X7, % Y7, 1, 1
	Sleep, 5500
	;----------Step-10----------
	;pls weekly enter pls daily enter
	Sleep, 5500
	;----------Step-11----------
	IF (!X8) OR (!Y8)
		Return	
	MouseClick, Left, % X8, % Y8, 1, 1
	Sleep, 5500
	;----------Step-12----------
	IF (!X9) OR (!Y9)
		Return	
	MouseClick, Left, % X9, % Y9, 1, 1
	Sleep, 5500
	;----------Step-13----------
	IF (!X10) OR (!Y10)
		Return	
	MouseClick, Left, % X10, % Y10, 1, 1
	Sleep, 5500
	;----------Step-14----------
	IF (!X11) OR (!Y11)
		Return	
	MouseClick, Left, % X11, % Y11, 1, 1
	Sleep, 5500
	;----------Step-15----------
	;invite link2 
	Sleep, 5500
}
return

ToolTipFollowMouse:
    MouseGetPos,MouseXpos,MouseYpos
    Process,Exist 
    hwnd:=WinExist("ahk_class tooltips_class32 ahk_pid " ErrorLevel) 
    WinGetPos,,,w,h,ahk_id %hwnd% 
    DllCall("MoveWindow","Uptr",hwnd,"Int",MouseXpos+12,"Int",MouseYpos,"Int",w,"Int",h,"Int",0)
return

Move_Window(){
	PostMessage,0xA1,2
	While(GetKeyState("LButton"))
		sleep 20
}
return
F4::
GuiClose:
GuiEscape:
	ExitApp
Return
;Code that works for the random events

;Code that works for black jack and can be set for what number it responds with what.

;Code that works for pls bet (max) and can be set the ammount or to include slots or not

;Code for beg, search, hunt, pm, fish. 

;Last 2 can be in background maybe 3 but then the patter will only be h then s


#SingleInstance, Force  ; Force the script to close any other instances of this script. (Run one copy at a time)
#NoEnv
;#ErrorStdOut

ListLines,Off
SetBatchLines, -1 ;Set the script to run at top speed.
SetMouseDelay, -1
CoordMode, Mouse , Screen ;Use the screen as the refrence to get positions from.
SendMode Input 
SetWorkingDir %A_ScriptDir%
SetControlDelay, 50
DetectHiddenWindows, On

Global pToken := Gdip_Startup() ;Start Gdip

SetTimer,Watch_Hover, 50
SetTimer, ToolTipFollowMouse, 25
SetTimer, ToolTipFollowMouse, Off
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Globalised variables and Default values for settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Main = Main
Global HB_Button:=[]
version = 0.1
global version 
Global ContextMenu

global pButton:={}
global Press_active:=0,Hover_On:=0,Active_Button
global Main_Window:={ Y: 50 , W: 350 , H: 600 }
Main_Window.X:=(A_ScreenWidth-Main_Window.W)-100
;============================================================= Window Settings ============================================================
StartMinimized = Off
StartCompacted = Off
MinimizeButtonMinimizesToTray = Off
MainWindow_AlwaysOnTop = On
MainWindow_ToolWindow = Off
;Global
Global StartMinimized, StartMinimized1
Global StartCompacted
Global MinimizeButtonMinimizesToTray
Global MainWindow_AlwaysOnTop
Global MainWindow_ToolWindow
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Create or Read Config file  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IniWrite_All_Variable_Values(){
}


if (StartCompacted = "On"){
	ContextMenu = 1
} else {
	ContextMenu = 0
}
if (StartMinimized = "On"){
	StartMinimized1 = 1
}
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Create Gui  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Create_Tray_Menu()

Create_Main_Window() ;Gui 1
Create_Sub_Window() ;Gui 2
Create_Footer_Window() ;Gui Footer

Create_Core_Window() ;Gui CORE
Create_CoreHelp1() ;Gui C1
Create_CoreHelp2() ;Gui C2
Create_CoreHelp3() ;Gui C3
Create_CoreHelp4() ;Gui C4

Create_Start_Window() ;Gui START

Create_Config_Window() ;Gui CONFIG

Create_VerifyExit_Window() ;Gui VerifyExit
Gui,VerifyExit:hide
Create_StopedProcess_Window() ;GUI StopedProcess
Gui,StopedProcess:hide
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;/////////////////////////////////////////////////////////////  Foundation /////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_Main_Window(){
    Gui, 1: -DPIScale -Caption +LastFound
    Winset,Transcolor,123456
    Gui, 1: Color, 123456
    Gui,1:Font,caaaaaa s10 w600 , Segoe UI
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"Move_Window",floor((Main_Window.W-150)//2),10,150,30,"444444","777777","111111","003366","BLACK","Dank Farmer",5))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"CORE_Window",15,60,25,120,"444444","777777","111111","003366","003388","C`nO`nR`nE",25))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"START_Window",15,190,25,120,"444444","777777","111111","003366","003388","S`nT`nA`nR`nT",15))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"CONFIG_Window",15,320,25,120,"444444","777777","111111","003366","003388","C`nO`nN`nF`nI`nG",10))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"GuiHide",15,495,25,25,"444444","777777","111111","003366","003388","-",5))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"VerifyExit_Window",15,530,25,25,"444444","777777","111111","003366","003388","X",4))
	
	If (ContextMenu = 1){
		Gui,1:Show, h45, Dank Farmer
	}
	If (ContextMenu = 0){
		Gui, 1: Show,% "x" Main_Window.X " y" Main_Window.Y " w350 h600" , Dank Farmer
    }
	
	if (StartMinimized1 = 1){
        Gui,1:Hide
	}
	if (MainWindow_AlwaysOnTop = "Off" and ContextMenu = 0){
		Gui, 1: -DPIScale -Caption +LastFound -AlwaysOnTop
	}else{
		Gui, 1: -DPIScale -Caption +LastFound +AlwaysOnTop
    }
	
	if (MainWindow_ToolWindow = "Off"){
		Gui, 1: -DPIScale -Caption +LastFound -ToolWindow
	}else{
		Gui, 1: -DPIScale -Caption +LastFound +ToolWindow
    }
}

Create_Sub_Window(){
    Gui,2:+Parent1 -DPIScale -Caption
    Gui,2:Color,111111
    Gui,2:Show,x50 y45 w250 h525
}

Create_Footer_Window(){
	Gui,Footer: +Parent2 -DPIScale -caption
    Gui,Footer:Color, 202124
    Gui,Footer:Font,Ccccccc s9, Segoe UI
	DRAW_OUTLINE( "Footer", 10, 0, 220, 5, "000000" , "000000",5 )
    Gui,Footer:Add,Text,x30 y10 BackgroundTrans cFF5E00, % "Version " version 
	Gui,Footer:Add,Text,x105 y10 BackgroundTrans ccccccc, <-->
	pButton.Push(New Progress_Button("Footer",pButton.Length()+1,"Latest_Version",140,8,85,20,"444444","777777","111111","003366","003388","Latest Version",2))
    Gui,Footer:Show,x5 y490 w240 h30
}
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////  Core /////////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_Core_Window(){
    Gui,CORE: +Parent2 -DPIScale -caption
    Gui,CORE:Color, 202124
    Gui,CORE:Font,Ccccccc s9, Segoe UI
    Gui,CORE:Add,Text,x12 y0 w100 BackgroundTrans Center cYellow, "Dank-Farmer"   
    Gui,CORE:Add,Text,x85 y0 w140 BackgroundTrans Center,is an application for 
    Gui,CORE:Add,Text,x2 y15 w236 BackgroundTrans Center,making the currency game of "Dank Memer" easier by earning coins without breaking a sweat!, it's all automated.
	DRAW_OUTLINE( "CORE", 10, 70, 85, 5, "000000" , "000000",5 )
	Gui,CORE:Add,Text,x105 y65 BackgroundTrans cFF5E00, Help
	DRAW_OUTLINE( "CORE", 145, 70, 85, 5, "000000" , "000000",5 )
    pButton.Push(New Progress_Button("CORE",pButton.Length()+1,"Help1",5,85,50,25,"444444","777777","111111","003366","003388","Level-A",4))
    pButton.Push(New Progress_Button("CORE",pButton.Length()+1,"Help2",65,85,50,25,"444444","777777","111111","003366","003388","Level-R",4))
    pButton.Push(New Progress_Button("CORE",pButton.Length()+1,"Help3",125,85,50,25,"444444","777777","111111","003366","003388","Smurf-A",4))
	pButton.Push(New Progress_Button("CORE",pButton.Length()+1,"Help4",185,85,50,25,"444444","777777","111111","003366","003388","Smurf-R",4))
	Gui,CORE:Show,x5 y5 w240 h515 
}

Create_CoreHelp1(){
    Gui,C1: +ParentCORE -DPIScale -caption
    Gui,C1:Color, 202124
    Gui,C1:Font,Ccccccc s9, Segoe UI
	Gui,C1:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, I wil explain later `n 1
	Gui,C1:Show,x0 y110 w240 h375
}

Create_CoreHelp2(){
    Gui,C2: +ParentCORE -DPIScale -caption
    Gui,C2:Color, 202124
    Gui,C2:Font,Ccccccc s9, Segoe UI
	Gui,C2:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, I wil explain later `n 2
	Gui,C2:Show,x0 y110 w240 h375
}

Create_CoreHelp3(){
    Gui,C3: +ParentCORE -DPIScale -caption
    Gui,C3:Color, 202124
    Gui,C3:Font,Ccccccc s9, Segoe UI
	Gui,C3:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, Coming Soon! `n 3
	Gui,C3:Show,x0 y110 w240 h375
}

Create_CoreHelp4(){
    Gui,C4: +ParentCORE -DPIScale -caption
    Gui,C4:Color, 202124
    Gui,C4:Font,Ccccccc s9, Segoe UI
	Gui,C4:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, Coming Soon! `n 4
	Gui,C4:Show,x0 y110 w240 h375
}
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////  Start ////////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_Start_Window(){
    Gui,START: +Parent2 -DPIScale -Caption
    Gui,START:Color, 202124
    Gui,START:Font,Ccccccc s9, Segoe UI 
    
    Gui,START:Show,x5 y5 w240 h515  
}

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////  Config ///////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_Config_Window(){
    Gui,CONFIG: +Parent2 -DPIScale -Caption
    Gui,CONFIG:Color, 202124
 
	Gui,CONFIG:Font, Ccccccc s9 Bold underline,  Segoe UI
	Gui,CONFIG: Add, Text, cYellow x22 y0 w200 Center, System Startup Behavior
	Gui,CONFIG:Font, Ccccccc s9 norm, Segoe UI
	
	Gui,CONFIG: Add, Text, x30 y20, Start Minimized
	if (StartMinimized = "Off"){
		New Toggle_Switch_1(x:=0,y:=18,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=0, Label:="StartMinimized")
	}else if (StartMinimized = "On"){
		New Toggle_Switch_1(x:=0,y:=18,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=1, Label:="StartMinimized")		
    }	
	
	Gui,CONFIG: Add, Text, x30 y40, Start Compacted
	if (StartCompacted = "Off"){
		New Toggle_Switch_1(x:=0,y:=38,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=0, Label:="StartCompacted")
	}else if (StartCompacted = "On"){
		New Toggle_Switch_1(x:=0,y:=38,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=1, Label:="StartCompacted")		
    }	
	
	Gui,CONFIG:Font, Ccccccc s9 Bold underline,  Segoe UI
	Gui,CONFIG: Add, Text, cYellow x15 y65 w200 Center , Minimize Button
	Gui,CONFIG:Font, Ccccccc s9 norm, Segoe UI
	
	Gui,CONFIG: Add, Text, x30 y85, Minimize to tray
	if (MinimizeButtonMinimizesToTray = "Off"){
		New Toggle_Switch_1(x:=0,y:=83,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=0, Label:="MinimizeButtonMinimizesToTray")
	}else if (MinimizeButtonMinimizesToTray = "On"){
		New Toggle_Switch_1(x:=0,y:=83,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=1, Label:="MinimizeButtonMinimizesToTray")		
    }	
	
	Gui,CONFIG:Font, Ccccccc s9 Bold underline,  Segoe UI
	Gui,CONFIG: Add, Text, cYellow x15 y110 w200 Center, Window State
	Gui,CONFIG:Font, Ccccccc s9 norm, Segoe UI
	
	Gui,CONFIG: Add, Text, x30 y130, AlwaysOnTop
	if (MainWindow_AlwaysOnTop = "Off"){
		New Toggle_Switch_1(x:=0,y:=128,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=0, Label:="MainWindow_AlwaysOnTop")
	}else if (MainWindow_AlwaysOnTop = "On"){
		New Toggle_Switch_1(x:=0,y:=128,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=1, Label:="MainWindow_AlwaysOnTop")		
    }	
	
	Gui,CONFIG: Add, Text, x30 y150, ToolWindow
	if (MainWindow_ToolWindow = "Off"){
		New Toggle_Switch_1(x:=0,y:=148,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=0, Label:="MainWindow_ToolWindow")
	}else if (MainWindow_ToolWindow = "On"){
		New Toggle_Switch_1(x:=0,y:=148,w:=30,Text1:="",Text2:="", Window:="CONFIG", State:=1, Label:="MainWindow_ToolWindow")		
    }	
	
    Gui,CONFIG:Show,x5 y5 w240 h515  
}

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;////////////////////////////////////////////////////////////////  Other ///////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_VerifyExit_Window(){
    Gui,VerifyExit: +AlwaysOnTop -DPIScale -Caption
    Gui,VerifyExit:Color, 202124
    Gui,VerifyExit:Font,caaaaaa s10, Segoe UI
    DRAW_OUTLINE( "VerifyExit", 0, 0,200, 80, "111111" , "111111",5 )
    Gui,VerifyExit:Add,Text,x5 y5 w190 h25 gMove_Window,
    Gui,VerifyExit:Add,Text,x5 y5 w190 h25 BackgroundTrans Center, Are you sure you want to exit?
    pButton.Push(New Progress_Button("VerifyExit",pButton.Length()+1,"VerifiedClose",30,35,50,30,"444444","777777","111111","003366","003388","Close",5))
    pButton.Push(New Progress_Button("VerifyExit",pButton.Length()+1,"VerifiedCancel",110,35,50,30,"444444","777777","111111","003366","003388","Cancel",4))
	Gui,VerifyExit:Show, w200 h80, Verify Exit
}

Create_StopedProcess_Window(){
	Gui,StopedProcess: +AlwaysOnTop -DPIScale -Caption +ToolWindow
    Gui,StopedProcess:Color, 202124
    Gui,StopedProcess:Font,caaaaaa s10, Segoe UI
    DRAW_OUTLINE( "StopedProcess", 0, 0,200, 80, "111111" , "111111",5 )
    Gui,StopedProcess:Add,Text,x5 y5 w190 h25 gMove_Window,
    Gui,StopedProcess:Add,Text,x5 y5 w190 h25 BackgroundTrans Center, % "The operation " StopedOperation
	Gui,StopedProcess:Add,Text,x5 y20 w190 h25 BackgroundTrans Center, has stoped
    pButton.Push(New Progress_Button("StopedProcess",pButton.Length()+1,"StopedNowProceed",75,43,55,25,"444444","777777","111111","003366","003388","Proceed",3))
	Gui,StopedProcess:Show, w200 h80, Proceed
}

Create_Tray_Menu(){
	Menu, Tray, NoStandard
	Menu, Tray, Color,,
	Menu, Tray, Tip, % "DankFarmer_" version
	Menu, Tray, Add, DankFarmer,GuiRestore
	Menu, Tray, Add, Quit, CloseApp
	Menu, Tray, default, DankFarmer
	Menu, Tray, Click, 1
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
return
IfInString, Clipboard, TriggerPhrase, {
	Send, response
	Send, {return}
}



SendLButtonWithMousePos(){
	Gui, Submit, NoHide
	IF (!X1) OR (!Y1)
		Return	
	MouseClick, Left, % X1, % Y1, 1, 1
}

SetMousePos(){
	SetTimer, ToolTipFollowMouse, On
	ToolTip, Waiting for click...
	KeyWait, Lbutton, Down
	MouseGetPos, MouseX, MouseY
	GuiControl,,X1, % MouseX
	GuiControl,,Y1, % MouseY
	SetTimer, ToolTipFollowMouse, Off
	ToolTip
}
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Switching beetween GUI Windows   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CORE_Window(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
	Gui,CORE:show
    Gui,START:hide
    Gui,CONFIG:hide
	Gui,C1:show
}
START_Window(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
	Gui,CORE:hide
    Gui,START:show
    Gui,CONFIG:hide
}
CONFIG_Window(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,CORE:hide
    Gui,START:hide
    Gui,CONFIG:show
}

Help1(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
	Gui,C1:show
    Gui,C2:hide
    Gui,C3:hide
	Gui,C4:hide
}
Help2(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,C1:hide
    Gui,C2:show
    Gui,C3:hide
	Gui,C4:hide
}
Help3(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,C1:hide
    Gui,C2:hide
    Gui,C3:show
	Gui,C4:hide
}
Help4(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,C1:hide
    Gui,C2:hide
    Gui,C3:hide
	Gui,C4:show
}

VerifyExit_Window(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Main = Exit?
	Gui,VerifyExit:show
}


;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Open links   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Latest_Version(){
	Try    {
     Run,https://www.autohotkey.com/boards/viewtopic.php?f=6&t=73836
    }
}


;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Miscelenaeous   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GuiHide(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
	if(MinimizeButtonMinimizesToTray = "Off"){
		    Gui,1: Show, Minimize
	}else if(MinimizeButtonMinimizesToTray = "On"){
			Gui,1:Hide
	}
	
}
GuiRestore(){
	Gui,1:Show
    WinShow
    WinRestore
}
Move_Window(){
    POSTMESSAGE , 0XA1 , 2
    SETTIMER , WATCH_HOVER , OFF
    WHILE( GETKEYSTATE( "LBUTTON" ) )
        SLEEP , 10
    SETTIMER , WATCH_HOVER , ON
}
CloseApp(){
	ExitApp
}
GuiContextMenu:
    if(Tog:=!Tog){
        Gui,1:Show,h45
	}
    else
	{
        Gui,1:Show,h600
	}
    return
VerifiedCancel(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,VerifyExit:destroy
    Main = Main
}
VerifiedClose(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    ExitApp
}
StopedNowProceed(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
	Gui,StopedProcess:Hide
}


StartMinimized(){
	if(StartMinimized = "Off"){
		StartMinimized = On
	}else if(StartMinimized = "On"){
		StartMinimized = Off
	}
	IniWrite_All_Variable_Values()
	return
}
StartCompacted(){
	if(StartCompacted = "Off"){
		StartCompacted = On
	}else if(StartCompacted = "On"){
		StartCompacted = Off
	}
	IniWrite_All_Variable_Values()
	return
}

MinimizeButtonMinimizesToTray(){
	if(MinimizeButtonMinimizesToTray = "Off"){
		MinimizeButtonMinimizesToTray = On
	}else if(MinimizeButtonMinimizesToTray = "On"){
		MinimizeButtonMinimizesToTray = Off
	}
	IniWrite_All_Variable_Values()
	return
}

MainWindow_AlwaysOnTop(){
	if(MainWindow_AlwaysOnTop = "Off"){
		MainWindow_AlwaysOnTop = On
	}else if(MainWindow_AlwaysOnTop = "On"){
		MainWindow_AlwaysOnTop = Off
	}
	if (MainWindow_AlwaysOnTop = "Off" and ContextMenu = 0){
		Gui, 1: -DPIScale -Caption +LastFound -AlwaysOnTop
	}else{
		Gui, 1: -DPIScale -Caption +LastFound +AlwaysOnTop
    }
	IniWrite_All_Variable_Values()
	return
}
MainWindow_ToolWindow(){
	if(MainWindow_ToolWindow = "Off"){
		MainWindow_ToolWindow = On
	}else if(MainWindow_ToolWindow = "On"){
		MainWindow_ToolWindow = Off
	}
	if (MainWindow_ToolWindow = "Off"){
		Gui, 1: -DPIScale -Caption +LastFound -ToolWindow
	}else{
		Gui, 1: -DPIScale -Caption +LastFound +ToolWindow
    }
	IniWrite_All_Variable_Values()
	return
}
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Class & Functions   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ToolTipFollowMouse(){
    MouseGetPos,MouseXpos,MouseYpos
    Process,Exist 
    hwnd:=WinExist("ahk_class tooltips_class32 ahk_pid " ErrorLevel) 
    WinGetPos,,,w,h,ahk_id %hwnd% 
    DllCall("MoveWindow","Uptr",hwnd,"Int",MouseXpos+12,"Int",MouseYpos,"Int",w,"Int",h,"Int",0)
}

DRAW_OUTLINE( GUI_NAME , X , Y , W , H , COLOR1 :="BLACK", COLOR2 := "BLACK" , THICKNESS := 1 ) {
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y " W" W " H" THICKNESS " BACKGROUND" COLOR1
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y " W" THICKNESS " H" H " BACKGROUND" COLOR1
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y + H - THICKNESS " W" W " H" THICKNESS " BACKGROUND" COLOR2
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X + W - THICKNESS " Y" Y " W" THICKNESS " H" H " BACKGROUND" COLOR2    
}

Watch_Hover(){
    global
    if(Press_active=0){
        if(Hover_On=0){
            MouseGetPos,,,,ctrl,2
            loop,% pButton.Length() {
                GuiControlGet,cName,% pButton[A_Index].Window_Name ":Name",% ctrl
                cut:=Strlen(cName)
                StringLeft,bName,cName,cut-2
                    if(bname=pButton[A_Index].Button_Name){
                        pButton[A_Index].Draw_Hover()
                        Hover_On:=1,Active_Button:=bname,win:=pButton[A_Index].Window_Name
                        return
                    }
            }
        }else if(Hover_On=1){
            MouseGetPos,,,,ctrl,2
            GuiControlGet,cName,%win%:Name,% ctrl
            cut:=Strlen(cName)
            StringLeft,nBName,cName,cut-2
            if(NbName!=Active_Button){
                pButton[Active_Button].Draw_Default()
                    Hover_On:=0,Active_Button:=""
            }
        }
    }
}

Class Progress_Button{
	__New(Window_Name,Button_Name,Label,x,y,w,h,BC,TRC,TC1,TC2,TC3,Button_Text,Text_Offset:=0){
		This.Text_Offset:=Text_Offset,This.Window_Name:=Window_Name,This.Button_Name:=Button_Name,This.Label:=Label
		This.Button_ID1:=Button_Name "_1",This.Button_ID2:=Button_Name "_2",This.Button_ID3:=Button_Name "_3",This.Button_ID4:=Button_Name "_4"
		This.Button_Text:=Button_Text,This.X:=x,This.Y:=y,This.W:=w,This.H:=h
		This.Bottom_Color:=BC,This.Trim_Color:=TRC,This.Top_Color_1:=TC1,This.Top_Color_2:=TC2,This.Top_Color_3:=TC3
		This.Add_Button()
	}
	Add_Button(){
		global
		Gui,% This.Window_Name ":Add",Text,% "x" This.X " y" This.Y " w" This.W " h" This.H " v" This.Button_Name " g" This.Label
		Gui,% This.Window_Name ":Add",Progress,% "x" This.X " y" This.Y " w" This.W " h" This.H " Background" This.Bottom_Color " v" This.Button_ID1
		Gui,% This.Window_Name ":Add",Progress,% "x" This.X " y" This.Y " w" This.W-1 " h" This.H-1 " Background" This.Trim_Color " v" This.Button_ID2
		Gui,% This.Window_Name ":Add",Progress,% "x" This.X+1 " y" This.Y+1 " w" This.W-2 " h" This.H-2 " Background" This.Top_Color_1 " v" This.Button_ID3
		Gui,% This.Window_Name ":Add",Text,% "x" This.X+1 " y" This.Y+This.Text_Offset " w" This.W-2 "  Center BackgroundTrans v" This.Button_ID4,% This.Button_Text
	}
	Button_Press(){
		global
		Press_Active:=1
		GuiControl,% This.Window_Name ":Move",% This.Button_ID4,% "x" This.X+1 " y" This.Y+1+This.Text_Offset
		sleep,-1
		GuiControl,% This.Window_Name ":Hide",This.Button_ID2
		GuiControl,% This.Window_Name ":+Background" This.Top_Color_3,% This.Button_ID3
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID1
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID3
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID4
		While(GetKeyState("LButton"))
			Sleep, 10
		MouseGetPos,,,,ctrl,2
		GuiControlGet,cName,% win ":Name",% ctrl
		cut:=Strlen(cName)
	StringLeft,bName,cName,cut-2
		if(bname=This.Button_Name){
				GuiControl,% This.Window_Name ":Show",This.Button_ID2
				GuiControl,% This.Window_Name ":+Background" This.Top_Color_1,% This.Button_ID3
				GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID1
				GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID2
				GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID3
				GuiControl,% This.Window_Name ":Move",% This.Button_ID4,% "x" This.X " y" This.Y+This.Text_Offset
				GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID4
				%bName%.Button_Hover_On()
			        Hover_On:=0
				Active_Button:=bname
				Press_Active:=0
				sleep,10
			return true
		}
		GuiControl,% This.Window_Name ":Show",This.Button_ID2
		GuiControl,% This.Window_Name ":Move",% This.Button_ID4,% "x" This.X " y" This.Y+This.Text_Offset
		GuiControl,% This.Window_Name ":+Background" This.Top_Color_1,% This.Button_ID3
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID1
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID2
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID3
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID4
		Hover_On:=0
		Press_Active:=0
		sleep,10
		return False
	}
	Draw_Hover(){
		global
		GuiControl,% This.Window_Name ":+Background" This.Top_Color_2,% This.Button_ID3
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID4
	}
	Draw_Default(){
		global
		GuiControl,% This.Window_Name ":+Background" This.Top_Color_1,% This.Button_ID3
		GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID4
	}
}

Class Toggle_Switch_1	{
	__New(x, y, w:=19, Text1:="Text", Text2:="Text2", Window:="1", State:=0, Label:=""){
		
		This.X:=x,This.Y:=y,This.W:=w,This.H:=21,This.Text1:=Text1,This.Text2:=Text2,This.State:=State,This.Label:=Label
		This.Window:=Window,This.Create_Off_Bitmap(),This.Create_On_Bitmap(),This.Create_Trigger()
		sleep,20
		(This.State)?(SetImage(This.Hwnd,This.On_Bitmap)):(SetImage(This.Hwnd,This.Off_Bitmap))
	}
	Create_Trigger(){
		Gui , % This.Window ": Add" , Picture , % "x" This.X " y" This.Y " w" This.W " h" This.H " 0xE hwndhwnd"
		This.Hwnd:=hwnd
		BD := THIS.Switch_State.BIND( THIS ) 
		GUICONTROL +G , % This.Hwnd , % BD
		if(This.Label)
			(isFunc(This.Label))?(This.Function:=Func(This.Label))
	}
	Create_Off_Bitmap(){
		ToggleTextColor = FFD80C
		ToggleColor = 202124
		ToggleFont = Arial
		ToggleTextSize = 10
		ToggleEnabledColor = 5DBCD2
		ToggleDisabledColor = 206080
		ToggleKnobColor = 5DBCD2
		ToggleKnobColor2 = ffffff
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( This.W , 21 ) 
		 G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 2 )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleColor )
		Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
		Gdip_DeleteBrush( Brush )
		Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
		Gdip_DeletePen( Pen )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleDisabledColor ) 
		Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 25 , 11 , 5 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleDisabledColor )
		Gdip_FillRoundedRectangle( G , Brush , 2 , 5 , 23 , 9 , 4 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x8827282B" )
		Gdip_FillEllipse( G , Brush , 0 , 0 , 18 , 18 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
		Gdip_FillEllipse( G , Brush , 0 , 0 , 17 , 17 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 1 , 1 , 15 , 15 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF" ToggleKnobColor , "0xFF" ToggleKnobColor2 , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 2 , 2 , 13 , 13 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleTextColor )
		Gdip_TextToGraphics( G , This.Text1 , "s" ToggleTextSize " Bold vCenter cFF000000 x32 y-1" , ToggleFont , This.W-33, This.H )
		Gdip_TextToGraphics( G , This.Text1, "s" ToggleTextSize " Bold vCenter c" Brush " x33 y0" , ToggleFont , This.W-33, This.H )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Off_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	Create_On_Bitmap(){
		ToggleTextColor = FFD80C
		ToggleColor = 202124
		ToggleFont = Arial
		ToggleTextSize = 10
		ToggleEnabledColor = 5DBCD2
		ToggleDisabledColor = 206080
		ToggleKnobColor = 5DBCD2
		ToggleKnobColor2 = ffffff
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( This.W , 21 ) 
		 G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 2 )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleColor )
		Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
		Gdip_DeleteBrush( Brush )
		Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
		Gdip_DeletePen( Pen )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleEnabledColor ) 
		Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 25 , 11 , 5 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleEnabledColor )
		Gdip_FillRoundedRectangle( G , Brush , 2 , 5 , 23 , 9 , 4 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x8827282B" )
		Gdip_FillEllipse( G , Brush , 11 , 0 , 18 , 18 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
		Gdip_FillEllipse( G , Brush , 11 , 0 , 17 , 17 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 12 , 1 , 15 , 15 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF" ToggleKnobColor , "0xFF" ToggleKnobColor2 , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 13 , 2 , 13 , 13 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleTextColor )
		Gdip_TextToGraphics( G , This.Text2 , "s" ToggleTextSize " Bold vCenter cFF000000 x32 y-1" , ToggleFont , This.W-33, This.H )
		Gdip_TextToGraphics( G , This.Text2 , "s" ToggleTextSize " Bold vCenter c" Brush " x33 y0" , ToggleFont , This.W-33, This.H )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.On_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	Switch_State(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		(This.State:=!This.State)?(SetImage(This.Hwnd,This.On_Bitmap)):(SetImage(This.Hwnd,This.Off_Bitmap))
		if(This.Function){
			This.Function.Call()
		}else if(This.Label){
			gosub,% This.Lab
	    }
	}
}
; Chrome.ahk v1.2
; Copyright GeekDude 2018
; https://github.com/G33kDude/Chrome.ahk
class Chrome
{
	static DebugPort := 9222
	
	/*
		Escape a string in a manner suitable for command line parameters
	*/
	CliEscape(Param)
	{
		return """" RegExReplace(Param, "(\\*)""", "$1$1\""") """"
	}
	
	/*
		Finds instances of chrome in debug mode and the ports they're running
		on. If no instances are found, returns a false value. If one or more
		instances are found, returns an associative array where the keys are
		the ports, and the values are the full command line texts used to start
		the processes.
		
		One example of how this may be used would be to open chrome on a
		different port if an instance of chrome is already open on the port
		you wanted to used.
		
		```
		; If the wanted port is taken, use the largest taken port plus one
		DebugPort := 9222
		if (Chromes := Chrome.FindInstances()).HasKey(DebugPort)
			DebugPort := Chromes.MaxIndex() + 1
		ChromeInst := new Chrome(ProfilePath,,,, DebugPort)
		```
		
		Another use would be to scan for running instances and attach to one
		instead of starting a new instance.
		
		```
		if (Chromes := Chrome.FindInstances())
			ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
		else
			ChromeInst := new Chrome(ProfilePath)
		```
	*/
	FindInstances()
	{
		static Needle := "--remote-debugging-port=(\d+)"
		Out := {}
		for Item in ComObjGet("winmgmts:")
			.ExecQuery("SELECT CommandLine FROM Win32_Process"
			. " WHERE Name = 'chrome.exe'")
			if RegExMatch(Item.CommandLine, Needle, Match)
				Out[Match1] := Item.CommandLine
		return Out.MaxIndex() ? Out : False
	}
	
	/*
		ProfilePath - Path to the user profile directory to use. Will use the standard if left blank.
		URLs        - The page or array of pages for Chrome to load when it opens
		Flags       - Additional flags for chrome when launching
		ChromePath  - Path to chrome.exe, will detect from start menu when left blank
		DebugPort   - What port should Chrome's remote debugging server run on
	*/
	__New(ProfilePath:="", URLs:="about:blank", Flags:="", ChromePath:="", DebugPort:="")
	{
		; Verify ProfilePath
		if (ProfilePath != "" && !InStr(FileExist(ProfilePath), "D"))
			throw Exception("The given ProfilePath does not exist")
		this.ProfilePath := ProfilePath
		
		; Verify ChromePath
		if (ChromePath == "")
			FileGetShortcut, %A_StartMenuCommon%\Programs\Google Chrome.lnk, ChromePath
		if (ChromePath == "")
			RegRead, ChromePath, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Pahs\chrome.exe
		if !FileExist(ChromePath)
			throw Exception("Chrome could not be found")
		this.ChromePath := ChromePath
		
		; Verify DebugPort
		if (DebugPort != "")
		{
			if DebugPort is not integer
				throw Exception("DebugPort must be a positive integer")
			else if (DebugPort <= 0)
				throw Exception("DebugPort must be a positive integer")
			this.DebugPort := DebugPort
		}
		
		; Escape the URL(s)
		for Index, URL in IsObject(URLs) ? URLs : [URLs]
			URLString .= " " this.CliEscape(URL)
		
		Run, % this.CliEscape(ChromePath)
		. " --remote-debugging-port=" this.DebugPort
		. (ProfilePath ? " --user-data-dir=" this.CliEscape(ProfilePath) : "")
		. (Flags ? " " Flags : "")
		. URLString
		,,, OutputVarPID
		this.PID := OutputVarPID
	}
	
	/*
		End Chrome by terminating the process.
	*/
	Kill()
	{
		Process, Close, % this.PID
	}
	
	/*
		Queries chrome for a list of pages that expose a debug interface.
		In addition to standard tabs, these include pages such as extension
		configuration pages.
	*/
	GetPageList()
	{
		http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		http.open("GET", "http://127.0.0.1:" this.DebugPort "/json")
		http.send()
		return this.Jxon_Load(http.responseText)
	}
	
	/*
		Returns a connection to the debug interface of a page that matches the
		provided criteria. When multiple pages match the criteria, they appear
		ordered by how recently the pages were opened.
		
		Key        - The key from the page list to search for, such as "url" or "title"
		Value      - The value to search for in the provided key
		MatchMode  - What kind of search to use, such as "exact", "contains", "startswith", or "regex"
		Index      - If multiple pages match the given criteria, which one of them to return
		fnCallback - A function to be called whenever message is received from the page
	*/
	GetPageBy(Key, Value, MatchMode:="exact", Index:=1, fnCallback:="")
	{
		Count := 0
		for n, PageData in this.GetPageList()
		{
			if (((MatchMode = "exact" && PageData[Key] = Value) ; Case insensitive
				|| (MatchMode = "contains" && InStr(PageData[Key], Value))
				|| (MatchMode = "startswith" && InStr(PageData[Key], Value) == 1)
				|| (MatchMode = "regex" && PageData[Key] ~= Value))
				&& ++Count == Index)
				return new this.Page(PageData.webSocketDebuggerUrl, fnCallback)
		}
	}
	
	/*
		Shorthand for GetPageBy("url", Value, "startswith")
	*/
	GetPageByURL(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("url", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("title", Value, "startswith")
	*/
	GetPageByTitle(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("title", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("type", Type, "exact")
		
		The default type to search for is "page", which is the visible area of
		a normal Chrome tab.
	*/
	GetPage(Index:=1, Type:="page", fnCallback:="")
	{
		return this.GetPageBy("type", Type, "exact", Index, fnCallback)
	}
	
	/*
		Connects to the debug interface of a page given its WebSocket URL.
	*/
	class Page
	{
		Connected := False
		ID := 0
		Responses := []
		
		/*
			wsurl      - The desired page's WebSocket URL
			fnCallback - A function to be called whenever message is received
		*/
		__New(wsurl, fnCallback:="")
		{
			this.fnCallback := fnCallback
			this.BoundKeepAlive := this.Call.Bind(this, "Browser.getVersion",, False)
			
			; TODO: Throw exception on invalid objects
			if IsObject(wsurl)
				wsurl := wsurl.webSocketDebuggerUrl
			
			wsurl := StrReplace(wsurl, "localhost", "127.0.0.1")
			this.ws := {"base": this.WebSocket, "_Event": this.Event, "Parent": this}
			this.ws.__New(wsurl)
			
			while !this.Connected
				Sleep, 50
		}
		
		/*
			Calls the specified endpoint and provides it with the given
			parameters.
			
			DomainAndMethod - The endpoint domain and method name for the
			endpoint you would like to call. For example:
			PageInst.Call("Browser.close")
			PageInst.Call("Schema.getDomains")
			
			Params - An associative array of parameters to be provided to the
			endpoint. For example:
			PageInst.Call("Page.printToPDF", {"scale": 0.5 ; Numeric Value
			, "landscape": Chrome.Jxon_True() ; Boolean Value
			, "pageRanges: "1-5, 8, 11-13"}) ; String value
			PageInst.Call("Page.navigate", {"url": "https://autohotkey.com/"})
			
			WaitForResponse - Whether to block until a response is received from
			Chrome, which is necessary to receive a return value, or whether
			to continue on with the script without waiting for a response.
		*/
		Call(DomainAndMethod, Params:="", WaitForResponse:=True)
		{
			if !this.Connected
				throw Exception("Not connected to tab")
			
			; Use a temporary variable for ID in case more calls are made
			; before we receive a response.
			ID := this.ID += 1
			this.ws.Send(Chrome.Jxon_Dump({"id": ID
			, "params": Params ? Params : {}
			, "method": DomainAndMethod}))
			
			if !WaitForResponse
				return
			
			; Wait for the response
			this.responses[ID] := False
			while !this.responses[ID]
				Sleep, 50
			
			; Get the response, check if it's an error
			response := this.responses.Delete(ID)
			if (response.error)
				throw Exception("Chrome indicated error in response",, Chrome.Jxon_Dump(response.error))
			
			return response.result
		}
		
		/*
			Run some JavaScript on the page. For example:
			
			PageInst.Evaluate("alert(""I can't believe it's not IE!"");")
			PageInst.Evaluate("document.getElementsByTagName('button')[0].click();")
		*/
		Evaluate(JS)
		{
			response := this.Call("Runtime.evaluate",
			( LTrim Join
			{
				"expression": JS,
				"objectGroup": "console",
				"includeCommandLineAPI": Chrome.Jxon_True(),
				"silent": Chrome.Jxon_False(),
				"returnByValue": Chrome.Jxon_False(),
				"userGesture": Chrome.Jxon_True(),
				"awaitPromise": Chrome.Jxon_False()
			}
			))
			
			if (response.exceptionDetails)
				throw Exception(response.result.description,, Chrome.Jxon_Dump(response.exceptionDetails))
			
			return response.result
		}
		
		/*
			Waits for the page's readyState to match the DesiredState.
			
			DesiredState - The state to wait for the page's ReadyState to match
			Interval     - How often it should check whether the state matches
		*/
		WaitForLoad(DesiredState:="complete", Interval:=100)
		{
			while this.Evaluate("document.readyState").value != DesiredState
				Sleep, Interval
		}
		
		/*
			Internal function triggered when the script receives a message on
			the WebSocket connected to the page.
		*/
		Event(EventName, Event)
		{
			; If it was called from the WebSocket adjust the class context
			if this.Parent
				this := this.Parent
			
			; TODO: Handle Error events
			if (EventName == "Open")
			{
				this.Connected := True
				BoundKeepAlive := this.BoundKeepAlive
				SetTimer, %BoundKeepAlive%, 15000
			}
			else if (EventName == "Message")
			{
				data := Chrome.Jxon_Load(Event.data)
				
				; Run the callback routine
				fnCallback := this.fnCallback
				if (newData := %fnCallback%(data))
					data := newData
				
				if this.responses.HasKey(data.ID)
					this.responses[data.ID] := data
			}
			else if (EventName == "Close")
			{
				this.Disconnect()
			}
			else if (EventName == "Error")
			{
				throw Exception("Websocket Error!")
			}
		}
		
		/*
			Disconnect from the page's debug interface, allowing the instance
			to be garbage collected.
			
			This method should always be called when you are finished with a
			page or else your script will leak memory.
		*/
		Disconnect()
		{
			if !this.Connected
				return
			
			this.Connected := False
			this.ws.Delete("Parent")
			this.ws.Disconnect()
			
			BoundKeepAlive := this.BoundKeepAlive
			SetTimer, %BoundKeepAlive%, Delete
			this.Delete("BoundKeepAlive")
		}
		
		class WebSocket
		{
			__New(WS_URL)
			{
				static wb
				
				; Create an IE instance
				Gui, +hWndhOld
				Gui, New, +hWndhWnd
				this.hWnd := hWnd
				Gui, Add, ActiveX, vWB, Shell.Explorer
				Gui, %hOld%: Default
				
				; Write an appropriate document
				WB.Navigate("about:<!DOCTYPE html><meta http-equiv='X-UA-Compatible'"
				. "content='IE=edge'><body></body>")
				while (WB.ReadyState < 4)
					sleep, 50
				this.document := WB.document
				
				; Add our handlers to the JavaScript namespace
				this.document.parentWindow.ahk_savews := this._SaveWS.Bind(this)
				this.document.parentWindow.ahk_event := this._Event.Bind(this)
				this.document.parentWindow.ahk_ws_url := WS_URL
				
				; Add some JavaScript to the page to open a socket
				Script := this.document.createElement("script")
				Script.text := "ws = new WebSocket(ahk_ws_url);`n"
				. "ws.onopen = function(event){ ahk_event('Open', event); };`n"
				. "ws.onclose = function(event){ ahk_event('Close', event); };`n"
				. "ws.onerror = function(event){ ahk_event('Error', event); };`n"
				. "ws.onmessage = function(event){ ahk_event('Message', event); };"
				this.document.body.appendChild(Script)
			}
			
			; Called by the JS in response to WS events
			_Event(EventName, Event)
			{
				this["On" EventName](Event)
			}
			
			; Sends data through the WebSocket
			Send(Data)
			{
				this.document.parentWindow.ws.send(Data)
			}
			
			; Closes the WebSocket connection
			Close(Code:=1000, Reason:="")
			{
				this.document.parentWindow.ws.close(Code, Reason)
			}
			
			; Closes and deletes the WebSocket, removing
			; references so the class can be garbage collected
			Disconnect()
			{
				if this.hWnd
				{
					this.Close()
					Gui, % this.hWnd ": Destroy"
					this.hWnd := False
				}
			}
		}
	}
	
	Jxon_Load(ByRef src, args*)
	{
		static q := Chr(34)
		
		key := "", is_key := false
		stack := [ tree := [] ]
		is_arr := { (tree): 1 }
		next := q . "{[01234567890-tfn"
		pos := 0
		while ( (ch := SubStr(src, ++pos, 1)) != "" )
		{
			if InStr(" `t`n`r", ch)
				continue
			if !InStr(next, ch, true)
			{
				ln := ObjLength(StrSplit(SubStr(src, 1, pos), "`n"))
				col := pos - InStr(src, "`n",, -(StrLen(src)-pos+1))
				
				msg := Format("{}: line {} col {} (char {})"
				,   (next == "")      ? ["Extra data", ch := SubStr(src, pos)][1]
				: (next == "'")     ? "Unterminated string starting at"
				: (next == "\")     ? "Invalid \escape"
				: (next == ":")     ? "Expecting ':' delimiter"
				: (next == q)       ? "Expecting object key enclosed in double quotes"
				: (next == q . "}") ? "Expecting object key enclosed in double quotes or object closing '}'"
				: (next == ",}")    ? "Expecting ',' delimiter or object closing '}'"
				: (next == ",]")    ? "Expecting ',' delimiter or array closing ']'"
				: [ "Expecting JSON value(string, number, [true, false, null], object or array)"
				, ch := SubStr(src, pos, (SubStr(src, pos)~="[\]\},\s]|$")-1) ][1]
				, ln, col, pos)
				
				throw Exception(msg, -1, ch)
			}
			
			is_array := is_arr[obj := stack[1]]
			
			if i := InStr("{[", ch)
			{
				val := (proto := args[i]) ? new proto : {}
				is_array? ObjPush(obj, val) : obj[key] := val
				ObjInsertAt(stack, 1, val)
				
				is_arr[val] := !(is_key := ch == "{")
				next := q . (is_key ? "}" : "{[]0123456789-tfn")
			}
			
			else if InStr("}]", ch)
			{
				ObjRemoveAt(stack, 1)
				next := stack[1]==tree ? "" : is_arr[stack[1]] ? ",]" : ",}"
			}
			
			else if InStr(",:", ch)
			{
				is_key := (!is_array && ch == ",")
				next := is_key ? q : q . "{[0123456789-tfn"
			}
			
			else ; string | number | true | false | null
			{
				if (ch == q) ; string
				{
					i := pos
					while i := InStr(src, q,, i+1)
					{
						val := StrReplace(SubStr(src, pos+1, i-pos-1), "\\", "\u005C")
						static end := A_AhkVersion<"2" ? 0 : -1
						if (SubStr(val, end) != "\")
							break
					}
					if !i ? (pos--, next := "'") : 0
						continue
					
					pos := i ; update pos
					
					val := StrReplace(val,    "\/",  "/")
					, val := StrReplace(val, "\" . q,    q)
					, val := StrReplace(val,    "\b", "`b")
					, val := StrReplace(val,    "\f", "`f")
					, val := StrReplace(val,    "\n", "`n")
					, val := StrReplace(val,    "\r", "`r")
					, val := StrReplace(val,    "\t", "`t")
					
					i := 0
					while i := InStr(val, "\",, i+1)
					{
						if (SubStr(val, i+1, 1) != "u") ? (pos -= StrLen(SubStr(val, i)), next := "\") : 0
							continue 2
						
						; \uXXXX - JSON unicode escape sequence
						xxxx := Abs("0x" . SubStr(val, i+2, 4))
						if (A_IsUnicode || xxxx < 0x100)
							val := SubStr(val, 1, i-1) . Chr(xxxx) . SubStr(val, i+6)
					}
					
					if is_key
					{
						key := val, next := ":"
						continue
					}
				}
				
				else ; number | true | false | null
				{
					val := SubStr(src, pos, i := RegExMatch(src, "[\]\},\s]|$",, pos)-pos)
					
					; For numerical values, numerify integers and keep floats as is.
					; I'm not yet sure if I should numerify floats in v2.0-a ...
					static number := "number", integer := "integer"
					if val is %number%
					{
						if val is %integer%
							val += 0
					}
					; in v1.1, true,false,A_PtrSize,A_IsUnicode,A_Index,A_EventInfo,
					; SOMETIMES return strings due to certain optimizations. Since it
					; is just 'SOMETIMES', numerify to be consistent w/ v2.0-a
					else if (val == "true" || val == "false")
						val := %value% + 0
					; AHK_H has built-in null, can't do 'val := %value%' where value == "null"
					; as it would raise an exception in AHK_H(overriding built-in var)
					else if (val == "null")
						val := ""
					; any other values are invalid, continue to trigger error
					else if (pos--, next := "#")
						continue
					
					pos += i-1
				}
				
				is_array? ObjPush(obj, val) : obj[key] := val
				next := obj==tree ? "" : is_array ? ",]" : ",}"
			}
		}
		
		return tree[1]
	}
	
	Jxon_Dump(obj, indent:="", lvl:=1)
	{
		static q := Chr(34)
		
		if IsObject(obj)
		{
			static Type := Func("Type")
			if Type ? (Type.Call(obj) != "Object") : (ObjGetCapacity(obj) == "")
				throw Exception("Object type not supported.", -1, Format("<Object at 0x{:p}>", &obj))
			
			prefix := SubStr(A_ThisFunc, 1, InStr(A_ThisFunc, ".",, 0))
			fn_t := prefix "Jxon_True",  obj_t := this ? %fn_t%(this) : %fn_t%()
			fn_f := prefix "Jxon_False", obj_f := this ? %fn_f%(this) : %fn_f%()
			
			if (&obj == &obj_t)
				return "true"
			else if (&obj == &obj_f)
				return "false"
			
			is_array := 0
			for k in obj
				is_array := k == A_Index
			until !is_array
			
			static integer := "integer"
			if indent is %integer%
			{
				if (indent < 0)
					throw Exception("Indent parameter must be a postive integer.", -1, indent)
				spaces := indent, indent := ""
				Loop % spaces
					indent .= " "
			}
			indt := ""
			Loop, % indent ? lvl : 0
				indt .= indent
			
			this_fn := this ? Func(A_ThisFunc).Bind(this) : A_ThisFunc
			lvl += 1, out := "" ; Make #Warn happy
			for k, v in obj
			{
				if IsObject(k) || (k == "")
					throw Exception("Invalid object key.", -1, k ? Format("<Object at 0x{:p}>", &obj) : "<blank>")
				
				if !is_array
					out .= ( ObjGetCapacity([k], 1) ? %this_fn%(k) : q . k . q ) ;// key
				.  ( indent ? ": " : ":" ) ; token + padding
				out .= %this_fn%(v, indent, lvl) ; value
				.  ( indent ? ",`n" . indt : "," ) ; token + indent
			}
			
			if (out != "")
			{
				out := Trim(out, ",`n" . indent)
				if (indent != "")
					out := "`n" . indt . out . "`n" . SubStr(indt, StrLen(indent)+1)
			}
			
			return is_array ? "[" . out . "]" : "{" . out . "}"
		}
		
		; Number
		else if (ObjGetCapacity([obj], 1) == "")
			return obj
		
		; String (null -> not supported by AHK)
		if (obj != "")
		{
			obj := StrReplace(obj,  "\",    "\\")
			, obj := StrReplace(obj,  "/",    "\/")
			, obj := StrReplace(obj,    q, "\" . q)
			, obj := StrReplace(obj, "`b",    "\b")
			, obj := StrReplace(obj, "`f",    "\f")
			, obj := StrReplace(obj, "`n",    "\n")
			, obj := StrReplace(obj, "`r",    "\r")
			, obj := StrReplace(obj, "`t",    "\t")
			
			static needle := (A_AhkVersion<"2" ? "O)" : "") . "[^\x20-\x7e]"
			while RegExMatch(obj, needle, m)
				obj := StrReplace(obj, m[0], Format("\u{:04X}", Ord(m[0])))
		}
		
		return q . obj . q
	}
	
	Jxon_True()
	{
		static obj := {}
		return obj
	}
	
	Jxon_False()
	{
		static obj := {}
		return obj
	}
}

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Gdip   %%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Gdip standard library v1.45 by tic (Tariq Porter) 07/09/11   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Modifed by Rseding91 using fincs 64 bit compatible Gdip library 5/1/2013  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Supports: Basic, _L ANSi, _L Unicode x86 and _L Unicode x64  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UpdateLayeredWindow(hwnd, hdc, x="", y="", w="", h="", Alpha=255)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if ((x != "") && (y != ""))
VarSetCapacity(pt, 8), NumPut(x, pt, 0, "UInt"), NumPut(y, pt, 4, "UInt")
if (w = "") ||(h = "")
WinGetPos,,, w, h, ahk_id %hwnd%
return DllCall("UpdateLayeredWindow"
, Ptr, hwnd
, Ptr, 0
, Ptr, ((x = "") && (y = "")) ? 0 : &pt
, "int64*", w|h<<32
, Ptr, hdc
, "int64*", 0
, "uint", 0
, "UInt*", Alpha<<16|1<<24
, "uint", 2)
}
BitBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, Raster="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdi32\BitBlt"
, Ptr, dDC
, "int", dx
, "int", dy
, "int", dw
, "int", dh
, Ptr, sDC
, "int", sx
, "int", sy
, "uint", Raster ? Raster : 0x00CC0020)
}
StretchBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, sw, sh, Raster="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdi32\StretchBlt"
, Ptr, ddc
, "int", dx
, "int", dy
, "int", dw
, "int", dh
, Ptr, sdc
, "int", sx
, "int", sy
, "int", sw
, "int", sh
, "uint", Raster ? Raster : 0x00CC0020)
}
SetStretchBltMode(hdc, iStretchMode=4)
{
return DllCall("gdi32\SetStretchBltMode"
, A_PtrSize ? "UPtr" : "UInt", hdc
, "int", iStretchMode)
}
SetImage(hwnd, hBitmap)
{
SendMessage, 0x172, 0x0, hBitmap,, ahk_id %hwnd%
E := ErrorLevel
DeleteObject(E)
return E
}
SetSysColorToControl(hwnd, SysColor=15)
{
WinGetPos,,, w, h, ahk_id %hwnd%
bc := DllCall("GetSysColor", "Int", SysColor, "UInt")
pBrushClear := Gdip_BrushCreateSolid(0xff000000 | (bc >> 16 | bc & 0xff00 | (bc & 0xff) << 16))
pBitmap := Gdip_CreateBitmap(w, h), G := Gdip_GraphicsFromImage(pBitmap)
Gdip_FillRectangle(G, pBrushClear, 0, 0, w, h)
hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
SetImage(hwnd, hBitmap)
Gdip_DeleteBrush(pBrushClear)
Gdip_DeleteGraphics(G), Gdip_DisposeImage(pBitmap), DeleteObject(hBitmap)
return 0
}
Gdip_BitmapFromScreen(Screen=0, Raster="")
{
if (Screen = 0)
{
Sysget, x, 76
Sysget, y, 77
Sysget, w, 78
Sysget, h, 79
}
else if (SubStr(Screen, 1, 5) = "hwnd:")
{
Screen := SubStr(Screen, 6)
if !WinExist( "ahk_id " Screen)
return -2
WinGetPos,,, w, h, ahk_id %Screen%
x := y := 0
hhdc := GetDCEx(Screen, 3)
}
else if (Screen&1 != "")
{
Sysget, M, Monitor, %Screen%
x := MLeft, y := MTop, w := MRight-MLeft, h := MBottom-MTop
}
else
{
StringSplit, S, Screen, |
x := S1, y := S2, w := S3, h := S4
}
if (x = "") || (y = "") || (w = "") || (h = "")
return -1
chdc := CreateCompatibleDC(), hbm := CreateDIBSection(w, h, chdc), obm := SelectObject(chdc, hbm), hhdc := hhdc ? hhdc : GetDC()
BitBlt(chdc, 0, 0, w, h, hhdc, x, y, Raster)
ReleaseDC(hhdc)
pBitmap := Gdip_CreateBitmapFromHBITMAP(hbm)
SelectObject(chdc, obm), DeleteObject(hbm), DeleteDC(hhdc), DeleteDC(chdc)
return pBitmap
}
Gdip_BitmapFromHWND(hwnd)
{
WinGetPos,,, Width, Height, ahk_id %hwnd%
hbm := CreateDIBSection(Width, Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
PrintWindow(hwnd, hdc)
pBitmap := Gdip_CreateBitmapFromHBITMAP(hbm)
SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
return pBitmap
}
CreateRectF(ByRef RectF, x, y, w, h)
{
VarSetCapacity(RectF, 16)
NumPut(x, RectF, 0, "float"), NumPut(y, RectF, 4, "float"), NumPut(w, RectF, 8, "float"), NumPut(h, RectF, 12, "float")
}
CreateRect(ByRef Rect, x, y, w, h)
{
VarSetCapacity(Rect, 16)
NumPut(x, Rect, 0, "uint"), NumPut(y, Rect, 4, "uint"), NumPut(w, Rect, 8, "uint"), NumPut(h, Rect, 12, "uint")
}
CreateSizeF(ByRef SizeF, w, h)
{
VarSetCapacity(SizeF, 8)
NumPut(w, SizeF, 0, "float"), NumPut(h, SizeF, 4, "float")
}
CreatePointF(ByRef PointF, x, y)
{
VarSetCapacity(PointF, 8)
NumPut(x, PointF, 0, "float"), NumPut(y, PointF, 4, "float")
}
CreateDIBSection(w, h, hdc="", bpp=32, ByRef ppvBits=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
hdc2 := hdc ? hdc : GetDC()
VarSetCapacity(bi, 40, 0)
NumPut(w, bi, 4, "uint")
, NumPut(h, bi, 8, "uint")
, NumPut(40, bi, 0, "uint")
, NumPut(1, bi, 12, "ushort")
, NumPut(0, bi, 16, "uInt")
, NumPut(bpp, bi, 14, "ushort")
hbm := DllCall("CreateDIBSection"
, Ptr, hdc2
, Ptr, &bi
, "uint", 0
, A_PtrSize ? "UPtr*" : "uint*", ppvBits
, Ptr, 0
, "uint", 0, Ptr)
if !hdc
ReleaseDC(hdc2)
return hbm
}
PrintWindow(hwnd, hdc, Flags=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("PrintWindow", Ptr, hwnd, Ptr, hdc, "uint", Flags)
}
DestroyIcon(hIcon)
{
return DllCall("DestroyIcon", A_PtrSize ? "UPtr" : "UInt", hIcon)
}
PaintDesktop(hdc)
{
return DllCall("PaintDesktop", A_PtrSize ? "UPtr" : "UInt", hdc)
}
CreateCompatibleBitmap(hdc, w, h)
{
return DllCall("gdi32\CreateCompatibleBitmap", A_PtrSize ? "UPtr" : "UInt", hdc, "int", w, "int", h)
}
CreateCompatibleDC(hdc=0)
{
return DllCall("CreateCompatibleDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
SelectObject(hdc, hgdiobj)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("SelectObject", Ptr, hdc, Ptr, hgdiobj)
}
DeleteObject(hObject)
{
return DllCall("DeleteObject", A_PtrSize ? "UPtr" : "UInt", hObject)
}
GetDC(hwnd=0)
{
return DllCall("GetDC", A_PtrSize ? "UPtr" : "UInt", hwnd)
}
GetDCEx(hwnd, flags=0, hrgnClip=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("GetDCEx", Ptr, hwnd, Ptr, hrgnClip, "int", flags)
}
ReleaseDC(hdc, hwnd=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("ReleaseDC", Ptr, hwnd, Ptr, hdc)
}
DeleteDC(hdc)
{
return DllCall("DeleteDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
Gdip_LibraryVersion()
{
return 1.45
}
Gdip_LibrarySubVersion()
{
return 1.47
}
Gdip_BitmapFromBRA(ByRef BRAFromMemIn, File, Alternate=0)
{
Static FName = "ObjRelease"
if !BRAFromMemIn
return -1
Loop, Parse, BRAFromMemIn, `n
{
if (A_Index = 1)
{
StringSplit, Header, A_LoopField, |
if (Header0 != 4 || Header2 != "BRA!")
return -2
}
else if (A_Index = 2)
{
StringSplit, Info, A_LoopField, |
if (Info0 != 3)
return -3
}
else
break
}
if !Alternate
StringReplace, File, File, \, \\, All
RegExMatch(BRAFromMemIn, "mi`n)^" (Alternate ? File "\|.+?\|(\d+)\|(\d+)" : "\d+\|" File "\|(\d+)\|(\d+)") "$", FileInfo)
if !FileInfo
return -4
hData := DllCall("GlobalAlloc", "uint", 2, Ptr, FileInfo2, Ptr)
pData := DllCall("GlobalLock", Ptr, hData, Ptr)
DllCall("RtlMoveMemory", Ptr, pData, Ptr, &BRAFromMemIn+Info2+FileInfo1, Ptr, FileInfo2)
DllCall("GlobalUnlock", Ptr, hData)
DllCall("ole32\CreateStreamOnHGlobal", Ptr, hData, "int", 1, A_PtrSize ? "UPtr*" : "UInt*", pStream)
DllCall("gdiplus\GdipCreateBitmapFromStream", Ptr, pStream, A_PtrSize ? "UPtr*" : "UInt*", pBitmap)
If (A_PtrSize)
%FName%(pStream)
Else
DllCall(NumGet(NumGet(1*pStream)+8), "uint", pStream)
return pBitmap
}
Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawRectangle", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_DrawRoundedRectangle(pGraphics, pPen, x, y, w, h, r)
{
Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
E := Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h)
Gdip_ResetClip(pGraphics)
Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
Gdip_DrawEllipse(pGraphics, pPen, x, y, 2*r, 2*r)
Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y, 2*r, 2*r)
Gdip_DrawEllipse(pGraphics, pPen, x, y+h-(2*r), 2*r, 2*r)
Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
Gdip_ResetClip(pGraphics)
return E
}
Gdip_DrawEllipse(pGraphics, pPen, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawEllipse", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_DrawBezier(pGraphics, pPen, x1, y1, x2, y2, x3, y3, x4, y4)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawBezier"
, Ptr, pgraphics
, Ptr, pPen
, "float", x1
, "float", y1
, "float", x2
, "float", y2
, "float", x3
, "float", y3
, "float", x4
, "float", y4)
}
Gdip_DrawArc(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawArc"
, Ptr, pGraphics
, Ptr, pPen
, "float", x
, "float", y
, "float", w
, "float", h
, "float", StartAngle
, "float", SweepAngle)
}
Gdip_DrawPie(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawPie", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawLine(pGraphics, pPen, x1, y1, x2, y2)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawLine"
, Ptr, pGraphics
, Ptr, pPen
, "float", x1
, "float", y1
, "float", x2
, "float", y2)
}
Gdip_DrawLines(pGraphics, pPen, Points)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
return DllCall("gdiplus\GdipDrawLines", Ptr, pGraphics, Ptr, pPen, Ptr, &PointF, "int", Points0)
}
Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillRectangle"
, Ptr, pGraphics
, Ptr, pBrush
, "float", x
, "float", y
, "float", w
, "float", h)
}
Gdip_FillRoundedRectangle(pGraphics, pBrush, x, y, w, h, r)
{
Region := Gdip_GetClipRegion(pGraphics)
Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
E := Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
Gdip_SetClipRegion(pGraphics, Region, 0)
Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
Gdip_FillEllipse(pGraphics, pBrush, x, y, 2*r, 2*r)
Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y, 2*r, 2*r)
Gdip_FillEllipse(pGraphics, pBrush, x, y+h-(2*r), 2*r, 2*r)
Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
Gdip_SetClipRegion(pGraphics, Region, 0)
Gdip_DeleteRegion(Region)
return E
}
Gdip_FillPolygon(pGraphics, pBrush, Points, FillMode=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
return DllCall("gdiplus\GdipFillPolygon", Ptr, pGraphics, Ptr, pBrush, Ptr, &PointF, "int", Points0, "int", FillMode)
}
Gdip_FillPie(pGraphics, pBrush, x, y, w, h, StartAngle, SweepAngle)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillPie"
, Ptr, pGraphics
, Ptr, pBrush
, "float", x
, "float", y
, "float", w
, "float", h
, "float", StartAngle
, "float", SweepAngle)
}
Gdip_FillEllipse(pGraphics, pBrush, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillEllipse", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRegion(pGraphics, pBrush, Region)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillRegion", Ptr, pGraphics, Ptr, pBrush, Ptr, Region)
}
Gdip_FillPath(pGraphics, pBrush, Path)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillPath", Ptr, pGraphics, Ptr, pBrush, Ptr, Path)
}
Gdip_DrawImagePointsRect(pGraphics, pBitmap, Points, sx="", sy="", sw="", sh="", Matrix=1)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
if (Matrix&1 = "")
ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
else if (Matrix != 1)
ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
if (sx = "" && sy = "" && sw = "" && sh = "")
{
sx := 0, sy := 0
sw := Gdip_GetImageWidth(pBitmap)
sh := Gdip_GetImageHeight(pBitmap)
}
E := DllCall("gdiplus\GdipDrawImagePointsRect"
, Ptr, pGraphics
, Ptr, pBitmap
, Ptr, &PointF
, "int", Points0
, "float", sx
, "float", sy
, "float", sw
, "float", sh
, "int", 2
, Ptr, ImageAttr
, Ptr, 0
, Ptr, 0)
if ImageAttr
Gdip_DisposeImageAttributes(ImageAttr)
return E
}
Gdip_DrawImage(pGraphics, pBitmap, dx="", dy="", dw="", dh="", sx="", sy="", sw="", sh="", Matrix=1)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (Matrix&1 = "")
ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
else if (Matrix != 1)
ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
if (sx = "" && sy = "" && sw = "" && sh = "")
{
if (dx = "" && dy = "" && dw = "" && dh = "")
{
sx := dx := 0, sy := dy := 0
sw := dw := Gdip_GetImageWidth(pBitmap)
sh := dh := Gdip_GetImageHeight(pBitmap)
}
else
{
sx := sy := 0
sw := Gdip_GetImageWidth(pBitmap)
sh := Gdip_GetImageHeight(pBitmap)
}
}
E := DllCall("gdiplus\GdipDrawImageRectRect"
, Ptr, pGraphics
, Ptr, pBitmap
, "float", dx
, "float", dy
, "float", dw
, "float", dh
, "float", sx
, "float", sy
, "float", sw
, "float", sh
, "int", 2
, Ptr, ImageAttr
, Ptr, 0
, Ptr, 0)
if ImageAttr
Gdip_DisposeImageAttributes(ImageAttr)
return E
}
Gdip_SetImageAttributesColorMatrix(Matrix)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
VarSetCapacity(ColourMatrix, 100, 0)
Matrix := RegExReplace(RegExReplace(Matrix, "^[^\d-\.]+([\d\.])", "$1", "", 1), "[^\d-\.]+", "|")
StringSplit, Matrix, Matrix, |
Loop, 25
{
Matrix := (Matrix%A_Index% != "") ? Matrix%A_Index% : Mod(A_Index-1, 6) ? 0 : 1
NumPut(Matrix, ColourMatrix, (A_Index-1)*4, "float")
}
DllCall("gdiplus\GdipCreateImageAttributes", A_PtrSize ? "UPtr*" : "uint*", ImageAttr)
DllCall("gdiplus\GdipSetImageAttributesColorMatrix", Ptr, ImageAttr, "int", 1, "int", 1, Ptr, &ColourMatrix, Ptr, 0, "int", 0)
return ImageAttr
}
Gdip_GraphicsFromImage(pBitmap)
{
DllCall("gdiplus\GdipGetImageGraphicsContext", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
return pGraphics
}
Gdip_GraphicsFromHDC(hdc)
{
DllCall("gdiplus\GdipCreateFromHDC", A_PtrSize ? "UPtr" : "UInt", hdc, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
return pGraphics
}
Gdip_GetDC(pGraphics)
{
DllCall("gdiplus\GdipGetDC", A_PtrSize ? "UPtr" : "UInt", pGraphics, A_PtrSize ? "UPtr*" : "UInt*", hdc)
return hdc
}
Gdip_ReleaseDC(pGraphics, hdc)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipReleaseDC", Ptr, pGraphics, Ptr, hdc)
}
Gdip_GraphicsClear(pGraphics, ARGB=0x00ffffff)
{
return DllCall("gdiplus\GdipGraphicsClear", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", ARGB)
}
Gdip_BlurBitmap(pBitmap, Blur)
{
if (Blur > 100) || (Blur < 1)
return -1
sWidth := Gdip_GetImageWidth(pBitmap), sHeight := Gdip_GetImageHeight(pBitmap)
dWidth := sWidth//Blur, dHeight := sHeight//Blur
pBitmap1 := Gdip_CreateBitmap(dWidth, dHeight)
G1 := Gdip_GraphicsFromImage(pBitmap1)
Gdip_SetInterpolationMode(G1, 7)
Gdip_DrawImage(G1, pBitmap, 0, 0, dWidth, dHeight, 0, 0, sWidth, sHeight)
Gdip_DeleteGraphics(G1)
pBitmap2 := Gdip_CreateBitmap(sWidth, sHeight)
G2 := Gdip_GraphicsFromImage(pBitmap2)
Gdip_SetInterpolationMode(G2, 7)
Gdip_DrawImage(G2, pBitmap1, 0, 0, sWidth, sHeight, 0, 0, dWidth, dHeight)
Gdip_DeleteGraphics(G2)
Gdip_DisposeImage(pBitmap1)
return pBitmap2
}
Gdip_SaveBitmapToFile(pBitmap, sOutput, Quality=75)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
SplitPath, sOutput,,, Extension
if Extension not in BMP,DIB,RLE,JPG,JPEG,JPE,JFIF,GIF,TIF,TIFF,PNG
return -1
Extension := "." Extension
DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", nCount, "uint*", nSize)
VarSetCapacity(ci, nSize)
DllCall("gdiplus\GdipGetImageEncoders", "uint", nCount, "uint", nSize, Ptr, &ci)
if !(nCount && nSize)
return -2
If (A_IsUnicode){
StrGet_Name := "StrGet"
Loop, %nCount%
{
sString := %StrGet_Name%(NumGet(ci, (idx := (48+7*A_PtrSize)*(A_Index-1))+32+3*A_PtrSize), "UTF-16")
if !InStr(sString, "*" Extension)
continue
pCodec := &ci+idx
break
}
} else {
Loop, %nCount%
{
Location := NumGet(ci, 76*(A_Index-1)+44)
nSize := DllCall("WideCharToMultiByte", "uint", 0, "uint", 0, "uint", Location, "int", -1, "uint", 0, "int",  0, "uint", 0, "uint", 0)
VarSetCapacity(sString, nSize)
DllCall("WideCharToMultiByte", "uint", 0, "uint", 0, "uint", Location, "int", -1, "str", sString, "int", nSize, "uint", 0, "uint", 0)
if !InStr(sString, "*" Extension)
continue
pCodec := &ci+76*(A_Index-1)
break
}
}
if !pCodec
return -3
if (Quality != 75)
{
Quality := (Quality < 0) ? 0 : (Quality > 100) ? 100 : Quality
if Extension in .JPG,.JPEG,.JPE,.JFIF
{
DllCall("gdiplus\GdipGetEncoderParameterListSize", Ptr, pBitmap, Ptr, pCodec, "uint*", nSize)
VarSetCapacity(EncoderParameters, nSize, 0)
DllCall("gdiplus\GdipGetEncoderParameterList", Ptr, pBitmap, Ptr, pCodec, "uint", nSize, Ptr, &EncoderParameters)
Loop, % NumGet(EncoderParameters, "UInt")
{
elem := (24+(A_PtrSize ? A_PtrSize : 4))*(A_Index-1) + 4 + (pad := A_PtrSize = 8 ? 4 : 0)
if (NumGet(EncoderParameters, elem+16, "UInt") = 1) && (NumGet(EncoderParameters, elem+20, "UInt") = 6)
{
p := elem+&EncoderParameters-pad-4
NumPut(Quality, NumGet(NumPut(4, NumPut(1, p+0)+20, "UInt")), "UInt")
break
}
}
}
}
if (!A_IsUnicode)
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sOutput, "int", -1, Ptr, 0, "int", 0)
VarSetCapacity(wOutput, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sOutput, "int", -1, Ptr, &wOutput, "int", nSize)
VarSetCapacity(wOutput, -1)
if !VarSetCapacity(wOutput)
return -4
E := DllCall("gdiplus\GdipSaveImageToFile", Ptr, pBitmap, Ptr, &wOutput, Ptr, pCodec, "uint", p ? p : 0)
}
else
E := DllCall("gdiplus\GdipSaveImageToFile", Ptr, pBitmap, Ptr, &sOutput, Ptr, pCodec, "uint", p ? p : 0)
return E ? -5 : 0
}
Gdip_GetPixel(pBitmap, x, y)
{
DllCall("gdiplus\GdipBitmapGetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", x, "int", y, "uint*", ARGB)
return ARGB
}
Gdip_SetPixel(pBitmap, x, y, ARGB)
{
return DllCall("gdiplus\GdipBitmapSetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", x, "int", y, "int", ARGB)
}
Gdip_GetImageWidth(pBitmap)
{
DllCall("gdiplus\GdipGetImageWidth", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Width)
return Width
}
Gdip_GetImageHeight(pBitmap)
{
DllCall("gdiplus\GdipGetImageHeight", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Height)
return Height
}
Gdip_GetImageDimensions(pBitmap, ByRef Width, ByRef Height)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
DllCall("gdiplus\GdipGetImageWidth", Ptr, pBitmap, "uint*", Width)
DllCall("gdiplus\GdipGetImageHeight", Ptr, pBitmap, "uint*", Height)
}
Gdip_GetDimensions(pBitmap, ByRef Width, ByRef Height)
{
Gdip_GetImageDimensions(pBitmap, Width, Height)
}
Gdip_GetImagePixelFormat(pBitmap)
{
DllCall("gdiplus\GdipGetImagePixelFormat", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", Format)
return Format
}
Gdip_GetDpiX(pGraphics)
{
DllCall("gdiplus\GdipGetDpiX", A_PtrSize ? "UPtr" : "uint", pGraphics, "float*", dpix)
return Round(dpix)
}
Gdip_GetDpiY(pGraphics)
{
DllCall("gdiplus\GdipGetDpiY", A_PtrSize ? "UPtr" : "uint", pGraphics, "float*", dpiy)
return Round(dpiy)
}
Gdip_GetImageHorizontalResolution(pBitmap)
{
DllCall("gdiplus\GdipGetImageHorizontalResolution", A_PtrSize ? "UPtr" : "uint", pBitmap, "float*", dpix)
return Round(dpix)
}
Gdip_GetImageVerticalResolution(pBitmap)
{
DllCall("gdiplus\GdipGetImageVerticalResolution", A_PtrSize ? "UPtr" : "uint", pBitmap, "float*", dpiy)
return Round(dpiy)
}
Gdip_BitmapSetResolution(pBitmap, dpix, dpiy)
{
return DllCall("gdiplus\GdipBitmapSetResolution", A_PtrSize ? "UPtr" : "uint", pBitmap, "float", dpix, "float", dpiy)
}
Gdip_CreateBitmapFromFile(sFile, IconNumber=1, IconSize="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
, PtrA := A_PtrSize ? "UPtr*" : "UInt*"
SplitPath, sFile,,, ext
if ext in exe,dll
{
Sizes := IconSize ? IconSize : 256 "|" 128 "|" 64 "|" 48 "|" 32 "|" 16
BufSize := 16 + (2*(A_PtrSize ? A_PtrSize : 4))
VarSetCapacity(buf, BufSize, 0)
Loop, Parse, Sizes, |
{
DllCall("PrivateExtractIcons", "str", sFile, "int", IconNumber-1, "int", A_LoopField, "int", A_LoopField, PtrA, hIcon, PtrA, 0, "uint", 1, "uint", 0)
if !hIcon
continue
if !DllCall("GetIconInfo", Ptr, hIcon, Ptr, &buf)
{
DestroyIcon(hIcon)
continue
}
hbmMask  := NumGet(buf, 12 + ((A_PtrSize ? A_PtrSize : 4) - 4))
hbmColor := NumGet(buf, 12 + ((A_PtrSize ? A_PtrSize : 4) - 4) + (A_PtrSize ? A_PtrSize : 4))
if !(hbmColor && DllCall("GetObject", Ptr, hbmColor, "int", BufSize, Ptr, &buf))
{
DestroyIcon(hIcon)
continue
}
break
}
if !hIcon
return -1
Width := NumGet(buf, 4, "int"), Height := NumGet(buf, 8, "int")
hbm := CreateDIBSection(Width, -Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
if !DllCall("DrawIconEx", Ptr, hdc, "int", 0, "int", 0, Ptr, hIcon, "uint", Width, "uint", Height, "uint", 0, Ptr, 0, "uint", 3)
{
DestroyIcon(hIcon)
return -2
}
VarSetCapacity(dib, 104)
DllCall("GetObject", Ptr, hbm, "int", A_PtrSize = 8 ? 104 : 84, Ptr, &dib)
Stride := NumGet(dib, 12, "Int"), Bits := NumGet(dib, 20 + (A_PtrSize = 8 ? 4 : 0))
DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", Stride, "int", 0x26200A, Ptr, Bits, PtrA, pBitmapOld)
pBitmap := Gdip_CreateBitmap(Width, Height)
G := Gdip_GraphicsFromImage(pBitmap)
, Gdip_DrawImage(G, pBitmapOld, 0, 0, Width, Height, 0, 0, Width, Height)
SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
Gdip_DeleteGraphics(G), Gdip_DisposeImage(pBitmapOld)
DestroyIcon(hIcon)
}
else
{
if (!A_IsUnicode)
{
VarSetCapacity(wFile, 1024)
DllCall("kernel32\MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sFile, "int", -1, Ptr, &wFile, "int", 512)
DllCall("gdiplus\GdipCreateBitmapFromFile", Ptr, &wFile, PtrA, pBitmap)
}
else
DllCall("gdiplus\GdipCreateBitmapFromFile", Ptr, &sFile, PtrA, pBitmap)
}
return pBitmap
}
Gdip_CreateBitmapFromHBITMAP(hBitmap, Palette=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", Ptr, hBitmap, Ptr, Palette, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
return pBitmap
}
Gdip_CreateHBITMAPFromBitmap(pBitmap, Background=0xffffffff)
{
DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hbm, "int", Background)
return hbm
}
Gdip_CreateBitmapFromHICON(hIcon)
{
DllCall("gdiplus\GdipCreateBitmapFromHICON", A_PtrSize ? "UPtr" : "UInt", hIcon, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
return pBitmap
}
Gdip_CreateHICONFromBitmap(pBitmap)
{
DllCall("gdiplus\GdipCreateHICONFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hIcon)
return hIcon
}
Gdip_CreateBitmap(Width, Height, Format=0x26200A)
{
DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", 0, "int", Format, A_PtrSize ? "UPtr" : "UInt", 0, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
Return pBitmap
}
Gdip_CreateBitmapFromClipboard()
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if !DllCall("OpenClipboard", Ptr, 0)
return -1
if !DllCall("IsClipboardFormatAvailable", "uint", 8)
return -2
if !hBitmap := DllCall("GetClipboardData", "uint", 2, Ptr)
return -3
if !pBitmap := Gdip_CreateBitmapFromHBITMAP(hBitmap)
return -4
if !DllCall("CloseClipboard")
return -5
DeleteObject(hBitmap)
return pBitmap
}
Gdip_SetBitmapToClipboard(pBitmap)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
off1 := A_PtrSize = 8 ? 52 : 44, off2 := A_PtrSize = 8 ? 32 : 24
hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
DllCall("GetObject", Ptr, hBitmap, "int", VarSetCapacity(oi, A_PtrSize = 8 ? 104 : 84, 0), Ptr, &oi)
hdib := DllCall("GlobalAlloc", "uint", 2, Ptr, 40+NumGet(oi, off1, "UInt"), Ptr)
pdib := DllCall("GlobalLock", Ptr, hdib, Ptr)
DllCall("RtlMoveMemory", Ptr, pdib, Ptr, &oi+off2, Ptr, 40)
DllCall("RtlMoveMemory", Ptr, pdib+40, Ptr, NumGet(oi, off2 - (A_PtrSize ? A_PtrSize : 4), Ptr), Ptr, NumGet(oi, off1, "UInt"))
DllCall("GlobalUnlock", Ptr, hdib)
DllCall("DeleteObject", Ptr, hBitmap)
DllCall("OpenClipboard", Ptr, 0)
DllCall("EmptyClipboard")
DllCall("SetClipboardData", "uint", 8, Ptr, hdib)
DllCall("CloseClipboard")
}
Gdip_CloneBitmapArea(pBitmap, x, y, w, h, Format=0x26200A)
{
DllCall("gdiplus\GdipCloneBitmapArea"
, "float", x
, "float", y
, "float", w
, "float", h
, "int", Format
, A_PtrSize ? "UPtr" : "UInt", pBitmap
, A_PtrSize ? "UPtr*" : "UInt*", pBitmapDest)
return pBitmapDest
}
Gdip_CreatePen(ARGB, w)
{
DllCall("gdiplus\GdipCreatePen1", "UInt", ARGB, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
return pPen
}
Gdip_CreatePenFromBrush(pBrush, w)
{
DllCall("gdiplus\GdipCreatePen2", A_PtrSize ? "UPtr" : "UInt", pBrush, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
return pPen
}
Gdip_BrushCreateSolid(ARGB=0xff000000)
{
DllCall("gdiplus\GdipCreateSolidFill", "UInt", ARGB, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
return pBrush
}
Gdip_BrushCreateHatch(ARGBfront, ARGBback, HatchStyle=0)
{
DllCall("gdiplus\GdipCreateHatchBrush", "int", HatchStyle, "UInt", ARGBfront, "UInt", ARGBback, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
return pBrush
}
Gdip_CreateTextureBrush(pBitmap, WrapMode=1, x=0, y=0, w="", h="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
, PtrA := A_PtrSize ? "UPtr*" : "UInt*"
if !(w && h)
DllCall("gdiplus\GdipCreateTexture", Ptr, pBitmap, "int", WrapMode, PtrA, pBrush)
else
DllCall("gdiplus\GdipCreateTexture2", Ptr, pBitmap, "int", WrapMode, "float", x, "float", y, "float", w, "float", h, PtrA, pBrush)
return pBrush
}
Gdip_CreateLineBrush(x1, y1, x2, y2, ARGB1, ARGB2, WrapMode=1)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
CreatePointF(PointF1, x1, y1), CreatePointF(PointF2, x2, y2)
DllCall("gdiplus\GdipCreateLineBrush", Ptr, &PointF1, Ptr, &PointF2, "Uint", ARGB1, "Uint", ARGB2, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
return LGpBrush
}
Gdip_CreateLineBrushFromRect(x, y, w, h, ARGB1, ARGB2, LinearGradientMode=1, WrapMode=1)
{
CreateRectF(RectF, x, y, w, h)
DllCall("gdiplus\GdipCreateLineBrushFromRect", A_PtrSize ? "UPtr" : "UInt", &RectF, "int", ARGB1, "int", ARGB2, "int", LinearGradientMode, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
return LGpBrush
}
Gdip_CloneBrush(pBrush)
{
DllCall("gdiplus\GdipCloneBrush", A_PtrSize ? "UPtr" : "UInt", pBrush, A_PtrSize ? "UPtr*" : "UInt*", pBrushClone)
return pBrushClone
}
Gdip_DeletePen(pPen)
{
return DllCall("gdiplus\GdipDeletePen", A_PtrSize ? "UPtr" : "UInt", pPen)
}
Gdip_DeleteBrush(pBrush)
{
return DllCall("gdiplus\GdipDeleteBrush", A_PtrSize ? "UPtr" : "UInt", pBrush)
}
Gdip_DisposeImage(pBitmap)
{
return DllCall("gdiplus\GdipDisposeImage", A_PtrSize ? "UPtr" : "UInt", pBitmap)
}
Gdip_DeleteGraphics(pGraphics)
{
return DllCall("gdiplus\GdipDeleteGraphics", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_DisposeImageAttributes(ImageAttr)
{
return DllCall("gdiplus\GdipDisposeImageAttributes", A_PtrSize ? "UPtr" : "UInt", ImageAttr)
}
Gdip_DeleteFont(hFont)
{
return DllCall("gdiplus\GdipDeleteFont", A_PtrSize ? "UPtr" : "UInt", hFont)
}
Gdip_DeleteStringFormat(hFormat)
{
return DllCall("gdiplus\GdipDeleteStringFormat", A_PtrSize ? "UPtr" : "UInt", hFormat)
}
Gdip_DeleteFontFamily(hFamily)
{
return DllCall("gdiplus\GdipDeleteFontFamily", A_PtrSize ? "UPtr" : "UInt", hFamily)
}
Gdip_DeleteMatrix(Matrix)
{
return DllCall("gdiplus\GdipDeleteMatrix", A_PtrSize ? "UPtr" : "UInt", Matrix)
}
Gdip_TextToGraphics(pGraphics, Text, Options, Font="Arial", Width="", Height="", Measure=0)
{
IWidth := Width, IHeight:= Height
RegExMatch(Options, "i)X([\-\d\.]+)(p*)", xpos)
RegExMatch(Options, "i)Y([\-\d\.]+)(p*)", ypos)
RegExMatch(Options, "i)W([\-\d\.]+)(p*)", Width)
RegExMatch(Options, "i)H([\-\d\.]+)(p*)", Height)
RegExMatch(Options, "i)C(?!(entre|enter))([a-f\d]+)", Colour)
RegExMatch(Options, "i)Top|Up|Bottom|Down|vCentre|vCenter", vPos)
RegExMatch(Options, "i)NoWrap", NoWrap)
RegExMatch(Options, "i)R(\d)", Rendering)
RegExMatch(Options, "i)S(\d+)(p*)", Size)
if !Gdip_DeleteBrush(Gdip_CloneBrush(Colour2))
PassBrush := 1, pBrush := Colour2
if !(IWidth && IHeight) && (xpos2 || ypos2 || Width2 || Height2 || Size2)
return -1
Style := 0, Styles := "Regular|Bold|Italic|BoldItalic|Underline|Strikeout"
Loop, Parse, Styles, |
{
if RegExMatch(Options, "\b" A_loopField)
Style |= (A_LoopField != "StrikeOut") ? (A_Index-1) : 8
}
Align := 0, Alignments := "Near|Left|Centre|Center|Far|Right"
Loop, Parse, Alignments, |
{
if RegExMatch(Options, "\b" A_loopField)
Align |= A_Index//2.1
}
xpos := (xpos1 != "") ? xpos2 ? IWidth*(xpos1/100) : xpos1 : 0
ypos := (ypos1 != "") ? ypos2 ? IHeight*(ypos1/100) : ypos1 : 0
Width := Width1 ? Width2 ? IWidth*(Width1/100) : Width1 : IWidth
Height := Height1 ? Height2 ? IHeight*(Height1/100) : Height1 : IHeight
if !PassBrush
Colour := "0x" (Colour2 ? Colour2 : "ff000000")
Rendering := ((Rendering1 >= 0) && (Rendering1 <= 5)) ? Rendering1 : 4
Size := (Size1 > 0) ? Size2 ? IHeight*(Size1/100) : Size1 : 12
hFamily := Gdip_FontFamilyCreate(Font)
hFont := Gdip_FontCreate(hFamily, Size, Style)
FormatStyle := NoWrap ? 0x4000 | 0x1000 : 0x4000
hFormat := Gdip_StringFormatCreate(FormatStyle)
pBrush := PassBrush ? pBrush : Gdip_BrushCreateSolid(Colour)
if !(hFamily && hFont && hFormat && pBrush && pGraphics)
return !pGraphics ? -2 : !hFamily ? -3 : !hFont ? -4 : !hFormat ? -5 : !pBrush ? -6 : 0
CreateRectF(RC, xpos, ypos, Width, Height)
Gdip_SetStringFormatAlign(hFormat, Align)
Gdip_SetTextRenderingHint(pGraphics, Rendering)
ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
if vPos
{
StringSplit, ReturnRC, ReturnRC, |
if (vPos = "vCentre") || (vPos = "vCenter")
ypos += (Height-ReturnRC4)//2
else if (vPos = "Top") || (vPos = "Up")
ypos := 0
else if (vPos = "Bottom") || (vPos = "Down")
ypos := Height-ReturnRC4
CreateRectF(RC, xpos, ypos, Width, ReturnRC4)
ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
}
if !Measure
E := Gdip_DrawString(pGraphics, Text, hFont, hFormat, pBrush, RC)
if !PassBrush
Gdip_DeleteBrush(pBrush)
Gdip_DeleteStringFormat(hFormat)
Gdip_DeleteFont(hFont)
Gdip_DeleteFontFamily(hFamily)
return E ? E : ReturnRC
}
Gdip_DrawString(pGraphics, sString, hFont, hFormat, pBrush, ByRef RectF)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (!A_IsUnicode)
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, 0, "int", 0)
VarSetCapacity(wString, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
}
return DllCall("gdiplus\GdipDrawString"
, Ptr, pGraphics
, Ptr, A_IsUnicode ? &sString : &wString
, "int", -1
, Ptr, hFont
, Ptr, &RectF
, Ptr, hFormat
, Ptr, pBrush)
}
Gdip_MeasureString(pGraphics, sString, hFont, hFormat, ByRef RectF)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
VarSetCapacity(RC, 16)
if !A_IsUnicode
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, "uint", 0, "int", 0)
VarSetCapacity(wString, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
}
DllCall("gdiplus\GdipMeasureString"
, Ptr, pGraphics
, Ptr, A_IsUnicode ? &sString : &wString
, "int", -1
, Ptr, hFont
, Ptr, &RectF
, Ptr, hFormat
, Ptr, &RC
, "uint*", Chars
, "uint*", Lines)
return &RC ? NumGet(RC, 0, "float") "|" NumGet(RC, 4, "float") "|" NumGet(RC, 8, "float") "|" NumGet(RC, 12, "float") "|" Chars "|" Lines : 0
}
Gdip_SetStringFormatAlign(hFormat, Align)
{
return DllCall("gdiplus\GdipSetStringFormatAlign", A_PtrSize ? "UPtr" : "UInt", hFormat, "int", Align)
}
Gdip_StringFormatCreate(Format=0, Lang=0)
{
DllCall("gdiplus\GdipCreateStringFormat", "int", Format, "int", Lang, A_PtrSize ? "UPtr*" : "UInt*", hFormat)
return hFormat
}
Gdip_FontCreate(hFamily, Size, Style=0)
{
DllCall("gdiplus\GdipCreateFont", A_PtrSize ? "UPtr" : "UInt", hFamily, "float", Size, "int", Style, "int", 0, A_PtrSize ? "UPtr*" : "UInt*", hFont)
return hFont
}
Gdip_FontFamilyCreate(Font)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (!A_IsUnicode)
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, "uint", 0, "int", 0)
VarSetCapacity(wFont, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, Ptr, &wFont, "int", nSize)
}
DllCall("gdiplus\GdipCreateFontFamilyFromName"
, Ptr, A_IsUnicode ? &Font : &wFont
, "uint", 0
, A_PtrSize ? "UPtr*" : "UInt*", hFamily)
return hFamily
}
Gdip_CreateAffineMatrix(m11, m12, m21, m22, x, y)
{
DllCall("gdiplus\GdipCreateMatrix2", "float", m11, "float", m12, "float", m21, "float", m22, "float", x, "float", y, A_PtrSize ? "UPtr*" : "UInt*", Matrix)
return Matrix
}
Gdip_CreateMatrix()
{
DllCall("gdiplus\GdipCreateMatrix", A_PtrSize ? "UPtr*" : "UInt*", Matrix)
return Matrix
}
Gdip_CreatePath(BrushMode=0)
{
DllCall("gdiplus\GdipCreatePath", "int", BrushMode, A_PtrSize ? "UPtr*" : "UInt*", Path)
return Path
}
Gdip_AddPathEllipse(Path, x, y, w, h)
{
return DllCall("gdiplus\GdipAddPathEllipse", A_PtrSize ? "UPtr" : "UInt", Path, "float", x, "float", y, "float", w, "float", h)
}
Gdip_AddPathPolygon(Path, Points)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
return DllCall("gdiplus\GdipAddPathPolygon", Ptr, Path, Ptr, &PointF, "int", Points0)
}
Gdip_DeletePath(Path)
{
return DllCall("gdiplus\GdipDeletePath", A_PtrSize ? "UPtr" : "UInt", Path)
}
Gdip_SetTextRenderingHint(pGraphics, RenderingHint)
{
return DllCall("gdiplus\GdipSetTextRenderingHint", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", RenderingHint)
}
Gdip_SetInterpolationMode(pGraphics, InterpolationMode)
{
return DllCall("gdiplus\GdipSetInterpolationMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", InterpolationMode)
}
Gdip_SetSmoothingMode(pGraphics, SmoothingMode)
{
return DllCall("gdiplus\GdipSetSmoothingMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", SmoothingMode)
}
Gdip_SetCompositingMode(pGraphics, CompositingMode=0)
{
return DllCall("gdiplus\GdipSetCompositingMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", CompositingMode)
}
Gdip_Startup()
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if !DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
DllCall("LoadLibrary", "str", "gdiplus")
VarSetCapacity(si, A_PtrSize = 8 ? 24 : 16, 0), si := Chr(1)
DllCall("gdiplus\GdiplusStartup", A_PtrSize ? "UPtr*" : "uint*", pToken, Ptr, &si, Ptr, 0)
return pToken
}
Gdip_Shutdown(pToken)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
DllCall("gdiplus\GdiplusShutdown", Ptr, pToken)
if hModule := DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
DllCall("FreeLibrary", Ptr, hModule)
return 0
}
Gdip_RotateWorldTransform(pGraphics, Angle, MatrixOrder=0)
{
return DllCall("gdiplus\GdipRotateWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", Angle, "int", MatrixOrder)
}
Gdip_ScaleWorldTransform(pGraphics, x, y, MatrixOrder=0)
{
return DllCall("gdiplus\GdipScaleWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "int", MatrixOrder)
}
Gdip_TranslateWorldTransform(pGraphics, x, y, MatrixOrder=0)
{
return DllCall("gdiplus\GdipTranslateWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "int", MatrixOrder)
}
Gdip_ResetWorldTransform(pGraphics)
{
return DllCall("gdiplus\GdipResetWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_GetRotatedTranslation(Width, Height, Angle, ByRef xTranslation, ByRef yTranslation)
{
pi := 3.14159, TAngle := Angle*(pi/180)
Bound := (Angle >= 0) ? Mod(Angle, 360) : 360-Mod(-Angle, -360)
if ((Bound >= 0) && (Bound <= 90))
xTranslation := Height*Sin(TAngle), yTranslation := 0
else if ((Bound > 90) && (Bound <= 180))
xTranslation := (Height*Sin(TAngle))-(Width*Cos(TAngle)), yTranslation := -Height*Cos(TAngle)
else if ((Bound > 180) && (Bound <= 270))
xTranslation := -(Width*Cos(TAngle)), yTranslation := -(Height*Cos(TAngle))-(Width*Sin(TAngle))
else if ((Bound > 270) && (Bound <= 360))
xTranslation := 0, yTranslation := -Width*Sin(TAngle)
}
Gdip_GetRotatedDimensions(Width, Height, Angle, ByRef RWidth, ByRef RHeight)
{
pi := 3.14159, TAngle := Angle*(pi/180)
if !(Width && Height)
return -1
RWidth := Ceil(Abs(Width*Cos(TAngle))+Abs(Height*Sin(TAngle)))
RHeight := Ceil(Abs(Width*Sin(TAngle))+Abs(Height*Cos(Tangle)))
}
Gdip_ImageRotateFlip(pBitmap, RotateFlipType=1)
{
return DllCall("gdiplus\GdipImageRotateFlip", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", RotateFlipType)
}
Gdip_SetClipRect(pGraphics, x, y, w, h, CombineMode=0)
{
return DllCall("gdiplus\GdipSetClipRect",  A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "float", w, "float", h, "int", CombineMode)
}
Gdip_SetClipPath(pGraphics, Path, CombineMode=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipSetClipPath", Ptr, pGraphics, Ptr, Path, "int", CombineMode)
}
Gdip_ResetClip(pGraphics)
{
return DllCall("gdiplus\GdipResetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_GetClipRegion(pGraphics)
{
Region := Gdip_CreateRegion()
DllCall("gdiplus\GdipGetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics, "UInt*", Region)
return Region
}
Gdip_SetClipRegion(pGraphics, Region, CombineMode=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipSetClipRegion", Ptr, pGraphics, Ptr, Region, "int", CombineMode)
}
Gdip_CreateRegion()
{
DllCall("gdiplus\GdipCreateRegion", "UInt*", Region)
return Region
}
Gdip_DeleteRegion(Region)
{
return DllCall("gdiplus\GdipDeleteRegion", A_PtrSize ? "UPtr" : "UInt", Region)
}
Gdip_LockBits(pBitmap, x, y, w, h, ByRef Stride, ByRef Scan0, ByRef BitmapData, LockMode = 3, PixelFormat = 0x26200a)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
CreateRect(Rect, x, y, w, h)
VarSetCapacity(BitmapData, 16+2*(A_PtrSize ? A_PtrSize : 4), 0)
E := DllCall("Gdiplus\GdipBitmapLockBits", Ptr, pBitmap, Ptr, &Rect, "uint", LockMode, "int", PixelFormat, Ptr, &BitmapData)
Stride := NumGet(BitmapData, 8, "Int")
Scan0 := NumGet(BitmapData, 16, Ptr)
return E
}
Gdip_UnlockBits(pBitmap, ByRef BitmapData)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("Gdiplus\GdipBitmapUnlockBits", Ptr, pBitmap, Ptr, &BitmapData)
}
Gdip_SetLockBitPixel(ARGB, Scan0, x, y, Stride)
{
Numput(ARGB, Scan0+0, (x*4)+(y*Stride), "UInt")
}
Gdip_GetLockBitPixel(Scan0, x, y, Stride)
{
return NumGet(Scan0+0, (x*4)+(y*Stride), "UInt")
}
Gdip_PixelateBitmap(pBitmap, ByRef pBitmapOut, BlockSize)
{
static PixelateBitmap
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (!PixelateBitmap)
{
if A_PtrSize != 8
MCode_PixelateBitmap =
		(LTrim Join
		558BEC83EC3C8B4514538B5D1C99F7FB56578BC88955EC894DD885C90F8E830200008B451099F7FB8365DC008365E000894DC88955F08945E833FF897DD4
		397DE80F8E160100008BCB0FAFCB894DCC33C08945F88945FC89451C8945143BD87E608B45088D50028BC82BCA8BF02BF2418945F48B45E02955F4894DC4
		8D0CB80FAFCB03CA895DD08BD1895DE40FB64416030145140FB60201451C8B45C40FB604100145FC8B45F40FB604020145F883C204FF4DE475D6034D18FF
		4DD075C98B4DCC8B451499F7F98945148B451C99F7F989451C8B45FC99F7F98945FC8B45F899F7F98945F885DB7E648B450C8D50028BC82BCA83C103894D
		C48BC82BCA41894DF48B4DD48945E48B45E02955E48D0C880FAFCB03CA895DD08BD18BF38A45148B7DC48804178A451C8B7DF488028A45FC8804178A45F8
		8B7DE488043A83C2044E75DA034D18FF4DD075CE8B4DCC8B7DD447897DD43B7DE80F8CF2FEFFFF837DF0000F842C01000033C08945F88945FC89451C8945
		148945E43BD87E65837DF0007E578B4DDC034DE48B75E80FAF4D180FAFF38B45088D500203CA8D0CB18BF08BF88945F48B45F02BF22BFA2955F48945CC0F
		B6440E030145140FB60101451C0FB6440F010145FC8B45F40FB604010145F883C104FF4DCC75D8FF45E4395DE47C9B8B4DF00FAFCB85C9740B8B451499F7
		F9894514EB048365140033F63BCE740B8B451C99F7F989451CEB0389751C3BCE740B8B45FC99F7F98945FCEB038975FC3BCE740B8B45F899F7F98945F8EB
		038975F88975E43BDE7E5A837DF0007E4C8B4DDC034DE48B75E80FAF4D180FAFF38B450C8D500203CA8D0CB18BF08BF82BF22BFA2BC28B55F08955CC8A55
		1488540E038A551C88118A55FC88540F018A55F888140183C104FF4DCC75DFFF45E4395DE47CA68B45180145E0015DDCFF4DC80F8594FDFFFF8B451099F7
		FB8955F08945E885C00F8E450100008B45EC0FAFC38365DC008945D48B45E88945CC33C08945F88945FC89451C8945148945103945EC7E6085DB7E518B4D
		D88B45080FAFCB034D108D50020FAF4D18034DDC8BF08BF88945F403CA2BF22BFA2955F4895DC80FB6440E030145140FB60101451C0FB6440F010145FC8B
		45F40FB604080145F883C104FF4DC875D8FF45108B45103B45EC7CA08B4DD485C9740B8B451499F7F9894514EB048365140033F63BCE740B8B451C99F7F9
		89451CEB0389751C3BCE740B8B45FC99F7F98945FCEB038975FC3BCE740B8B45F899F7F98945F8EB038975F88975103975EC7E5585DB7E468B4DD88B450C
		0FAFCB034D108D50020FAF4D18034DDC8BF08BF803CA2BF22BFA2BC2895DC88A551488540E038A551C88118A55FC88540F018A55F888140183C104FF4DC8
		75DFFF45108B45103B45EC7CAB8BC3C1E0020145DCFF4DCC0F85CEFEFFFF8B4DEC33C08945F88945FC89451C8945148945103BC87E6C3945F07E5C8B4DD8
		8B75E80FAFCB034D100FAFF30FAF4D188B45088D500203CA8D0CB18BF08BF88945F48B45F02BF22BFA2955F48945C80FB6440E030145140FB60101451C0F
		B6440F010145FC8B45F40FB604010145F883C104FF4DC875D833C0FF45108B4DEC394D107C940FAF4DF03BC874068B451499F7F933F68945143BCE740B8B
		451C99F7F989451CEB0389751C3BCE740B8B45FC99F7F98945FCEB038975FC3BCE740B8B45F899F7F98945F8EB038975F88975083975EC7E63EB0233F639
		75F07E4F8B4DD88B75E80FAFCB034D080FAFF30FAF4D188B450C8D500203CA8D0CB18BF08BF82BF22BFA2BC28B55F08955108A551488540E038A551C8811
		8A55FC88540F018A55F888140883C104FF4D1075DFFF45088B45083B45EC7C9F5F5E33C05BC9C21800
)
else
MCode_PixelateBitmap =
		(LTrim Join
		4489442418488954241048894C24085355565741544155415641574883EC28418BC1448B8C24980000004C8BDA99488BD941F7F9448BD0448BFA8954240C
		448994248800000085C00F8E9D020000418BC04533E4458BF299448924244C8954241041F7F933C9898C24980000008BEA89542404448BE889442408EB05
		4C8B5C24784585ED0F8E1A010000458BF1418BFD48897C2418450FAFF14533D233F633ED4533E44533ED4585C97E5B4C63BC2490000000418D040A410FAF
		C148984C8D441802498BD9498BD04D8BD90FB642010FB64AFF4403E80FB60203E90FB64AFE4883C2044403E003F149FFCB75DE4D03C748FFCB75D0488B7C
		24188B8C24980000004C8B5C2478418BC59941F7FE448BE8418BC49941F7FE448BE08BC59941F7FE8BE88BC69941F7FE8BF04585C97E4048639C24900000
		004103CA4D8BC1410FAFC94863C94A8D541902488BCA498BC144886901448821408869FF408871FE4883C10448FFC875E84803D349FFC875DA8B8C249800
		0000488B5C24704C8B5C24784183C20448FFCF48897C24180F850AFFFFFF8B6C2404448B2424448B6C24084C8B74241085ED0F840A01000033FF33DB4533
		DB4533D24533C04585C97E53488B74247085ED7E42438D0C04418BC50FAF8C2490000000410FAFC18D04814863C8488D5431028BCD0FB642014403D00FB6
		024883C2044403D80FB642FB03D80FB642FA03F848FFC975DE41FFC0453BC17CB28BCD410FAFC985C9740A418BC299F7F98BF0EB0233F685C9740B418BC3
		99F7F9448BD8EB034533DB85C9740A8BC399F7F9448BD0EB034533D285C9740A8BC799F7F9448BC0EB034533C033D24585C97E4D4C8B74247885ED7E3841
		8D0C14418BC50FAF8C2490000000410FAFC18D04814863C84A8D4431028BCD40887001448818448850FF448840FE4883C00448FFC975E8FFC2413BD17CBD
		4C8B7424108B8C2498000000038C2490000000488B5C24704503E149FFCE44892424898C24980000004C897424100F859EFDFFFF448B7C240C448B842480
		000000418BC09941F7F98BE8448BEA89942498000000896C240C85C00F8E3B010000448BAC2488000000418BCF448BF5410FAFC9898C248000000033FF33
		ED33F64533DB4533D24533C04585FF7E524585C97E40418BC5410FAFC14103C00FAF84249000000003C74898488D541802498BD90FB642014403D00FB602
		4883C2044403D80FB642FB03F00FB642FA03E848FFCB75DE488B5C247041FFC0453BC77CAE85C9740B418BC299F7F9448BE0EB034533E485C9740A418BC3
		99F7F98BD8EB0233DB85C9740A8BC699F7F9448BD8EB034533DB85C9740A8BC599F7F9448BD0EB034533D24533C04585FF7E4E488B4C24784585C97E3541
		8BC5410FAFC14103C00FAF84249000000003C74898488D540802498BC144886201881A44885AFF448852FE4883C20448FFC875E941FFC0453BC77CBE8B8C
		2480000000488B5C2470418BC1C1E00203F849FFCE0F85ECFEFFFF448BAC24980000008B6C240C448BA4248800000033FF33DB4533DB4533D24533C04585
		FF7E5A488B7424704585ED7E48418BCC8BC5410FAFC94103C80FAF8C2490000000410FAFC18D04814863C8488D543102418BCD0FB642014403D00FB60248
		83C2044403D80FB642FB03D80FB642FA03F848FFC975DE41FFC0453BC77CAB418BCF410FAFCD85C9740A418BC299F7F98BF0EB0233F685C9740B418BC399
		F7F9448BD8EB034533DB85C9740A8BC399F7F9448BD0EB034533D285C9740A8BC799F7F9448BC0EB034533C033D24585FF7E4E4585ED7E42418BCC8BC541
		0FAFC903CA0FAF8C2490000000410FAFC18D04814863C8488B442478488D440102418BCD40887001448818448850FF448840FE4883C00448FFC975E8FFC2
		413BD77CB233C04883C428415F415E415D415C5F5E5D5BC3
)
VarSetCapacity(PixelateBitmap, StrLen(MCode_PixelateBitmap)//2)
Loop % StrLen(MCode_PixelateBitmap)//2
NumPut("0x" SubStr(MCode_PixelateBitmap, (2*A_Index)-1, 2), PixelateBitmap, A_Index-1, "UChar")
DllCall("VirtualProtect", Ptr, &PixelateBitmap, Ptr, VarSetCapacity(PixelateBitmap), "uint", 0x40, A_PtrSize ? "UPtr*" : "UInt*", 0)
}
Gdip_GetImageDimensions(pBitmap, Width, Height)
if (Width != Gdip_GetImageWidth(pBitmapOut) || Height != Gdip_GetImageHeight(pBitmapOut))
return -1
if (BlockSize > Width || BlockSize > Height)
return -2
E1 := Gdip_LockBits(pBitmap, 0, 0, Width, Height, Stride1, Scan01, BitmapData1)
E2 := Gdip_LockBits(pBitmapOut, 0, 0, Width, Height, Stride2, Scan02, BitmapData2)
if (E1 || E2)
return -3
E := DllCall(&PixelateBitmap, Ptr, Scan01, Ptr, Scan02, "int", Width, "int", Height, "int", Stride1, "int", BlockSize)
Gdip_UnlockBits(pBitmap, BitmapData1), Gdip_UnlockBits(pBitmapOut, BitmapData2)
return 0
}
Gdip_ToARGB(A, R, G, B)
{
return (A << 24) | (R << 16) | (G << 8) | B
}
Gdip_FromARGB(ARGB, ByRef A, ByRef R, ByRef G, ByRef B)
{
A := (0xff000000 & ARGB) >> 24
R := (0x00ff0000 & ARGB) >> 16
G := (0x0000ff00 & ARGB) >> 8
B := 0x000000ff & ARGB
}
Gdip_AFromARGB(ARGB)
{
return (0xff000000 & ARGB) >> 24
}
Gdip_RFromARGB(ARGB)
{
return (0x00ff0000 & ARGB) >> 16
}
Gdip_GFromARGB(ARGB)
{
return (0x0000ff00 & ARGB) >> 8
}
Gdip_BFromARGB(ARGB)
{
return 0x000000ff & ARGB
}
StrGetB(Address, Length=-1, Encoding=0)
{
if Length is not integer
Encoding := Length,  Length := -1
if (Address+0 < 1024)
return
if Encoding = UTF-16
Encoding = 1200
else if Encoding = UTF-8
Encoding = 65001
else if SubStr(Encoding,1,2)="CP"
Encoding := SubStr(Encoding,3)
if !Encoding
{
if (Length == -1)
Length := DllCall("lstrlen", "uint", Address)
VarSetCapacity(String, Length)
DllCall("lstrcpyn", "str", String, "uint", Address, "int", Length + 1)
}
else if Encoding = 1200
{
char_count := DllCall("WideCharToMultiByte", "uint", 0, "uint", 0x400, "uint", Address, "int", Length, "uint", 0, "uint", 0, "uint", 0, "uint", 0)
VarSetCapacity(String, char_count)
DllCall("WideCharToMultiByte", "uint", 0, "uint", 0x400, "uint", Address, "int", Length, "str", String, "int", char_count, "uint", 0, "uint", 0)
}
else if Encoding is integer
{
char_count := DllCall("MultiByteToWideChar", "uint", Encoding, "uint", 0, "uint", Address, "int", Length, "uint", 0, "int", 0)
VarSetCapacity(String, char_count * 2)
char_count := DllCall("MultiByteToWideChar", "uint", Encoding, "uint", 0, "uint", Address, "int", Length, "uint", &String, "int", char_count * 2)
String := StrGetB(&String, char_count, 1200)
}
return String
}
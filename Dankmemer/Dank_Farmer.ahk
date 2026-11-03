/*
May be of use:
https://www.autohotkey.com/boards/viewtopic.php?f=6&t=42890&start=140#p298973
https://www.autohotkey.com/boards/viewtopic.php?f=76&t=73515
*/
/*
Things to add:
-make it so if only loads url on first run
-multiple instances
-add config file
-weekly automated
-add in the weekly shopper quest buy pink, cookie, pill, bread, sand and sell everything sell alc cooldown is 8 sec
-pls settings auto lottery true
*/
#SingleInstance Force
#NoEnv
SetBatchLines -1
SetTitleMatchMode 2
SendMode Input 
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse
Main = Main
LRStab = 1
LAStab = 1
LevelStopA = 1
LevelStopR = 1
version = 0.0.2
SetTimer,Watch_Hover,10
SetTimer, ToolTipFollowMouse, 25
SetTimer,ToolTipFollowMouse,Off
global version 
global LevelStopA
global LevelStopR
global Main
global LRStab
global LAStab
global WhatStoped

global LRSpeed
global LRBetAmount
global LRSlotsAmount
global LevelWaitR1, LevelWaitR2, LevelWaitR3, LevelWaitR4, LevelWaitR5, LevelWaitR6, LevelWaitR7, LevelWaitR8, LevelWaitR9, LevelWaitR10, LevelWaitR11, LevelWaitR12, LevelWaitR13, LevelWaitR14, LevelWaitR15, LevelWaitR16, LevelWaitR17, LevelWaitR18, LevelWaitR19

global LASpeed
global LABetAmount
global LASlotsAmount
global LevelWaitA1, LevelWaitA2, LevelWaitA3, LevelWaitA4, LevelWaitA5, LevelWaitA6, LevelWaitA7, LevelWaitA8, LevelWaitA9, LevelWaitA10, LevelWaitA11, LevelWaitA12, LevelWaitA13, LevelWaitA14, LevelWaitA15, LevelWaitA16, LevelWaitA17, LevelWaitA18, LevelWaitA19

global pButton:={}
global Press_active:=0,Hover_On:=0,Active_Button
global Main_Window:={Y: 0 , W: 350 , H: 600 }
Main_Window.X:=(A_ScreenWidth-Main_Window.W)-100

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Create Gui  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Create_Main_Window(),Create_Sub_Window() ;Gui 1,2

Create_Core_Window() ;Gui 3
Create_CoreHelp1(),Create_CoreHelp2(),Create_CoreHelp3(),Create_CoreHelp4() ;Gui 9,10,11,12

Create_LevelActive_Window() ;Gui 4
Create_LevelActiveSpeed1(),Create_LevelActiveSpeed2(),Create_LevelActiveSpeed3(),Create_LevelActiveSpeed4() ;Gui 18, 19, 20, 21

Create_LevelRaw_Window() ;Gui 5
Create_LevelRawSpeed1(),Create_LevelRawSpeed2(),Create_LevelRawSpeed3(),Create_LevelRawSpeed4() ;Gui 14, 15, 16, 17

Create_SmurfActive_Window(),Create_SmurfRaw_Window() ;Gui 6,7

Create_Verify_Window() ;Gui 8
;Create_Stoped_Window() ;GUI 13

Create_Main_Window(){
    Gui, 1: +AlwaysOnTop -DPIScale -Caption +LastFound
    Winset,Transcolor,123456
    Gui, 1: Color, 123456
    Gui,1:Font,caaaaaa s10 w600 , Segoe UI
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"Move_Window",floor((Main_Window.W-150)//2),10,150,30,"444444","777777","111111","003366","BLACK","Dank Farmer",5))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"CORESUBWINDOW",15,60,25,120,"444444","777777","111111","003366","003388","C`nO`nR`nE",25))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"LEVELSUBWINDOW",15,190,25,120,"444444","777777","111111","003366","003388","L`nE`nV`nE`nL",15))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"SMURFSUBWINDOW",15,320,25,120,"444444","777777","111111","003366","003388","S`nM`nU`nR`nF",15))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"GuiHide",15,495,25,25,"444444","777777","111111","003366","003388","-",5))
    pButton.Push(New Progress_Button("1",pButton.Length()+1,"CloseRequest",15,530,25,25,"444444","777777","111111","003366","003388","X",4))
    Gui, 1: Show,% "x" Main_Window.X " y" Main_Window.Y " w" Main_Window.W " h" Main_Window.H , Dank Farmer
}

Create_Sub_Window(){
    Gui,2:+Parent1 -DPIScale -Caption
    Gui,2:Color,111111
    Gui,2:Show,x50 y45 w250 h525
}
;**********************************Core**********************************
Create_Core_Window(){
    Gui,3: +Parent2 -DPIScale -caption
    Gui,3:Color, 202124
    Gui,3:Font,Ccccccc s9, Segoe UI
    Gui,3:Add,Text,x12 y0 w100 BackgroundTrans Center cYellow, "Dank-Farmer"   
    Gui,3:Add,Text,x85 y0 w140 BackgroundTrans Center,is an application for 
    Gui,3:Add,Text,x2 y15 w236 BackgroundTrans Center,making the currency game of "Dank Memer" easier by earning coins without breaking a sweat!, it's all automated.
    DRAW_OUTLINE( 3, 10, 65, 220, 5, "000000" , "000000",5 )
    Gui,3:Add,Text,x2 y75 w100 BackgroundTrans Center cFF5E00, "Level-Spam"
    Gui,3:Add,Text,x85 y75 w140 BackgroundTrans Center,repetitively sends "Dank
    Gui,3:Add,Text,x2 y90 w236 BackgroundTrans Center,Memer" commands for you, granting xp, coins and items.
    DRAW_OUTLINE( 3, 10, 125, 220, 5, "000000" , "000000",5 )
    Gui,3:Add,Text,x2 y135 w100 BackgroundTrans Center cFF5E00, "Smurf-Spam"
    Gui,3:Add,Text,x90 y135 w140 BackgroundTrans Center,makes discord accounts
    Gui,3:Add,Text,x2 y150 w236 BackgroundTrans Center,that collects coins for "weekly", "daily" and "Shooper quest" which adds to 7k. A new account is made every 2mnts, this can produce 210k coins in 1h.
	DRAW_OUTLINE( 3, 10, 215, 85, 5, "000000" , "000000",5 )
	Gui,3:Add,Text,x105 y210 BackgroundTrans cFF5E00, Help
	DRAW_OUTLINE( 3, 145, 215, 85, 5, "000000" , "000000",5 )
    pButton.Push(New Progress_Button("3",pButton.Length()+1,"Help1",5,230,50,25,"444444","777777","111111","003366","003388","Level-A",4))
    pButton.Push(New Progress_Button("3",pButton.Length()+1,"Help2",65,230,50,25,"444444","777777","111111","003366","003388","Level-R",4))
    pButton.Push(New Progress_Button("3",pButton.Length()+1,"Help3",125,230,50,25,"444444","777777","111111","003366","003388","Smurf-A",4))
	pButton.Push(New Progress_Button("3",pButton.Length()+1,"Help4",185,230,50,25,"444444","777777","111111","003366","003388","Smurf-R",4))
	;------------------------------------------------------------------------------------------------------------------------------------------
	DRAW_OUTLINE( 3, 10, 485, 220, 5, "000000" , "000000",5 )
    Gui,3:Add,Text,x30 y495 BackgroundTrans cFF5E00, % "Version " version 
	Gui,3:Add,Text,x105 y495 BackgroundTrans ccccccc, <-->
	pButton.Push(New Progress_Button("3",pButton.Length()+1,"Latest_Version",140,493,85,20,"444444","777777","111111","003366","003388","Latest Version",4))
    Gui,3:Show,x5 y5 w240 h515
}

Create_CoreHelp1(){
    Gui,9: +Parent3 -DPIScale -caption
    Gui,9:Color, 202124
    Gui,9:Font,Ccccccc s9, Segoe UI
	Gui,9:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, I wil explain later `n 1
	Gui,9:Show,x0 y255 w240 h260
}

Create_CoreHelp2(){
    Gui,10: +Parent3 -DPIScale -caption
    Gui,10:Color, 202124
    Gui,10:Font,Ccccccc s9, Segoe UI
	Gui,10:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, I wil explain later `n 2
	Gui,10:Show,x0 y255 w240 h260
}

Create_CoreHelp3(){
    Gui,11: +Parent3 -DPIScale -caption
    Gui,11:Color, 202124
    Gui,11:Font,Ccccccc s9, Segoe UI
	Gui,11:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, Coming Soon! `n 3
	Gui,11:Show,x0 y255 w240 h260
}

Create_CoreHelp4(){
    Gui,12: +Parent3 -DPIScale -caption
    Gui,12:Color, 202124
    Gui,12:Font,Ccccccc s9, Segoe UI
	Gui,12:Add,Text,x0 y10 w240 BackgroundTrans Center cFF5E00, Coming Soon! `n 4
	Gui,12:Show,x0 y255 w240 h260
}
;**********************************Level Active**********************************
Create_LevelActive_Window(){
    Gui,4: +Parent2 -DPIScale -Caption
    Gui,4:Color, 202124
    Gui,4:Font,Ccccccc s9, Segoe UI 
    Gui,4:Add,Text,x12 y0 BackgroundTrans cYellow, "Level-Spam"
    Gui,4:Add,Text,x90 y0 BackgroundTrans cFF5E00, Start and Config settings
	DRAW_OUTLINE( 4, 10, 20, 80, 5, "000000" , "000000",5 )
	Gui,4:Add,Text,x100 y15 BackgroundTrans Center cFF5E00,Toggle
	DRAW_OUTLINE( 4, 150, 20, 80, 5, "000000" , "000000",5 )
    Gui,4:Add,Text,x65 y34 w140 BackgroundTrans Center,Input, Click to toggle
    pButton.Push(New Progress_Button("4",pButton.Length()+1,"LevelRaw",10,30,60,25,"444444","777777","111111","003366","003388","Active",4))
	;------------------------------------------------------------------------------------------------------------------------------------------
    DRAW_OUTLINE( 4, 10, 60, 80, 5, "000000" , "000000",5 )
	Gui,4:Add,Text,x94 y55 BackgroundTrans Center cFF5E00,Start/Stop
	DRAW_OUTLINE( 4, 150, 60, 80, 5, "000000" , "000000",5 )
	pButton.Push(New Progress_Button("4",pButton.Length()+1,"NewChromeInstance",10,75,100,25,"444444","777777","111111","003366","003388","Create instance",4))
    pButton.Push(New Progress_Button("4",pButton.Length()+1,"LevelActiveStart1",10,105,60,25,"444444","777777","111111","003366","003388","Start",4))
	pButton.Push(New Progress_Button("4",pButton.Length()+1,"LevelActiveStop1",10,135,60,25,"444444","777777","111111","003366","003388","Stop",4))
	;------------------------------------------------------
	DRAW_OUTLINE( 4, 10, 165, 60, 5, "000000" , "000000",5 )
	Gui,4:Add,Text,x75 y160 BackgroundTrans Center cFF5E00,Gamble Amount
	DRAW_OUTLINE( 4, 170, 165, 60, 5, "000000" , "000000",5 )
	Gui,4:Add,Text,x10 y180 BackgroundTrans, Bet
    Gui,4:Add,Edit,x30 y180 w30 h20 BackgroundTrans vLABetAmount cRed, 10
    pButton.Push(New Progress_Button("4",pButton.Length()+1,"Save",65,175,30,25,"444444","777777","111111","003366","003388","save",4))
	Gui,4:Add,Text,x135 y180 BackgroundTrans, Slots
    Gui,4:Add,Edit,x165 y180 w30 h20 BackgroundTrans vLASlotsAmount cRed, 10
    pButton.Push(New Progress_Button("4",pButton.Length()+1,"Save",200,175,30,25,"444444","777777","111111","003366","003388","save",4))
	;------------------------------------------------------
    DRAW_OUTLINE( 4, 10, 205, 85, 5, "000000" , "000000",5 )
	Gui,4:Add,Text,x105 y200 BackgroundTrans cFF5E00, Speed
	DRAW_OUTLINE( 4, 145, 205, 85, 5, "000000" , "000000",5 )
	Gui,4:Add,Text,x10 y225 w240 BackgroundTrans, Add 
	Gui,4:Add,Edit,x35 y220 w40 h20 BackgroundTrans vLASpeed cRed, 0
	Gui,4:Add,Text,x80 y225 w240 BackgroundTrans, ms to all
	pButton.Push(New Progress_Button("4",pButton.Length()+1,"Save",170,220,60,25,"444444","777777","111111","003366","003388","Save",4))
	DRAW_OUTLINE( 4, 10, 245, 120, 3, "000000" , "000000",3 )
	;------------------------------------------------------------------------------------------------------------------------------------------
	pButton.Push(New Progress_Button("4",pButton.Length()+1,"LevelActiveSpeedUp",10,425,35,25,"444444","777777","111111","003366","003388","Up",4))
	pButton.Push(New Progress_Button("4",pButton.Length()+1,"LevelActiveSpeedDown",10,455,35,25,"444444","777777","111111","003366","003388","Down",4))
	
	DRAW_OUTLINE( 4, 10, 485, 220, 5, "000000" , "000000",5 )
    Gui,4:Add,Text,x0 y495 w240 BackgroundTrans Center cFF5E00, % "Version " version
    Gui,4:Show,x5 y5 w240 h515  
}

Create_LevelActiveSpeed1(){
	Gui,18: +Parent4 -DPIScale -caption
    Gui,18:Color, 202124
    Gui,18:Font,Ccccccc s9, Segoe UI
	Gui,18:Add,Text,x10 y0 BackgroundTrans, Loop
	Gui,18:Add,Text,x10 y15 BackgroundTrans, % "{"
	Gui,18:Add,Text,x45 y30 BackgroundTrans, N/A
	Gui,18:Add,Text,x45 y45 BackgroundTrans, Pls Beg
	Gui,18:Add,Text,x45 y60 BackgroundTrans, Pls Pm
	Gui,18:Add,Text,x45 y75 BackgroundTrans, Wait
	Gui,18:Add,Edit,x75 y75 w40 h17 BackgroundTrans vLevelWaitA1 cRed, 750
	Gui,18:Add,Text,x45 y90 BackgroundTrans, D
	Gui,18:Add,Text,x45 y105 BackgroundTrans, Loop, 2
	Gui,18:Add,Text,x45 y120 BackgroundTrans, % "{"
	Gui,18:Add,Text,x90 y135 BackgroundTrans, Loop, 3
	Gui,18:Add,Text,x90 y150 BackgroundTrans, % "{"
	Gui,18:Add,Text,x135 y165 BackgroundTrans, Pls Bet __
	Gui,18:Add,Text,x135 y180 BackgroundTrans, Wait
	Gui,18:Add,Edit,x165 y180 w40 h17 BackgroundTrans vLevelWaitA2 cRed, 1500
	Gui,18:Add,Text,x135 y195 BackgroundTrans, Pls Slots __
	Gui,18:Add,Text,x135 y210 BackgroundTrans, Wait
	Gui,18:Add,Edit,x165 y210 w40 h17 BackgroundTrans vLevelWaitA3 cRed, 1500
	Gui,18:Show,x0 y255 w205 h260
}

Create_LevelActiveSpeed2(){
	Gui,19: +Parent4 -DPIScale -caption
    Gui,19:Color, 202124
    Gui,19:Font,Ccccccc s9, Segoe UI
	Gui,19:Add,Text,x135 y0 BackgroundTrans, Drink
	Gui,19:Add,Text,x135 y15 BackgroundTrans, Wait
	Gui,19:Add,Edit,x165 y15 w40 h17 BackgroundTrans vLevelWaitA4 cRed, 1000
	Gui,19:Add,Text,x135 y30 BackgroundTrans, B
	Gui,19:Add,Text,x135 y45 BackgroundTrans, Wait
	Gui,19:Add,Edit,x165 y45 w40 h17 BackgroundTrans vLevelWaitA5 cRed, 1000
	Gui,19:Add,Text,x135 y60 BackgroundTrans, O
	Gui,19:Add,Text,x135 y75 BackgroundTrans, Wait
	Gui,19:Add,Edit,x165 y75 w40 h17 BackgroundTrans vLevelWaitA6 cRed, 1000
	Gui,19:Add,Text,x135 y90 BackgroundTrans, M
	Gui,19:Add,Text,x135 y105 BackgroundTrans, Wait
	Gui,19:Add,Edit,x165 y105 w40 h17 BackgroundTrans vLevelWaitA7 cRed, 1000
	Gui,19:Add,Text,x135 y120 BackgroundTrans, B
	Gui,19:Add,Text,x135 y135 BackgroundTrans, Wait
	Gui,19:Add,Edit,x165 y135 w40 h17 BackgroundTrans vLevelWaitA8 cRed, 1000
	Gui,19:Add,Text,x135 y150 BackgroundTrans, D
	Gui,19:Add,Text,x135 y165 BackgroundTrans, Wait
	Gui,19:Add,Edit,x165 y165 w40 h17 BackgroundTrans vLevelWaitA9 cRed, 1000
	Gui,19:Add,Text,x135 y180 BackgroundTrans, A
	Gui,19:Add,Text,x135 y195 BackgroundTrans, Wait
	Gui,19:Add,Edit,x165 y195 w40 h17 BackgroundTrans vLevelWaitA10 cRed, 1000
	Gui,19:Add,Text,x135 y210 BackgroundTrans, N
	Gui,19:Show,x0 y255 w205 h260
}

Create_LevelActiveSpeed3(){
	Gui,20: +Parent4 -DPIScale -caption
    Gui,20:Color, 202124
    Gui,20:Font,Ccccccc s9, Segoe UI
	Gui,20:Add,Text,x135 y0 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y0 w40 h17 BackgroundTrans vLevelWaitA11 cRed, 1000
	Gui,20:Add,Text,x135 y15 BackgroundTrans, K
	Gui,20:Add,Text,x135 y30 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y30 w40 h17 BackgroundTrans vLevelWaitA12 cRed, 1000
	Gui,20:Add,Text,x135 y45 BackgroundTrans, Pls Bet __
	Gui,20:Add,Text,x135 y60 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y60 w40 h17 BackgroundTrans vLevelWaitA13 cRed, 1500
	Gui,20:Add,Text,x135 y75 BackgroundTrans, Pls Slots __
	Gui,20:Add,Text,x135 y90 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y90 w40 h17 BackgroundTrans vLevelWaitA14 cRed, 1500
	Gui,20:Add,Text,x135 y105 BackgroundTrans, Dislike
	Gui,20:Add,Text,x135 y120 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y120 w40 h17 BackgroundTrans vLevelWaitA15 cRed, 1000
	Gui,20:Add,Text,x135 y135 BackgroundTrans, Epic Gamer Moment
	Gui,20:Add,Text,x135 y150 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y150 w40 h17 BackgroundTrans vLevelWaitA16 cRed, 1000
	Gui,20:Add,Text,x135 y165 BackgroundTrans, Frogs
	Gui,20:Add,Text,x135 y180 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y180 w40 h17 BackgroundTrans vLevelWaitA17 cRed, 1000
	Gui,20:Add,Text,x135 y195 BackgroundTrans, PLs Dep All
	Gui,20:Add,Text,x135 y210 BackgroundTrans, Wait
	Gui,20:Add,Edit,x165 y210 w40 h17 BackgroundTrans vLevelWaitA18 cRed, 1000
	Gui,20:Show,x0 y255 w205 h260
}

Create_LevelActiveSpeed4(){
	Gui,21: +Parent4 -DPIScale -caption
    Gui,21:Color, 202124
    Gui,21:Font,Ccccccc s9, Segoe UI
	Gui,21:Add,Text,x135 y0 BackgroundTrans, Pls With 500
	Gui,21:Add,Text,x135 y15 BackgroundTrans, Wait
	Gui,21:Add,Edit,x165 y15 w40 h17 BackgroundTrans vLevelWaitA19 cRed, 1000
	Gui,21:Add,Text,x90 y30 BackgroundTrans, % "}"
	Gui,21:Add,Text,x90 y45 BackgroundTrans, Pls Beg
	Gui,21:Add,Text,x45 y60 BackgroundTrans, % "}"
	Gui,21:Add,Text,x10 y75 BackgroundTrans, % "}"
	Gui,21:Show,x0 y255 w205 h260
}
;**********************************Level Raw**********************************
Create_LevelRaw_Window(){
    Gui,5: +Parent2 -DPIScale -Caption
    Gui,5:Color, 202124
    Gui,5:Font,Ccccccc s9, Segoe UI 
    Gui,5:Add,Text,x12 y0 BackgroundTrans cYellow, "Level-Spam"
    Gui,5:Add,Text,x90 y0 BackgroundTrans cFF5E00, Start and Config settings
	DRAW_OUTLINE( 5, 10, 20, 80, 5, "000000" , "000000",5 )
	Gui,5:Add,Text,x100 y15 BackgroundTrans Center cFF5E00,Toggle
	DRAW_OUTLINE( 5, 150, 20, 80, 5, "000000" , "000000",5 )
    Gui,5:Add,Text,x65 y34 w140 BackgroundTrans Center,Input, Click to toggle
    pButton.Push(New Progress_Button("5",pButton.Length()+1,"LevelActive",10,30,60,25,"444444","777777","111111","003366","003388","Raw",4))
	;------------------------------------------------------------------------------------------------------------------------------------------
	DRAW_OUTLINE( 5, 10, 60, 80, 5, "000000" , "000000",5 )
	Gui,5:Add,Text,x94 y55 BackgroundTrans Center cFF5E00,Start/Stop
	DRAW_OUTLINE( 5, 150, 60, 80, 5, "000000" , "000000",5 )
	pButton.Push(New Progress_Button("5",pButton.Length()+1,"LevelRawStart1",10,75,60,25,"444444","777777","111111","003366","003388","Start",4))
	pButton.Push(New Progress_Button("5",pButton.Length()+1,"LevelRawStop1",10,105,60,25,"444444","777777","111111","003366","003388","Stop",4))
	;------------------------------------------------------
	DRAW_OUTLINE( 5, 10, 135, 60, 5, "000000" , "000000",5 )
	Gui,5:Add,Text,x75 y130 BackgroundTrans Center cFF5E00,Gamble Amount
	DRAW_OUTLINE( 5, 170, 135, 60, 5, "000000" , "000000",5 )
	Gui,5:Add,Text,x10 y150 BackgroundTrans, Bet
    Gui,5:Add,Edit,x30 y150 w30 h20 BackgroundTrans vLRBetAmount cRed, 10
    pButton.Push(New Progress_Button("5",pButton.Length()+1,"Save",65,145,30,25,"444444","777777","111111","003366","003388","save",4))
	Gui,5:Add,Text,x10 y180 BackgroundTrans, Slots
    Gui,5:Add,Edit,x40 y180 w30 h20 BackgroundTrans vLRSlotsAmount cRed, 10
    pButton.Push(New Progress_Button("5",pButton.Length()+1,"Save",75,175,30,25,"444444","777777","111111","003366","003388","save",4))
	;------------------------------------------------------
    DRAW_OUTLINE( 5, 10, 205, 85, 5, "000000" , "000000",5 )
	Gui,5:Add,Text,x105 y200 BackgroundTrans cFF5E00, Speed
	DRAW_OUTLINE( 5, 145, 205, 85, 5, "000000" , "000000",5 )
	Gui,5:Add,Text,x10 y225 w240 BackgroundTrans, Add 
	Gui,5:Add,Edit,x35 y220 w40 h20 BackgroundTrans vLRSpeed cRed, 0
	Gui,5:Add,Text,x80 y225 w240 BackgroundTrans, ms to all
	pButton.Push(New Progress_Button("5",pButton.Length()+1,"Save",170,220,60,25,"444444","777777","111111","003366","003388","Save",4))
	DRAW_OUTLINE( 5, 10, 245, 120, 3, "000000" , "000000",3 )
	;------------------------------------------------------------------------------------------------------------------------------------------
	pButton.Push(New Progress_Button("5",pButton.Length()+1,"LevelRawSpeedUp",10,425,35,25,"444444","777777","111111","003366","003388","Up",4))
	pButton.Push(New Progress_Button("5",pButton.Length()+1,"LevelRawSpeedDown",10,455,35,25,"444444","777777","111111","003366","003388","Down",4))
	
	DRAW_OUTLINE( 5, 10, 485, 220, 5, "000000" , "000000",5 )
    Gui,5:Add,Text,x0 y495 w240 BackgroundTrans Center cFF5E00, % "Version " version
    Gui,5:Show,x5 y5 w240 h515  
}

Create_LevelRawSpeed1(){
	Gui,14: +Parent5 -DPIScale -caption
    Gui,14:Color, 202124
    Gui,14:Font,Ccccccc s9, Segoe UI
	Gui,14:Add,Text,x10 y0 BackgroundTrans, Loop
	Gui,14:Add,Text,x10 y15 BackgroundTrans, % "{"
	Gui,14:Add,Text,x45 y30 BackgroundTrans, Click (to keep window active)
	Gui,14:Add,Text,x45 y45 BackgroundTrans, Pls Beg
	Gui,14:Add,Text,x45 y60 BackgroundTrans, Pls Pm
	Gui,14:Add,Text,x45 y75 BackgroundTrans, Wait
	Gui,14:Add,Edit,x75 y75 w40 h17 BackgroundTrans vLevelWaitR1 cRed, 750
	Gui,14:Add,Text,x45 y90 BackgroundTrans, D
	Gui,14:Add,Text,x45 y105 BackgroundTrans, Loop, 2
	Gui,14:Add,Text,x45 y120 BackgroundTrans, % "{"
	Gui,14:Add,Text,x90 y135 BackgroundTrans, Loop, 3
	Gui,14:Add,Text,x90 y150 BackgroundTrans, % "{"
	Gui,14:Add,Text,x135 y165 BackgroundTrans, Pls Bet __
	Gui,14:Add,Text,x135 y180 BackgroundTrans, Wait
	Gui,14:Add,Edit,x165 y180 w40 h17 BackgroundTrans vLevelWaitR2 cRed, 1500
	Gui,14:Add,Text,x135 y195 BackgroundTrans, Pls Slots __
	Gui,14:Add,Text,x135 y210 BackgroundTrans, Wait
	Gui,14:Add,Edit,x165 y210 w40 h17 BackgroundTrans vLevelWaitR3 cRed, 1500
	Gui,14:Show,x0 y255 w205 h260
}

Create_LevelRawSpeed2(){
	Gui,15: +Parent5 -DPIScale -caption
    Gui,15:Color, 202124
    Gui,15:Font,Ccccccc s9, Segoe UI
	Gui,15:Add,Text,x135 y0 BackgroundTrans, Drink
	Gui,15:Add,Text,x135 y15 BackgroundTrans, Wait
	Gui,15:Add,Edit,x165 y15 w40 h17 BackgroundTrans vLevelWaitR4 cRed, 1000
	Gui,15:Add,Text,x135 y30 BackgroundTrans, B
	Gui,15:Add,Text,x135 y45 BackgroundTrans, Wait
	Gui,15:Add,Edit,x165 y45 w40 h17 BackgroundTrans vLevelWaitR5 cRed, 1000
	Gui,15:Add,Text,x135 y60 BackgroundTrans, O
	Gui,15:Add,Text,x135 y75 BackgroundTrans, Wait
	Gui,15:Add,Edit,x165 y75 w40 h17 BackgroundTrans vLevelWaitR6 cRed, 1000
	Gui,15:Add,Text,x135 y90 BackgroundTrans, M
	Gui,15:Add,Text,x135 y105 BackgroundTrans, Wait
	Gui,15:Add,Edit,x165 y105 w40 h17 BackgroundTrans vLevelWaitR7 cRed, 1000
	Gui,15:Add,Text,x135 y120 BackgroundTrans, B
	Gui,15:Add,Text,x135 y135 BackgroundTrans, Wait
	Gui,15:Add,Edit,x165 y135 w40 h17 BackgroundTrans vLevelWaitR8 cRed, 1000
	Gui,15:Add,Text,x135 y150 BackgroundTrans, D
	Gui,15:Add,Text,x135 y165 BackgroundTrans, Wait
	Gui,15:Add,Edit,x165 y165 w40 h17 BackgroundTrans vLevelWaitR9 cRed, 1000
	Gui,15:Add,Text,x135 y180 BackgroundTrans, A
	Gui,15:Add,Text,x135 y195 BackgroundTrans, Wait
	Gui,15:Add,Edit,x165 y195 w40 h17 BackgroundTrans vLevelWaitR10 cRed, 1000
	Gui,15:Add,Text,x135 y210 BackgroundTrans, N
	Gui,15:Show,x0 y255 w205 h260
}

Create_LevelRawSpeed3(){
	Gui,16: +Parent5 -DPIScale -caption
    Gui,16:Color, 202124
    Gui,16:Font,Ccccccc s9, Segoe UI
	Gui,16:Add,Text,x135 y0 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y0 w40 h17 BackgroundTrans vLevelWaitR11 cRed, 1000
	Gui,16:Add,Text,x135 y15 BackgroundTrans, K
	Gui,16:Add,Text,x135 y30 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y30 w40 h17 BackgroundTrans vLevelWaitR12 cRed, 1000
	Gui,16:Add,Text,x135 y45 BackgroundTrans, Pls Bet __
	Gui,16:Add,Text,x135 y60 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y60 w40 h17 BackgroundTrans vLevelWaitR13 cRed, 1500
	Gui,16:Add,Text,x135 y75 BackgroundTrans, Pls Slots __
	Gui,16:Add,Text,x135 y90 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y90 w40 h17 BackgroundTrans vLevelWaitR14 cRed, 1500
	Gui,16:Add,Text,x135 y105 BackgroundTrans, Dislike
	Gui,16:Add,Text,x135 y120 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y120 w40 h17 BackgroundTrans vLevelWaitR15 cRed, 1000
	Gui,16:Add,Text,x135 y135 BackgroundTrans, Epic Gamer Moment
	Gui,16:Add,Text,x135 y150 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y150 w40 h17 BackgroundTrans vLevelWaitR16 cRed, 1000
	Gui,16:Add,Text,x135 y165 BackgroundTrans, Frogs
	Gui,16:Add,Text,x135 y180 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y180 w40 h17 BackgroundTrans vLevelWaitR17 cRed, 1000
	Gui,16:Add,Text,x135 y195 BackgroundTrans, PLs Dep All
	Gui,16:Add,Text,x135 y210 BackgroundTrans, Wait
	Gui,16:Add,Edit,x165 y210 w40 h17 BackgroundTrans vLevelWaitR18 cRed, 1000
	Gui,16:Show,x0 y255 w205 h260
}

Create_LevelRawSpeed4(){
	Gui,17: +Parent5 -DPIScale -caption
    Gui,17:Color, 202124
    Gui,17:Font,Ccccccc s9, Segoe UI
	Gui,17:Add,Text,x135 y0 BackgroundTrans, Pls With 500
	Gui,17:Add,Text,x135 y15 BackgroundTrans, Wait
	Gui,17:Add,Edit,x165 y15 w40 h17 BackgroundTrans vLevelWaitR19 cRed, 1000
	Gui,17:Add,Text,x90 y30 BackgroundTrans, % "}"
	Gui,17:Add,Text,x90 y45 BackgroundTrans, Pls Beg
	Gui,17:Add,Text,x45 y60 BackgroundTrans, % "}"
	Gui,17:Add,Text,x10 y75 BackgroundTrans, % "}"
	Gui,17:Show,x0 y255 w205 h260
}
;**********************************Smurf Active**********************************
Create_SmurfActive_Window(){
    Gui,6: +Parent2 -DPIScale -Caption
    Gui,6:Color, 202124
    Gui,6:Font,Ccccccc s9, Segoe UI 
    Gui,6:Add,Text,x12 y0 BackgroundTrans cYellow, "Smurf-Spam"
    Gui,6:Add,Text,x90 y0 BackgroundTrans cFF5E00, Start and Config settings
	DRAW_OUTLINE( 6, 10, 20, 80, 5, "000000" , "000000",5 )
	Gui,6:Add,Text,x100 y15 BackgroundTrans Center cFF5E00,Toggle
	DRAW_OUTLINE( 6, 150, 20, 80, 5, "000000" , "000000",5 )
    Gui,6:Add,Text,x65 y34 w140 BackgroundTrans Center,Input, Click to toggle
    pButton.Push(New Progress_Button("6",pButton.Length()+1,"SmurfRaw",10,30,60,25,"444444","777777","111111","003366","003388","Active",4))
    DRAW_OUTLINE( 6, 10, 60, 220, 5, "000000" , "000000",5 )
	;------------------------------------------------------------------------------------------------------------------------------------------
	DRAW_OUTLINE( 6, 10, 485, 220, 5, "000000" , "000000",5 )
    Gui,6:Add,Text,x0 y495 w240 BackgroundTrans Center cFF5E00, % "Version " version
    Gui,6:Show,x5 y5 w240 h515  
}
;**********************************Smurf Raw**********************************
Create_SmurfRaw_Window(){
    Gui,7: +Parent2 -DPIScale -Caption
    Gui,7:Color, 202124
    Gui,7:Font,Ccccccc s9, Segoe UI 
    Gui,7:Add,Text,x12 y0 BackgroundTrans cYellow, "Smurf-Spam"
    Gui,7:Add,Text,x90 y0 BackgroundTrans cFF5E00, Start and Config settings
	DRAW_OUTLINE( 7, 10, 20, 80, 5, "000000" , "000000",5 )
	Gui,7:Add,Text,x100 y15 BackgroundTrans Center cFF5E00,Toggle
	DRAW_OUTLINE( 7, 150, 20, 80, 5, "000000" , "000000",5 )
    Gui,7:Add,Text,x65 y34 w140 BackgroundTrans Center,Input, Click to toggle
    pButton.Push(New Progress_Button("7",pButton.Length()+1,"SmurfActive",10,30,60,25,"444444","777777","111111","003366","003388","Raw",4))
    DRAW_OUTLINE( 7, 10, 60, 220, 5, "000000" , "000000",5 )
	;------------------------------------------------------------------------------------------------------------------------------------------
	DRAW_OUTLINE( 7, 10, 485, 220, 5, "000000" , "000000",5 )
    Gui,7:Add,Text,x0 y495 w240 BackgroundTrans Center cFF5E00, % "Version " version
    Gui,7:Show,x5 y5 w240 h515  
}
;**********************************Other**********************************
Create_Verify_Window(){
    Gui,8: +AlwaysOnTop -DPIScale -Caption
    Gui,8:Color, 202124
    Gui,8:Font,caaaaaa s10, Segoe UI
    DRAW_OUTLINE( 8, 0, 0,200, 80, "111111" , "111111",5 )
    Gui,8:Add,Text,x5 y5 w190 h25 gMove_Window,
    Gui,8:Add,Text,x5 y5 w190 h25 BackgroundTrans Center, Are you sure you want to exit?
    pButton.Push(New Progress_Button("8",pButton.Length()+1,"VerificationCancel",30,35,50,30,"444444","777777","111111","003366","003388","Cancel",5))
    pButton.Push(New Progress_Button("8",pButton.Length()+1,"VerifiedClose",110,35,50,30,"444444","777777","111111","003366","003388","Close",4))
}

Create_Stoped_Window(){
	Gui,13: +AlwaysOnTop -DPIScale -Caption
    Gui,13:Color, 202124
    Gui,13:Font,caaaaaa s10, Segoe UI
    DRAW_OUTLINE( 13, 0, 0,200, 80, "111111" , "111111",5 )
    Gui,13:Add,Text,x5 y5 w190 h25 gMove_Window,
    Gui,13:Add,Text,x5 y5 w190 h25 BackgroundTrans Center, % "The operation " WhatStoped
	Gui,13:Add,Text,x5 y20 w190 h25 BackgroundTrans Center, has stoped
    pButton.Push(New Progress_Button("13",pButton.Length()+1,"StopedNowProceed",75,43,55,25,"444444","777777","111111","003366","003388","Proceed",3))
	Gui,13:Show, w200 h80, Proceed
}

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Switch between Gui  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;*****************Three Main Window Tabs Switch Controls*****************
CORESUBWINDOW(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    ;Consist of 3
    GUI,3:Show
    Gui,4:Hide
    Gui,5:Hide
    Gui,6:Hide
    Gui,7:Hide
}
LEVELSUBWINDOW(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    ;Consist of 4, 5
    GUI,3:Hide
    Gui,4:Show
    Gui,5:Hide
    Gui,6:Hide
    Gui,7:Hide
}
SMURFSUBWINDOW(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    ;Consist of 6, 7
    GUI,3:Hide
    Gui,4:Hide
    Gui,5:Hide
    Gui,6:Show
    Gui,7:Hide
}
;*****************Help Tabs*****************
Help1(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    GUI,9:Show
    Gui,10:Hide
    Gui,11:Hide
    Gui,12:Hide
}
Help2(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    GUI,9:Hide
    Gui,10:Show
    Gui,11:Hide
    Gui,12:Hide
}
Help3(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    GUI,9:Hide
    Gui,10:Hide
    Gui,11:Show
    Gui,12:Hide
}
Help4(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    GUI,9:Hide
    Gui,10:Hide
    Gui,11:Hide
    Gui,12:Show
}
;*****************Level Raw Speed Tabs*****************
LevelRawSpeedUp(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    if (LRStab = 2)
    {
		GUI,14:Show
		Gui,15:Hide
		Gui,16:Hide
		Gui,17:Hide
		LRStab = 1
		return
	}
	if (LRStab = 3)
	{
		GUI,14:Hide
		Gui,15:Show
		Gui,16:Hide
		Gui,17:Hide
		LRStab = 2
		return
	}
	if (LRStab = 4)
	{
		GUI,14:Hide
		Gui,15:Hide
		Gui,16:Show
		Gui,17:Hide
		LRStab = 3
		return
	}
}
LevelRawSpeedDown(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    if (LRStab = 1)
    {
		GUI,14:Hide
		Gui,15:Show
		Gui,16:Hide
		Gui,17:Hide
		LRStab = 2
		return
	}
	if (LRStab = 2)
	{
		GUI,14:Hide
		Gui,15:Hide
		Gui,16:Show
		Gui,17:Hide
		LRStab = 3
		return
	}
	if (LRStab = 3)
	{
		GUI,14:Hide
		Gui,15:Hide
		Gui,16:Hide
		Gui,17:Show
		LRStab = 4
	}
}
;*****************Level Active Speed Tabs*****************
LevelActiveSpeedUp(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    if (LAStab = 2)
    {
		GUI,18:Show
		Gui,19:Hide
		Gui,20:Hide
		Gui,21:Hide
		LAStab = 1
		return
	}
	if (LAStab = 3)
	{
		GUI,18:Hide
		Gui,19:Show
		Gui,20:Hide
		Gui,21:Hide
		LAStab = 2
		return
	}
	if (LAStab = 4)
	{
		GUI,18:Hide
		Gui,19:Hide
		Gui,20:Show
		Gui,21:Hide
		LAStab = 3
		return
	}
}
LevelActiveSpeedDown(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    if (LAStab = 1)
    {
		GUI,18:Hide
		Gui,19:Show
		Gui,20:Hide
		Gui,21:Hide
		LAStab = 2
		return
	}
	if (LAStab = 2)
	{
		GUI,18:Hide
		Gui,19:Hide
		Gui,20:Show
		Gui,21:Hide
		LAStab = 3
		return
	}
	if (LAStab = 3)
	{
		GUI,18:Hide
		Gui,19:Hide
		Gui,20:Hide
		Gui,21:Show
		LRStab = 4
	}
}
;*****************Smurf-Switch beetween Active and Raw input*****************
LevelActive(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,4:Show
    Gui,5:Hide
}
LevelRaw(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,5:Show
    Gui,4:Hide
}
;*****************Level-Switch beetween Active and Raw input*****************
SmurfActive(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,6:Show
    Gui,7:Hide
}
SmurfRaw(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,7:Show
    Gui,6:Hide
}
;*****************Confirm to exit window labels*****************
CloseRequest(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Main = Exit?
    Gui,8:Show, w200 h80, Exit?
}
VerificationCancel(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,8:Hide
    Main = Main
}
VerifiedClose(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    ExitApp
}
;*****************Proceed from stoped*****************
StopedNowProceed(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
	Gui,13:Destroy
}

;*****************Gui, Submit, NoHide*****************
Save:
	Gui,1: Submit, NoHide
	Gui,2: Submit, NoHide
	Gui,3: Submit, NoHide
	Gui,4: Submit, NoHide
	Gui,5: Submit, NoHide
	Gui,6: Submit, NoHide
	Gui,7: Submit, NoHide
	Gui,8: Submit, NoHide
	Gui,9: Submit, NoHide
	Gui,10: Submit, NoHide
	Gui,11: Submit, NoHide
	Gui,12: Submit, NoHide
	Gui,13: Submit, NoHide
	Gui,14: Submit, NoHide
	Gui,15: Submit, NoHide
	Gui,16: Submit, NoHide
	Gui,17: Submit, NoHide
	Gui,18: Submit, NoHide
	Gui,19: Submit, NoHide
	Gui,20: Submit, NoHide
	Gui,21: Submit, NoHide
return
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Funtinality  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;*************************************************************** Level Active *************************************************************
;*****************New Chrome Instance*****************
NewChromeInstance:
GoSub, Save
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
	try
		Page1.Call("Browser.close") ; Fails when running headless
	catch
		ChromeInst.Kill()
	Page1.Disconnect()
    url:= "https://discordapp.com/"

    ; --- Create a new headless Chrome instance ---
    FileCreateDir, ChromeProfile										; creates a profile subdirectory in current folder
    ChromeInst := new Chrome("ChromeProfile")
	;ChromeInst := new Chrome("ChromeProfile", "https://example.com", "--headless")
    winwait, Chrome 	

    ; --- Connect to the page ---
    if !(Page1 := ChromeInst.GetPage())		
    {
        MsgBox, Could not retrieve page!
	    ChromeInst.Kill()
    }
    else
        Page1.WaitForLoad()

    ; Navigate to URL
    Page1.Call("Page.navigate", {"url": url})			; Navigate to url
    Page1.WaitForLoad()
Return
;*****************Level Active Start*****************
LevelActiveStart1: ;Decides wheter to start or not
GoSub, Save
    if (LevelStopA = 1)
    {
		SetTimer,ToolTipFollowMouse,On
		ToolTip, Starting in 3
		sleep, 1000
		ToolTip, Starting in 2
		sleep, 1000
		ToolTip, Starting in 1
		sleep, 1000
		SetTimer,ToolTipFollowMouse,Off
		ToolTip, 
		Gosub, LevelActiveStart2
    }
return
;*****************Level Active Stop*****************
LevelActiveStop1:
GoSub, Save
	LevelBreakLoopA = 1
	LevelActiveStop2:
		ToolTip, Stoping
		if (LevelStopA = 2)
      	{
			SetTimer, LevelActiveStop2, -1
	    }
	    else 
		{
		   ToolTip
		   WhatStoped := "LevelActive"
		   Create_Stoped_Window()
		}
return
;*****************Sending inputs*****************
LevelActiveStart2:
GoSub, Save
if (LevelStopA = 1)
sometext := "pls settings auto lottery true"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, 1000
loop
{
	sometext := "pls beg"
	Page1.Call("Input.insertText", {text: sometext } )
	Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
	if (LevelBreakLoopA = 1)
    {
	    LevelStopA = 1
		LevelBreakLoopA = 2
		return
	}
	sometext := "pls pm"
	Page1.Call("Input.insertText", {text: sometext } )
	Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
    Sleep, Max(0, LevelWaitA1 + LASpeed)
	sometext := "d"
	Page1.Call("Input.insertText", {text: sometext } )
	Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
	if (LevelBreakLoopA = 1)
    {
	    LevelStopA = 1
		LevelBreakLoopA = 2
		return
	}
	loop, 2
	{
		loop, 3
		{
			sometext := "pls bet " LABetAmount
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
            Sleep, Max(0, LevelWaitA2 + LASpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
            sometext := "pls slots " LASlotsAmount
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA3 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "drink"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA4 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "b"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA5 + LASpeed)
			sometext := "o"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA6 + LASpeed)
			sometext := "m"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA7 + LASpeed)
			sometext := "b"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA8 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "d"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA9 + LASpeed)
			sometext := "a"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA10 + LASpeed)
			sometext := "n"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA11 + LASpeed)
			sometext := "k"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA12 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "pls bet " LABetAmount
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA13 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "pls slots " LASlotsAmount
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA14 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "dislike"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA15 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "epic gamer moment"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA16 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "frogs"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA17 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "pls dep all"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA18 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
			sometext := "pls with 500"
	        Page1.Call("Input.insertText", {text: sometext } )
	        Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
	        Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
			Sleep, Max(0, LevelWaitA19 + LASpeed)
	      	if (LevelBreakLoopA = 1)
		    {
				LevelStopA = 1
                LevelBreakLoopA = 2
			    return
	     	}
	    }
		sometext := "pls beg"
		Page1.Call("Input.insertText", {text: sometext } )
		Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
		Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
		if (LevelBreakLoopA = 1)
		{
			LevelStopA = 1
            LevelBreakLoopA = 2
			return
		}
    }
}
return
;************************************************************* Level Raw ****************************************************************
LevelRawStart1: ;Decides wheter to start or not
GoSub, Save
    if (LevelStopR = 1)
    {
		SetTimer,ToolTipFollowMouse,On
		ToolTip, Starting in 3
		sleep, 1000
		ToolTip, Starting in 2
		sleep, 1000
		ToolTip, Starting in 1
		sleep, 1000
		SetTimer,ToolTipFollowMouse,Off
		Tooltip, 
     	GoSub, LevelRawStart2
    }
return
;*****************Level Raw Stop*****************
LevelRawStop1:
GoSub, Save
	LevelBreakLoopR = 1
	LevelRawStop2:
		ToolTip, Stoping
		if (LevelStopR = 2)
      	{
			SetTimer, LevelRawStop2, -1
	    }
	    else 
		{
		   ToolTip
		   WhatStoped := "LevelRaw"
		   Create_Stoped_Window()
		}
return
;*****************Sending inputs*****************
LevelRawStart2:
GoSub, Save
send, pls{space}settings{space}auto{space}lottery{space}true{enter}
Sleep, 1000
loop
{
	send, {lButton}
	send, pls{space}beg{enter}
	if (BreakLoop = 1)
    {
	    LevelStopR = 1
		LevelBreakLoopR = 2
		return
	}
	send, pls{space}pm{enter}
    Sleep, Max(0, LevelWaitR1 + LRSpeed)
    send, d{enter}
	if (LevelBreakLoopR = 1)
    {
	    LevelStopR = 1
		LevelBreakLoopR = 2
		return
	}
	loop, 2
	{
		loop, 3
		{
			send, pls{space}bet{space}%LRBetAmount%{enter}
            Sleep, Max(0, LevelWaitR2 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
            send, pls{space}slots{space}%LRSlotsAmount%{enter}
			Sleep, Max(0, LevelWaitR3 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, drink{enter}
			Sleep, Max(0, LevelWaitR4 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, b{enter}
			Sleep, Max(0, LevelWaitR5 + LRSpeed)
			send, o{enter}
			Sleep, Max(0, LevelWaitR6 + LRSpeed)
			send, m{enter}
			Sleep, Max(0, LevelWaitR7 + LRSpeed)
			send, b{enter}
			Sleep, Max(0, LevelWaitR8 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, d{enter}
			Sleep, Max(0, LevelWaitR9 + LRSpeed)
			send, a{enter}
			Sleep, Max(0, LevelWaitR10 + LRSpeed)
			send, n{enter}
			Sleep, Max(0, LevelWaitR11 + LRSpeed)
			send, k{enter}
			Sleep, Max(0, LevelWaitR12 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, pls{space}bet{space}%LRBetAmount%{enter}
			Sleep, Max(0, LevelWaitR13 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, pls{space}slots{space}%LRSlotsAmount%{enter}
			Sleep, Max(0, LevelWaitR14 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, dislike{enter}
			Sleep, Max(0, LevelWaitR15 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, epic {space}gamer{space}Moment{enter}
			Sleep, Max(0, LevelWaitR16 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, frogs{enter}
			Sleep, Max(0, LevelWaitR17 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, pls{space}dep{space}all{enter}
			Sleep, Max(0, LevelWaitR18 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
			send, pls{space}with{space}500{enter}
			Sleep, Max(0, LevelWaitR19 + LRSpeed)
	      	if (LevelBreakLoopR = 1)
		    {
				LevelStopR = 1
                LevelBreakLoopR = 2
			    return
	     	}
	    }
		send, pls{space}beg{enter}
		if (LevelBreakLoopR = 1)
		{
			LevelStopR = 1
            LevelBreakLoopR = 2
			return
		}
    }
}
return
;************************************************************** Smurf Active ***************************************************************
;Soon
;*************************************************************** Smurf Raw *****************************************************************
;Soon
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Class and Funtions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GuiHide(){
    IF( !PBUTTON[ A_GUICONTROL ].BUTTON_PRESS() )
        RETURN
    Gui,1: Show, Minimize
}
GuiContextMenu:
    if(Tog:=!Tog)
        Gui,1:Show,h45
    else
        Gui,1:Show,h600
    return
Latest_Version(){
	Try    {
     Run,https://www.autohotkey.com/boards/viewtopic.php?f=6&t=73836
    }
	/*catch e  ; Handles the first error/exception raised by the block above.
    {
    MsgBox, An exception was thrown!`nSpecifically: %e%
    Exit
    } 
	*/
}
Move_Window(){
    POSTMESSAGE , 0XA1 , 2
    SETTIMER , WATCH_HOVER , OFF
    WHILE( GETKEYSTATE( "LBUTTON" ) )
        SLEEP , 10
    SETTIMER , WATCH_HOVER , ON
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
                        pButton[A_Index].Button_Hover_On()
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
                pButton[Active_Button].Button_Hover_Off()
                    Hover_On:=0,Active_Button:=""
            }
        }
    }
}
Class Progress_Button   {
        __New(Window_Name,Button_Name,Label,x,y,w,h,BC,TRC,TC1,TC2,TC3,Button_Text,Text_Offset:=0)
            {
                This.Text_Offset:=Text_Offset,This.Window_Name:=Window_Name,This.Button_Name:=Button_Name,This.Label:=Label
                This.Button_ID1:=Button_Name "_1",This.Button_ID2:=Button_Name "_2",This.Button_ID3:=Button_Name "_3",This.Button_ID4:=Button_Name "_4"
                This.Button_Text:=Button_Text,This.X:=x,This.Y:=y,This.W:=w,This.H:=h
                This.Bottom_Color:=BC,This.Trim_Color:=TRC,This.Top_Color_1:=TC1,This.Top_Color_2:=TC2,This.Top_Color_3:=TC3
                This.Add_Button()
            }
        Add_Button()
            {
                global
                Gui,% This.Window_Name ":Add",Text,% "x" This.X " y" This.Y " w" This.W " h" This.H " v" This.Button_Name " g" This.Label
                Gui,% This.Window_Name ":Add",Progress,% "x" This.X " y" This.Y " w" This.W " h" This.H " Background" This.Bottom_Color " v" This.Button_ID1
                Gui,% This.Window_Name ":Add",Progress,% "x" This.X " y" This.Y " w" This.W-1 " h" This.H-1 " Background" This.Trim_Color " v" This.Button_ID2
                Gui,% This.Window_Name ":Add",Progress,% "x" This.X+1 " y" This.Y+1 " w" This.W-2 " h" This.H-2 " Background" This.Top_Color_1 " v" This.Button_ID3
                Gui,% This.Window_Name ":Add",Text,% "x" This.X+1 " y" This.Y+This.Text_Offset " w" This.W-2 "  Center BackgroundTrans v" This.Button_ID4,% This.Button_Text
            }
        Button_Press()
            {
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
                if(bname=This.Button_Name)
                    {
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
        Button_Hover_On(){
            global
            GuiControl,% This.Window_Name ":+Background" This.Top_Color_2,% This.Button_ID3
            GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID4
        }
        Button_Hover_Off()
            {
                global
                GuiControl,% This.Window_Name ":+Background" This.Top_Color_1,% This.Button_ID3
                GuiControl,% This.Window_Name ":+Redraw",% This.Button_ID4
            }
    }
DRAW_OUTLINE( GUI_NAME , X , Y , W , H , COLOR1 :="BLACK", COLOR2 := "BLACK" , THICKNESS := 1 ) {
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y " W" W " H" THICKNESS " BACKGROUND" COLOR1
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y " W" THICKNESS " H" H " BACKGROUND" COLOR1
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y + H - THICKNESS " W" W " H" THICKNESS " BACKGROUND" COLOR2
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X + W - THICKNESS " Y" Y " W" THICKNESS " H" H " BACKGROUND" COLOR2    
}
ToolTipFollowMouse(){
    MouseGetPos,MouseXpos,MouseYpos
    Process,Exist 
    hwnd:=WinExist("ahk_class tooltips_class32 ahk_pid " ErrorLevel) 
    WinGetPos,,,w,h,ahk_id %hwnd% 
    DllCall("MoveWindow","Uptr",hwnd,"Int",MouseXpos+12,"Int",MouseYpos,"Int",w,"Int",h,"Int",0)
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
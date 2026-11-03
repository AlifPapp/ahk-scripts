/*
Things to add:
-make it so if only loads url on first run
-multiple instances
rename alt spam, lv spam
Copy color picker interface
lv spam add enable auto lottery setting
fix sleep

-add in the weekly shopper quest buy pink, cookie, pill, bread, sand and sell everything sell alc
cooldown is 8 sec

add config file
create file
write in file
load file

weekly automated
go to the page https://discordapp.com/
click on open discord, towards right of middle
type random username
enter
click proceed for capcha
when capcha done click skip
click away from box
click on the [+] to join a server
click join server
type invter %invite%
type pls weekly and daily
click on server name then click on leave
click on the [+] to join a server
click join server
type pls give %user%
click user config/settings
clck on the left side then press down key
click log out
click again to confirm log out
reapete
*/

#SingleInstance, force
#NoEnv
SetBatchLines, -1
SetTitleMatchMode 2
Stop = 1
RadioForeground = 1
RadioBackground = 2
; Gui Layout
;-----------------------
;--------------------------------
;-----------------------------------------------
Gui, +AlwaysOnTop
Gui, Color, Black
Gui, Show, w600 h185, DaNkFArMerV9.4
;----------------------Tab 1
Gui, Add, Tab, x0 cWhite h20 w600 vTab1 gTab1, Welcome|Settings|Help
Gui, Tab, 1
Gui, Font, s9 q5 cWhite Bold underline
Gui, Add, Text, x10 y30, Welcome To DaNkFArMerV9.4!
Gui, Font, s7 q5 cWhite Norm
Gui, Add, Text, x10 y45, This application is used to automate the procedure of earning dank coins.
Gui, Add, Text, x10 y60, This is imposible to patch, but beware of being reported and getting banned or blacklisted.
Gui, Font, s7 q5 cWhite Bold underline
Gui, Add, Text, x10 y80, Future Updates:
Gui, Font, s7 q5 cWhite Norm
Gui, Add, Text, x10 y95, -Thinking.
Gui, Font, s7 q5 cWhite Bold underline
Gui, Add, Text, x10 y120, Whats New In This Update:
Gui, Font, s7 q5 cWhite Norm
Gui, Add, Text, x10 y135, -Minor bug fixes.
Gui, Add, Text, x10 y150, -
Gui, Add, Text, x10 y165, -

Gui, Tab, 2

Gui, Tab, 3
;--------------------------------------Tab 2
Gui, Add, Tab, x0 y30 cWhite h20 w600 vTab2, Global|Weekly
Gui, Tab, 1
Gui, Font, s7 q5 cWhite Norm
Gui, Add, Text, x10 y55, Amount to bet every 10 seconds
Gui, Add, Edit, x10 y70 cblack w60 h15 vBetAmount, 10
Gui, Add, Text, x10 y85, Amount to slot every 10 seconds
Gui, Add, Edit, x10 y100 cblack w60 h15 vSlotsAmount, 10

Gui, Add, Text, x200 y55, Amount to with every 20 seconds
Gui, Add, Edit, x200 y70 cblack w60 h15 vWithAmount, 500
Gui, Add, Text, x200 y85, Amount to dep every 20 seconds
Gui, Add, Edit, x200 y100 cblack w60 h15 vDepAmount, all

Gui, Add, Text, x400 y55, Change Speed
Gui, Add, Edit, x400 y70 cblack w60 h15 vSpeed, 0
Gui, Add, Text, x465 y70, Milliseconds

Gui, Add, Text, x115 y115, -----> When finished with Settings click (Proceed) or Close the window <-----
Gui, add, Button, x185 y135 w200 h40 gProceed, Proceed  

Gui, Add, Radio, cwhite x500 y140 w100 h15 Checked gForegroundSettings, Foreground
Gui, Add, Radio, cwhite x500 y155 w100 h15 gBackgroundSettings, Background
Gui, Tab, 2
Gui, Font, s7 q5 cWhite Norm
Gui, Add, Text, x10 y55, underconstuction
;---------------------------------------Tab 3
Gui, Add, Tab, x0 y30 cWhite h20 w600 vTab3, Hotkeys|Foreground|Background|120k/h|Tips
Gui, Tab, 1
Gui, Font, s9 q5 cWhite Norm
Gui, Add, Text, x10 y55, Ctrl-Alt-Z --> Start Typing
Gui, Add, Text, x10 y70, Ctrl-Alt-X --> Stop Typing
Gui, Add, Text, x10 y85, Ctrl-Alt-C --> Open Interface
Gui, Add, Text, x10 y100, F4 --> Close Aplication

Gui, Tab, 2
Gui, Font, s7 q5 cWhite Norm
Gui, Add, Text, x10 y55, Forground how
Gui, Add, Text, x10 y80, Step-1 Open up Discord
Gui, Add, Text, x10 y95, Step-2 Browse to your desired channel to type commands and press "Ctrl-Alt-Z" to start.
Gui, Add, Text, x10 y110, Step-3 Let it do its thing, go watch tv or something.
Gui, Tab, 3
Gui, Font, s7 q5 cWhite Norm
Gui, Add, Text, x10 y55, Backgound how
Gui, Add, Text, x10 y80, Step-1 Click on the "Background" in settings, this will make a new chrome instance for it to run in.
Gui, Add, Text, x10 y95, Step-2 Browse to your desired channel to type commands and press "Ctrl-Alt-Z" to start.
Gui, Add, Text, x10 y110, Step-3 Minimise the browser and let it do its thing, watch youtube or something.
Gui, Add, Text, x10 y140, For multiple instances copy paste this application into another folder and run it with the same steps above.
Gui, Tab, 4
Gui, Add, Text, x10 y55, 120k/h how

Gui, Tab, 5
Gui, Add, Text, x10 y55, -Make sure you’re doing it in a channel where no one else can you. This is so you won’t be reported and get blacklisted.
Gui, Add, Text, x10 y70, -Its advice to use a new account to earn more money.
Gui, Add, Text, x10 y85, -On a new account in 10h you can get over 100k, remember to sell all the items in your inventory for more earnings.
GuiControl, Hide, Tab2 
;---------------Tab control, show/hide
Tab1:
Gui, Submit, NoHide
if Tab1 = Settings
{
	GuiControl, Show, Tab2
}
else
{
	GuiControl, Hide, Tab2
}
if Tab1 = Help
{
	GuiControl, Show, Tab3
}
else
{
	GuiControl, Hide, Tab3
}
WinSet, Redraw, , A
return
;-----------------Radio control--------------------------------------
ForegroundSettings:
Gui, Submit, NoHide
RadioForeground = 1
RadioBackground = 2
return

BackgroundSettings:
Gui, Submit, NoHide
RadioBackground = 1
RadioForeground = 2

url:= "https://discordapp.com/"

; --- Create a new headless Chrome instance ---
FileCreateDir, ChromeProfile										; creates a profile subdirectory in current folder
ChromeInst := new Chrome("ChromeProfile")
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

;Hotkeys
;----------------------
;-------------------------------------
^!z::    ;Ctrl-Alt-Z
if (Stop = 1)
{
	CountDown = 4
	UpdateTimer:
    ToolTip, Starting in %CountDown%
	SetTimer, UpdateTooltip, 1
    CountDown -= 1
    if (CountDown > 0)
	{
        SetTimer, UpdateTimer, -1000
	}
	else {
		SetTimer, UpdateTooltip, Off
		Stop = 2
	    BreakLoop = 2
		ToolTip
	    GoSub, Start
    }
    return
	UpdateTooltip:
	ToolTip, Starting in %CountDown%
	return
}
return

^!x::    ;Ctrl-Alt-X
BreakLoop = 1
Stoping:
ToolTip, Stoping
if (Stop = 2)
	{
        SetTimer, Stoping, -1
	}
	else {
		ToolTip
    }
return

^!c::    ;Ctrl-Alt-C
Gui, Show
return

F4::
ExitApp
return

;weekly
;----------------------------
;------------------------------------

; Labels
;----------------------
;-----------------------------------------
Proceed:
Gui, Submit, NoHide
Gui, Hide
return

GuiClose:
Gui, Submit, NoHide
Gui, Hide
return

Start:
if (RadioBackground = 1)
					{
Loop
{
	if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
	GoSub, BPlsBeg
	if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
	GoSub, BPlsPm
	if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;------------------------------------
GoSub, BPlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDrink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BEpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BFrogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BBomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;--------------------------------------
GoSub, BPlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDrink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BEpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BFrogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BBomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;--------------------------------------
GoSub, BPlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDrink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BEpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BFrogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BBomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;--------------------------------------
	GoSub, BPlsBeg
;------------------------------
GoSub, BPlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDrink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BEpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BFrogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BBomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;--------------------------------------
GoSub, BPlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDrink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BEpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BFrogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BBomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;--------------------------------------
GoSub, BPlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDrink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BEpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BFrogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BDislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BBomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, BPlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
}				
					}

if (RadioForeground = 1)
					{
Loop
{
	if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
	GoSub, Click
	if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
	GoSub, PlsBeg
	if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
	GoSub, PlsPm
	if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;------------------------------------
GoSub,Click
GoSub, PlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Drink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, dank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, EpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Frogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Click
GoSub, PlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Dislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Bomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;--------------------------------------
GoSub,Click
GoSub, PlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Drink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, dank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, EpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Frogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Click
GoSub, PlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Dislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Bomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;------------------------------------
GoSub,Click
GoSub, PlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Drink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, dank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, EpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Frogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Click
GoSub, PlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Dislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Bomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;-----------------------------
	GoSub, PlsBeg
;------------------------------
GoSub,Click
GoSub, PlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Drink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, dank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, EpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Frogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Click
GoSub, PlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Dislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Bomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;-------------------------------------
GoSub,Click
GoSub, PlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Drink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, dank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, EpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Frogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Click
GoSub, PlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Dislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Bomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
;--------------------------------------
GoSub,Click
GoSub, PlsBet
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1500 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Drink
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, dank ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, EpicGamerMoment
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Frogs
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Click
GoSub, PlsBet
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsSlots
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Dislike
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, Bomb ;3x 1000
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsDep
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
GoSub, PlsWith
Sleep, Max(0, 1000 + Speed)
if (BreakLoop = 1)
	{
		Gui, Show
		break
	}
}
                    }
Stop = 1
BreakLoop = 2
Gui, Show
ToolTip
return
;----------------Lables Background-------------------32=space 13=enter
BPlsBeg:
sometext := "pls beg"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BPlsPm:
sometext := "pls pm"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, Max(0, 750 + Speed)
sometext := "d"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return
		
BPlsBet:
sometext := "pls bet "
Page1.Call("Input.insertText", {text: sometext } )
sometext := BetAmount
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BPlsSlots:
sometext := "pls Slots "
Page1.Call("Input.insertText", {text: sometext } )
sometext := SlotsAmount
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BDrink:
sometext := "drink"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BBomb:
sometext := "b"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, Max(0, 1000 + Speed)
sometext := "o"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, Max(0, 1000 + Speed)
sometext := "m"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, Max(0, 1000 + Speed)
sometext := "b"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BDank:
sometext := "d"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, Max(0, 1000 + Speed)
sometext := "a"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, Max(0, 1000 + Speed)
sometext := "n"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
Sleep, Max(0, 1000 + Speed)
sometext := "k"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BDislike:
sometext := "dislike"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BEpicGamerMoment:
sometext := "epic gamer moment"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BFrogs:
sometext := "frogs"
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BPlsDep:
sometext := "pls dep "
Page1.Call("Input.insertText", {text: sometext } )
sometext := DepAmount
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

BPlsWith:
sometext := "pls with "
Page1.Call("Input.insertText", {text: sometext } )
sometext := WithAmount
Page1.Call("Input.insertText", {text: sometext } )
Page1.call("Input.dispatchKeyEvent" , { type: "keyDown" , windowsVirtualKeyCode: 13 ,   text: "`r" })	
Page1.call("Input.dispatchKeyEvent" , {  type: "keyUp" ,  windowsVirtualKeyCode: 13  } )
return

;----------------Lables Foreground-------------------

Click:
send, {lButton}
return

PlsBeg:
send, pls{space}beg{enter}
return

PlsPm:
send, pls{space}pm{enter}
Sleep, Max(0, 750 + Speed)
send, d{enter}
return
		
PlsBet:
send, pls{space}bet{space}%BetAmount%{enter}
return

PlsSlots:
send, pls{space}slots{space}%SlotsAmount%{enter}
return

Drink:
send, drink{enter}
return

Bomb:
send, b{enter}
Sleep, Max(0, 1000 + Speed)
send, o{enter}
Sleep, Max(0, 1000 + Speed)
send, m{enter}
Sleep, Max(0, 1000 + Speed)
send, b{enter}
return

Dank:
send, d{enter}
Sleep, Max(0, 1000 + Speed)
send, a{enter}
Sleep, Max(0, 1000 + Speed)
send, n{enter}
Sleep, Max(0, 1000 + Speed)
send, k{enter}
return

Dislike:
send, dislike{enter}
return

EpicGamerMoment:
send, epic {space}gamer{space}Moment{enter}
return

Frogs:
send, frogs{enter}
return

PlsDep:
send, pls{space}dep{space}%DepAmount%{enter}
return

PlsWith:
send, pls{space}with{space}%WithAmount%{enter}
return
;---------------------------------------
;-------------------Chrome.ahk---------------------
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
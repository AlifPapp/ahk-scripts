#SingleInstance, Force
		ReplaceWith_regional_indicator = Off
1::
	if(ReplaceWith_regional_indicator = "Off"){
		ReplaceWith_regional_indicator = On
	}else if(ReplaceWith_regional_indicator = "On"){
		ReplaceWith_regional_indicator = Off
	}
return

return
#if (ReplaceWith_regional_indicator = "On")
~a:: ReplaceWith_regional_indicator("a")
~b:: ReplaceWith_regional_indicator("b")
~c:: ReplaceWith_regional_indicator("c")
~d:: ReplaceWith_regional_indicator("d")
~e:: ReplaceWith_regional_indicator("e")
~f:: ReplaceWith_regional_indicator("f")
~g:: ReplaceWith_regional_indicator("g")
~h:: ReplaceWith_regional_indicator("h")
~i:: ReplaceWith_regional_indicator("i")
~j:: ReplaceWith_regional_indicator("j")
~k:: ReplaceWith_regional_indicator("k")
~l:: ReplaceWith_regional_indicator("l")
~m:: ReplaceWith_regional_indicator("m")
~n:: ReplaceWith_regional_indicator("n")
~o:: ReplaceWith_regional_indicator("o")
~p:: ReplaceWith_regional_indicator("p")
~q:: ReplaceWith_regional_indicator("q")
~r:: ReplaceWith_regional_indicator("r")
~s:: ReplaceWith_regional_indicator("s")
~t:: ReplaceWith_regional_indicator("t")
~u:: ReplaceWith_regional_indicator("u")
~v:: ReplaceWith_regional_indicator("v")
~w:: ReplaceWith_regional_indicator("w")
~x:: ReplaceWith_regional_indicator("x")
~y:: ReplaceWith_regional_indicator("y")
~z:: ReplaceWith_regional_indicator("z")
#if

ReplaceWith_regional_indicator(Character){
	ClipSaved := ClipboardAll
	Send, {backspace}
	CharacterConverted := RegExReplace(Character, "([a-zA-Z])", ":regional_indicator_$1: ")
	Clipboard := CharacterConverted
	Send, ^v
	Send, {CtrlUp}
	Send, {v Up}
	Clipboard := ClipSaved
	sleep, 10
	While GetKeyState(Character,"P")
		Sleep, 10
}


return
F4::
ExitApp
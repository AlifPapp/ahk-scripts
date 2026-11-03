#SingleInstance force
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  
   ExitApp
}


1::Close1()
^1::Close2()
+1::Close3()

2::TabLeft1()
+2::TabLeft3()
^2::TabLeft2()


Close1(){
Process, Close, FortniteClient-Win64-Shipping.exe
Process, Close, EpicGamesLauncher.exe
}

Close2(){
Process, Close, FortniteClient-Win64-Shipping.exe
Process, Close, EpicGamesLauncher.exe
}

Close3(){
Process, Close, FortniteClient-Win64-Shipping.exe
Process, Close, EpicGamesLauncher.exe
}

TabLeft1(){
Send ^#{left} 
} 

TabLeft2(){
Send ^#{left} 
} 

TabLeft3(){
Send ^#{left} 
} 
#SingleInstance Force
Old = True
XButton1::
Send {Enter}
Return
XButton2::
Send {Down}
Send {Down}
Send {Down}
Send {Enter}
Send {Tab}
Send {Enter}
Return
^+s::
clipboard = Rnd1.0mm-B
Send, ^v
Return
^+d::
StringReplace, clipboard, clipboard, (,, All
StringReplace, clipboard, clipboard, ),, All
Return
^+c::
Sendinput, ^{c}
sleep, 100
foundpos := InStr(clipboard, "/")
sr := SubStr(clipboard, foundpos + 1)
clipboard := sr
Return
#F::
Send, :bussinfr:
sleep, 100
Send, {Enter}
Return
#C::
IfWinNotExist, Calculator
{
	Run C:\Windows\System32\calc.exe
	Return
}
Else
{
	Winactivate, Calculator
	Return
}
#N::
IfWinNotExist, *Untitled - Notepad
{
	Run C:\Windows\System32\notepad.exe
	Return
}
Else
{
	Winactivate, *Untitled - Notepad
	Return
}
#IfWinActive, ahk_exe MYCenter.exe
XButton2::
if (Old = True) {
	MouseGetPos, StartX, StartY
	MouseMove, 100, 1300, 0
	Old := False
	Return
}
else {
	MouseMove, StartX, StartY, 0
	Old := True
	Return
}

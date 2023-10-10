#SingleInstance Force
Old = True
CurrentJob := ""
XButton1::
Send {Enter}
Return
^+a::
InputBox, CurrentJob, Job, Please enter the current job number,,230,125,
Return
^+s::
Send, %CurrentJob%
Return
^+d::
sleep, 100
Send, ^a
sleep, 10
Send, ^c
sleep, 10
clipboard := clipboard * 0.25
sleep, 10
Send, `t
sleep, 10
Send, `t
sleep, 10
Send, `t
sleep, 10
Send, ^v
sleep, 10
Send, ^+`t
sleep, 10
Send, ^+`t
sleep, 10
Send, ^a
sleep, 10
Send, ^c
sleep, 10
clipwait, 1,1
sleep, 10
clipboard := clipboard * 0.25
sleep, 10
Send, `t
sleep, 10
Send, `t
sleep, 10
Send, `t
sleep, 10
Send, ^v
sleep, 10
Send, {Enter}
sleep, 10
Send, {Esc}
Return
^#I::
gui, 1: new
gui, 1:Default
gui, 1:+LastFound
gui, 1:add, groupbox, w250 h80,Capacitance
gui, 1:add, text, xm12 ym30 section, Min Value:	1000pF  /     1nF     /  0.001uF
gui, 1:add, text, xm12 yp+20,Max Value: 		   1000nF  /  1uF

gui, 1:add, groupbox, xm w250 h80,Resistance
gui, 1:add, text, xm12 yp+30 section, Min Value:	1ohm  /  0.001kohm
gui, 1:add, text, xm12 yp+20,Max Value: 		  1000kohm  /  1Mohm

gui, 1:show,, Electrical Test Info
Return
^#N::
clipboard := " [None]"
Sendinput, ^{v}
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

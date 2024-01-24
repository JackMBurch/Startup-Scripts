#SingleInstance Force
Old = True
CurrentJob := ""
VPD = ***VPD***
Summing = false
SumVal1 = -999
XButton1::
Send {Enter}
Return
XButton2::
if (Summing = true)
{
	Return
}
Summing = true
PrevClip = %clipboard%
Sendinput, ^{c}
sleep, 10
if (PrevClip = clipboard)
{
	MsgBox ,,Prompt,Nothing selected!,1.5
	Return
}
if (SumVal1 = -999)
{
	SumVal1 := clipboard
	Summing = false
	MsgBox ,,Prompt,Select second value,1
	Return
}
SumValSum := (SumVal1 + clipboard) / 2
clipboard := SumValSum
MsgBox ,,Prompt,Sum: %SumValSum%,1
Summing = false
SumVal1 = -999
Return
^+a::
InputBox, CurrentJob, Job, Please enter the current job number,,230,125,
Return
^+s::
Send, %CurrentJob%
Return
^+e::
Send, %VPD%
Return
^+d::
Send, ^+`t
sleep, 10
Send, ^+`t
sleep, 10
Send, ^+`t
sleep, 100
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

; Lobby spammer. 
; when the hotkey is activated, it leaves current lobby and opens a list of open lobbies
; mousewheel is rebound to up and down arrows until mouse1 is pressed
; when mouse1 is pressed anywhere on the screen, joins the highlighted lobby

;Currently works in full screen mode but only in 1920x1080 resolution
;my hacky method for being resolution independent obviously did not work

;to-do
;revert to fixed position mouse clicks and branch development of
;res-independent feature

!SPACE::
{
	CoordMode, Mouse, Relative
	
	WinGetPos, WinTitle, ResX, ResY, OriginX, OriginY
	;MsgBox OriginX %OriginX%-OriginY %OriginY% ResX %ResX%-ResY %ResY%
	;Return
	ResX := A_ScreenHeight
	ResY := A_ScreenWidth
	
	HotKey, WheelUp, Label_ArrowUp, On
	HotKey, WheelDown, Label_ArrowDown, On 
	HotKey, LButton, Label_LButton, On
	
	SendInput {ESC}
	Sleep 300
	SendInput {SPACE}
	Sleep 300
	
	;Click on versus lobby
	;275,275
	Click 275,275
	Sleep 100
	Click 275,275
 	Sleep 100
	
	;1000,450
	Click 1000,450
	Sleep 100
	Click 1000,450
	Sleep 300
	
	KeyWait, LBUTTON, D
	;1215,695
	Click 1215,695
	Sleep 100
	Click 1215,695

	HotKey, WheelUp, Label_ArrowUp, Off
	HotKey, WheelDown, Label_ArrowDown, Off
	HotKey, LButton, Label_LButton, Off

	CoordMode, Mouse, Screen
}

Label_ArrowUp:
	Send {Up}
Return

Label_ArrowDown:
	Send {Down}
Return

Label_LButton:
	;Click on "join game"
	Send % "{Click " ResY/1.6 " " ResX/1.588 "}"
	Sleep 50
	Send % "{Click " ResY/1.6 " " ResX/1.588 "}"
Return

/* ###############################################################################
	AUTOFIRE
*/
{

MouseIsOver(WindowTitle) 
	{
   MouseGetPos, , , Win
   WinGetTitle, Title, ahk_id %Win%
   If (InStr(Title, WindowTitle) = 1)
	  Return True
}

; Autofire
Spammy(SPAMIN,SPAMOUT,TICK = 38,WINDOW = "Left 4 Dead 2")	; as long as key SPAMIN is held down AND mouse is over WINDOW, key "spamout" will be spammed
{
	;SetTimer, SpamKey, %TICK%

	While ( GetkeyState(SPAMIN, "P") && MouseIsOver(WINDOW) ) 
	{
		;SetTimer, SpamKey, On
		Sleep %TICK%
			
		If MouseIsOver(WINDOW)
		{
			SendInput %SPAMOUT%
			;SetTimer, Spamout, -38
		}
	}
		
	;SetTimer, SpamKey, Off
}
	SpamKey:
		SendInput, %spamout%
	Return
}
	
/* ###############################################################################
	SPAWN TIMER
*/
{

StartTimer()
	{
		SoundPlay %SoundDir%\countdown.wav
		
		;SendInput {F8}
		
		SPAWNTIMEDELAY := 7000 
		
		; 18s
		SetTimer, SendTick18, % 0 - SPAWNTIMEDELAY

		; 10s
		SetTimer, SendTick10, % -8000 - SPAWNTIMEDELAY

		; 5s
		SetTimer, SendTick5, % -13000 - SPAWNTIMEDELAY

		; 3s
		SetTimer, SendTick3, % -15000 - SPAWNTIMEDELAY

		; 0s
		SetTimer, SendTick0, % -18000 - SPAWNTIMEDELAY

		; -3s
		SetTimer, SendTick-3, % -23000 - SPAWNTIMEDELAY
	}
	
	SendTick18:
		IfWinActive Left 4 Dead 2 ahk_class Valve001 
		{
			GoSub SendTime
		}
	Return
	
	SendTick10: 
		IfWinActive Left 4 Dead 2 ahk_class Valve001 
		{
			SoundPlay %SoundDir%\PLAY10.wav
			GoSub SendTime
		}
	Return
	
	SendTick5: 
		IfWinActive Left 4 Dead 2 ahk_class Valve001 
		{
			SoundPlay %SoundDir%\PLAY5.wav
			GoSub SendTime
		}
	Return
	
	SendTick3: 
		IfWinActive Left 4 Dead 2 ahk_class Valve001 
		{
			SoundPlay %SoundDir%\PLAY3.wav
			GoSub SendTime
		}
	Return

	SendTick0: 
		IfWinActive Left 4 Dead 2 ahk_class Valve001 
		{
			SoundPlay %SoundDir%\PLAY0.wav
			GoSub SendTime
		}
	Return

	SendTick-3: 
		IfWinActive Left 4 Dead 2 ahk_class Valve001 
		{
			SoundPlay %SoundDir%\PLAY3.wav
			GoSub SendTime
		}
	Return

	SendTime:
		;SendInput {F7}								; Otherwise you'll get spam when you alt-tab
	Return
}
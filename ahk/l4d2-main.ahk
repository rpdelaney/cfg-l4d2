; l4d2 scripts by an entire sleeve of fig newtons
; http://steamcommunity.com/id/fignewtons
; this will only work with AutoHotkey_L, not regular AutoHotKey

;To-do
;Null-canceling movement
;holding use key turns on autouse with m1
;Config parsers to auto-populate user hotkeys
;If mumble exists, chat to mumble. Otherwise, chat in-game.

#NoTrayIcon
#Persistent
#NoEnv
SendMode Input  ; speed, reliability
#SingleInstance, Force  ;prevent multiple instances
#IfWinActive Left 4 Dead 2 ahk_class Valve001 ;don't send input when l4d2 is not the active window
CoordMode, Mouse, Screen
SetWorkingDir, %A_ScriptDir%

;set your own path for sounds
SoundDir = D`:\Dropbox\AutoHotKey\media\snd\
MediaDir = D`:\Dropbox\AutoHotKey\media\

; Global variables and settings 
;all delays set to -1 so that input will be sent as fast as possible, even when being spammed
SetMouseDelay, -1
SetKeyDelay, -1
SetBatchLines, -1
SetDefaultMouseSpeed, 0 ;fastest possible


/* ######################################################################

    KEY BINDS. Define your personal config settings here. 

If you don't want the script to work with a key, simply leave
that field blank and the hotkey will not be bound

Hotkey_ signifies a key to be pressed by the user
InputKey_ signifies a key to be sent by the script

*/
{
    ;Keys for interacting with the game. Usually pass-through hotkeys
    
    ;User hotkey to select weapons
    Hotkey_Primary                     = ~*y
    Hotkey_Secondary                = ~*.
    Hotkey_spam                    = ~a
    
    ;Keys for interacting with the script. 
    
    ;Uncomment and configure these lines for AHK glows
    
    ;Hotkey_TeamModeSurvivor         = F7
    ;Config key that increments survivor glows
    ;InputKey_GlowSurvivorFlash         = F5
    
    ;User hotkey to enter infected mode
    ;Hotkey_TeamModeInfected         = F8
    ;Config key that increments infected glows
    ;InputKey_GlowInfectedFlash         = F6
    
    ;User hotkey to enter spectate mode
    ;Hotkey_TeamModeSpectate         = HOME
    
    Hotkey_LWin = LWin
    Hotkey_RWin = RWin 
    
    ;HotKey, %Hotkey_TeamModeSurvivor%, TeamMode_Survivor
    ;HotKey, %Hotkey_TeamModeInfected%, TeamMode_Infected
    ;HotKey, %Hotkey_TeamModeSpectate%, TeamMode_Spectate
    
    ;Uncomment these for AHK spawn timer
    
    ;Spawn timer tick = F7
    ;Spawn timer timereset = F8

    HotKey, %Hotkey_LWin%, Label_LWin
    HotKey, %Hotkey_RWin%, Label_RWin

}




/* ######################################################################
        Misc stuff 
*/

/* ######################################################################
        KEYBOARD labels
*/


; Block single press of windows key from doing anything
; Double tap of windows key starts spawn timer
Label_LWin:
{
    if (A_PriorHotkey <> Hotkey_LWin or A_TimeSincePriorHotkey > 400)
    {
        ; If TImeSincePriorHotkey was more than 400ms, then too much time between presses, so this isn't a double-press - do nothing.
        KeyWait, LWIN
    }
    else
    {
        ;Otherwis, play a sound confirming the timer has started and then start the timer.
        SoundPlay %SoundDir%\Windows Ding.wav
        StartTimer()
    }
}
Return

; Block the right windows key under all circumstances.
; If you want similar behavior from RWin, adapt the code from above
Label_RWin:
    SoundPlay, %SoundDir%\tell.wav
Return

/* ######################################################################
        Glow flashing
*/
{
    TEAM_MODE = HALT

    ;By default, GlowInfectedFlash is 125ms and GlowSurvivorFlash is 50ms.
    ;Customize these to taste.
    SetTimer, GlowInfectedFlash, 125
    Settimer, GlowSurvivorFlash, 50
    SetTimer, GlowInfectedFlash, Off
    Settimer, GlowSurvivorFlash, Off
    
    TeamMode_Survivor:
    {
        TEAM_MODE = SURVIVOR
        SetTimer, GlowSurvivorFlash, On
        SetTimer, GlowInfectedFlash, Off
        ComObjCreate("SAPI.SpVoice").Speak("Sirvai ver")    ;SAPI.SpVoice may cause CPU lag depending on your configuration. Comment these lines if you experience performance lag.
        Return
    }
    
    TeamMode_Infected:
    {
        TEAM_MODE = Infected
        SetTimer, GlowSurvivorFlash, Off
        SetTimer, GlowInfectedFlash, On
        ComObjCreate("SAPI.SpVoice").Speak("Infected")
        Return
    }
    
    TeamMode_Spectate:
    {
        If (TEAM_MODE != "SPECTATOR") { 
            ComObjCreate("SAPI.SpVoice").Speak("Spectator")
            TEAM_MODE = SPECTATOR
            SetTimer, GlowSurvivorFlash, On
            SetTimer, GlowInfectedFlash, On
        }
        else If (TEAM_MODE = "SPECTATOR") {
            ComObjCreate("SAPI.SpVoice").Speak("Halt")
            TEAM_MODE = HALT
            SetTimer, GlowSurvivorFlash, Off
            SetTimer, GlowInfectedFlash, Off
        }
        Return
    }
    
    GlowSurvivorFlash:
        IfWinActive, Left 4 Dead 2 ahk_class Valve001
        {
            If (!A_IsSuspended) {
                SendInput {%InputKey_GlowSurvivorFlash%}
            }
        }
    Return
    
    GlowInfectedFlash:
        IfWinActive, Left 4 Dead 2 ahk_class Valve001
        {
            If (!A_IsSuspended) {
                SendInput {%InputKey_GlowInfectedFlash%}
            }
        }
    Return
}


; jump spam like an idiot
Label_JumpSpam:
    Spammy("Left 4 Dead 2","a","{WheelUp}",38)
Return



/* ######################################################################
    INCLUDES
*/

#Include %A_ScriptDir%\l4d2-lobbyspam.ahk
;#Include %A_ScriptDir%\l4d2-movement.ahk
#Include %A_ScriptDir%\l4d2-consoleprotector.ahk
#Include %A_SCriptDir%\lib\l4d2-functions.ahk
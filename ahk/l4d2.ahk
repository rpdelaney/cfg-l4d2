; ==============================================================
; an entire sleeve of fig newtons' l4d2 scripts v0.1
; Copyright 2012
; ==============================================================
;
; This software is released without any warranty or guarantee to fitness for any particular purpose.
; USE AT YOUR OWN RISK.
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWorkingDir l4d2
SoundDir = ;Fill in the directory with the necessary sounds
MediaDir = ;Fill in the directory with the necessary media files
IconDir  = %A_WorkingDir%\ico\

Menu, TRAY, Icon, %IconDir%\steam.ico

#Persistent

; A panic button for when your settings are screwed up.
; Press ctrl+f12 to shut down l4d2.ahk
^F12::
    If !FileExist("l4d2-main.ahk") {
        SoundPlay, %SoundDir%\Windows Error.wav
        Return
    }
    If !FileExist("l4d2-consoleprotector.ahk") {
        SoundPlay, %SoundDir%\Windows Error.wav
        Return
    }
    If !FileExist("l4d2-lobbyspam.ahk") {
        SoundPlay, %SoundDir%\Windows Error.wav
        Return
    }
    If !FileExist("l4d2-mouse.ahk") {
        SoundPlay, %SoundDir%\Windows Error.wav
        Return
    }

    Menu, TRAY, Icon, %IconDir%\l4d2.ico
    SoundPlay %SoundDir%\Windows Shutdown.wav
    Run, l4d2-main.ahk
    Run, l4d2-mouse.ahk
    ;Run l4d2-glows.ahk
Return

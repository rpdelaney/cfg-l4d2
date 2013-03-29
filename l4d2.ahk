; ==============================================================
; an entire sleeve of fig newtons' l4d2 scripts v0.1
; Copyright 2012 
; ==============================================================
; Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
; Description and full legal agreement here: https://creativecommons.org/licenses/by-nc-sa/3.0/
; 
; You are free:
; 
; to copy, distribute and transmit the work
; to adapt the work
; 
; Attribution — You must attribute the work in the manner specified by the author or licensor (but not in any 
; way that suggests that they endorse you or your use of the work).
; 
; Noncommercial — You may not use this work for commercial purposes.
; 
; Share Alike — If you alter, transform, or build upon this work, you may distribute the resulting work only 
; under the same or similar license to this one.
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
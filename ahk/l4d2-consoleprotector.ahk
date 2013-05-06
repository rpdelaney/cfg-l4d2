; Protect the integrity of the console. 
; Buggy, needs work.

~`::
    
    Gosub Suspended
    
    Sleep 300
    Keywait, ``, D
    
    Gosub Resumed
Return

; Protect the integrity of the overlay when shift-tabbed.
Loop
{
    
}
    
Suspended:
    SoundPlay, %SoundDir%\bebeep.wav
    TrayTip, Suspended, Hotkeys are suspended
    Suspend, On                                                    ;Suspend hotkeys when console is open
Return

Resumed:
    Suspend, Off                                                ;Enable them after it closed
    TrayTip, Resume, Hotkeys are enabled
    SoundPlay, %SoundDir%\tootoot.wav
Return

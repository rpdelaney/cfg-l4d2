#NoTrayIcon
#Persistent
#NoEnv
SendMode Input  ; speed, reliability
#SingleInstance, Force    

#IfWinActive Left 4 Dead 2 ahk_class Valve001 

CoordMode, Mouse, Screen
SetWorkingDir, %A_ScriptDir%

SoundDir = D`:\Dropbox\AutoHotKey\media\snd\
MediaDir = D`:\Dropbox\AutoHotKey\media\

; Global variables and settings 
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
    ;User hotkey to toggle autofire with primary
    Hotkey_AutoFirePrimaryToggle     = F5
    ;User hotkey to toggle autofire with secondary
    Hotkey_AutoFireSecondaryToggle    = F6

    HotKey, %Hotkey_AutoFirePrimaryToggle%, Label_AutoFirePrimaryToggle
    HotKey, %Hotkey_AutoFireSecondaryToggle%, Label_AutoFireSecondaryToggle
    
    ;Couldn't get tildes and asterisks to work with variables yet.
    HotKey, ~*y, Label_Primary
    Hotkey, ~*., Label_Secondary
    
/* #######################################################################################
        AUTOFIRE
*/
{
    autofireprimary := 0
    autofiresecondary := 0
    
    ; Toggle autofireprimary
    Label_AutoFirePrimaryToggle:                            ;Press F5 to toggle autofire with primary weapon
    
    If autofireprimary
        {
            autofireprimary := 0
            autofire := 0
            SoundPlay %SoundDir%\OFF.wav
        }
        else
        {
            autofireprimary := 1
            SoundPlay %SoundDir%\ON.wav
        }
    Return

    Label_AutoFireSecondaryToggle:                                                        ;Press F6 to toggle autofire with secondary weapon
        If autofiresecondary
        {
            autofiresecondary := 0
            autofire := 0
            SoundPlay %SoundDir%\OFF.wav
        }
        else
        {
            autofiresecondary := 1
            SoundPlay %SoundDir%\ON.wav
        }
    Return
    
    ; Set autofire depending on weapon selection

    Label_Primary: ;primary                                      ;After pressing hotkey to select primary weapon,
        If autofireprimary                                       ;If autofireprimary is on
        {
            autofire := 1                                        ;Then spam mouse1 when its held down
            SoundPlay %SoundDir%\alttell.wav
        }
        else                                                     ;Otherwise
        {
            autofire := 0                                        ;Don't
        }
    Return
    
    Label_Secondary:                                             ;As above, except it's a secondary this time
        If autofiresecondary
        {
            autofire := 1
            SoundPlay %SoundDir%\alttell.wav
        }
        else
        {
            autofire := 0
        }
    Return
    
    ~*XButton1::                                                 ;Mouse4 for pills
        autofire := 0
    Return

    ~*XButton2::                                                 ;Mouse5 for nades
        autofire := 0
    Return

    ~*3::                                                        ;3 for pills
        autofire := 0
    Return

    ~*4::                                                        ;4 for medkit
        autofire := 0
    Return

    ~*5::                                                        ;5 for nades
        autofire := 0
    Return
}


/* ###############################################################################################
        MOUSE
*/
{
    
    #If MouseIsOver("Left 4 Dead 2")
    {
        ~*LBUTTON::
            
            If autofire                                            ; if autofire is on
            {
                Spammy("LButton","{Click}")                        ; spam it too >:)
            }
        Return
        
        ~*RBUTTON::
            Spammy("RButton","{Click Right}")        ; spam it 
        Return
        
        ;Haymaker. on Alt + mouse1
        !LBUTTON::
            Send {LButton down}{RButton down}
            Sleep, 30
            Send {LButton up}{RButton up}
        Return
        
        ;Jump-rock on alt + mouse2
        !RBUTTON::
            Click Right
            Sleep 30
            Send {Wheelup}
        Return
    }
    #IfWinActive Left 4 Dead 2 ahk_class Valve001

    *LBUTTON::        ;If mouse is not over left 4 dead 2
        SoundPlay, %SoundDir%\UAC.wav
        ; Cancel and don't send any clicks
    Return

    *RButton::
        SoundPlay, %SoundDir%\UAC.wav
        ; Cancel and don't send any clicks
    Return
}

#Include %A_SCriptDir%\lib\l4d2-functions.ahk
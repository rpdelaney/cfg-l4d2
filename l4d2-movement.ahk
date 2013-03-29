;Null canceling movement
;Doesn't work, not even an alpha version
    
    ;User hotkeys for movement
    Hotkey_Forward                    = p
    Hotkey_Backward                   = u
    Hotkey_Left                       = o
    Hotkey_Right                      = i

    ;Now bind the hotkeys
    HotKey, %Hotkey_Forward%, Label_Forward
    HotKey, %Hotkey_Backward%, Label_Backward
    HotKey, %Hotkey_Left%, Label_Left
    HotKey, %Hotkey_Right%, Label_Right
    
Label_Forward:
{
    GetKeyState, KEYSTATE, %Hotkey_Backward%, P
    ;ToolTip, Collision
    
    If (KEYSTATE = D) Then
    {
        
    }
    else
    {
        
    }
    
    Return
}

Label_Backward:
{
    
}

Label_Left:
{
    
}

Label_Right:
{
    
}

NullCancel(Key1,Key2)
{
    ;Retrieve the physical state of the opposing direction key
    While ( GetkeyState(Key1, "P") && MouseIsOver(WINDOW) )  
    {
        
    }
    
}
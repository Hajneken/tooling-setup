; F2 hotkey to trigger the action
F2::
    ; Check if Anki is open
    If WinExist("ahk_exe Anki.exe")
    {
        ; Activate the Anki window
        WinActivate, ahk_exe Anki.exe

        ; Wait for the window to be active
        WinWaitActive, ahk_exe Anki.exe

        ; Send the keyboard shortcut to open the "Add New Card" dialog
        Send, ^{Shift down}n{Shift up}
        Sleep 100
        Send DE::Every Day Random Sentences{Enter}
    }
    else
    {
        ; You can customize the action to take if Anki is not open
        MsgBox, Anki is not open!
    }
return

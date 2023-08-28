^F1::
    IfWinExist, ahk_exe Notion.exe
    {
        WinActivate
    }
    else
    {
        ProcessExist := 0
        Process, Exist, Notion.exe
        If (ErrorLevel)
        {
            ProcessExist := 1
            Process, Close, Notion.exe
        }

        Run, "C:\Users\zemanech\AppData\Local\Programs\Notion\Notion.exe" ; Replace with the actual path to your Notion executable
        WinWait, ahk_exe Notion.exe
        WinActivate
        WinMove, A,, A_ScreenWorkingAreaPosX, A_ScreenWorkingAreaPosY, A_ScreenWorkingAreaWidth, A_ScreenWorkingAreaHeight

        If (ProcessExist)
        {
            Sleep, 500 ; Wait for Notion to initialize
            Run, "C:\Users\zemanech\AppData\Local\Programs\Notion\Notion.exe" ; Replace with the actual path to your Notion executable
        }
    }
return

^F2::
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

^F3::
    Run "C:\Users\zemanech\AppData\Local\Mozilla Firefox\firefox.exe" "https://calendar.google.com/calendar/u/0/r/day"
return


^F12::
    Run "C:\Users\zemanech\AppData\Local\Mozilla Firefox\firefox.exe" "https://chat.openai.com/"
return

; Switch to Virtual Desktop 1
!1::
    Run "C:\users\zemanech\Work Folders\Desktop\poweruser_utils\c1.exe"
return

; Switch to Virtual Desktop 2
!2::
    Run "C:\users\zemanech\Work Folders\Desktop\poweruser_utils\c2.exe"
return

; Switch to Virtual Desktop 3
!3::
    Run "C:\users\zemanech\Work Folders\Desktop\poweruser_utils\c3.exe"
return

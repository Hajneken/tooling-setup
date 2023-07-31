; Activate Notion window when F1 is pressed
F1::
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

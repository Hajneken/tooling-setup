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
    If WinExist("ahk_exe TogglTrack.exe")
    {
        WinActivate

    }
    else
    {
        ; Activate the Anki window
        Run, "C:\Users\zemanech\AppData\Local\TogglTrack\TogglTrack.exe"
        WinWait, ahk_exe TogglTrack.exe
        WinActivate
    }
return

^F3::
    Run "C:\Users\zemanech\AppData\Local\Mozilla Firefox\firefox.exe" "https://calendar.google.com/calendar/u/0/r/day"
return

^F12::
    Run "C:\Users\zemanech\AppData\Local\Mozilla Firefox\firefox.exe" "https://chat.openai.com/"
return

; RUN Switch-Desktop program silently with Visual Basic Hack
; !1::
;     Run WScript.exe /b "C:\users\zemanech\Work Folders\Desktop\poweruser_utils\silent.vbs" powershell.exe -nologo -ExecutionPolicy ByPass -Command "Switch-Desktop 0"
; return

; !2::
;     Run WScript.exe /b "C:\users\zemanech\Work Folders\Desktop\poweruser_utils\silent.vbs" powershell.exe -nologo -ExecutionPolicy ByPass -Command "Switch-Desktop 1"
; return

; !3::
;     Run WScript.exe /b "C:\users\zemanech\Work Folders\Desktop\poweruser_utils\silent.vbs" powershell.exe -nologo -ExecutionPolicy ByPass -Command "Switch-Desktop 2"
; return

; !4::
;     Run WScript.exe /b "C:\users\zemanech\Work Folders\Desktop\poweruser_utils\silent.vbs" powershell.exe -nologo -ExecutionPolicy ByPass -Command "Switch-Desktop 3"
; return

; Remap Caps Lock to Alt useful for quicker navigation in Terminal 
CapsLock::Alt

; FLASHES Powershell

; ; Switch to Virtual Desktop 1
; !1::
;     Run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -Command "Switch-Desktop 0" 
; return

; Switch to Virtual Desktop 2
; !2::
;     Run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -Command "Switch-Desktop 1" 
; return

; ; Switch to Virtual Desktop 3
; !3::
;     Run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -Command "Switch-Desktop 2" 
; return

; ---------- DESKTOPCHANGE SCRIPT -----------------
; https://superuser.com/questions/940342/how-to-change-shortcut-key-for-switching-between-virtual-desktops-in-windows-10

; DESKTOP SWITCHING SCRIPT THAT ACTUALLY WORKS INSTANTLY, No dependencies required

; Globals
DesktopCount = 2 ; Windows starts with 2 desktops at boot
CurrentDesktop = 1 ; Desktop count is 1-indexed (Microsoft numbers them this way)
;
; This function examines the registry to build an accurate list of the current virtual desktops and which one we're currently on.
; Current desktop UUID appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops
; List of desktops appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops
;
mapDesktopsFromRegistry() {
 global CurrentDesktop, DesktopCount
 ; Get the current desktop UUID. Length should be 32 always, but there's no guarantee this couldn't change in a later Windows release so we check.
 IdLength := 32
 SessionId := getSessionId()
 if (SessionId) {
 RegRead, CurrentDesktopId, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops, CurrentVirtualDesktop
 if (CurrentDesktopId) {
 IdLength := StrLen(CurrentDesktopId)
 }
 }
 ; Get a list of the UUIDs for all virtual desktops on the system
 RegRead, DesktopList, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
 if (DesktopList) {
 DesktopListLength := StrLen(DesktopList)
 ; Figure out how many virtual desktops there are
 DesktopCount := DesktopListLength / IdLength
 }
 else {
 DesktopCount := 1
 }
 ; Parse the REG_DATA string that stores the array of UUID's for virtual desktops in the registry.
 i := 0
 while (CurrentDesktopId and i < DesktopCount) {
 StartPos := (i * IdLength) + 1
 DesktopIter := SubStr(DesktopList, StartPos, IdLength)
 OutputDebug, The iterator is pointing at %DesktopIter% and count is %i%.
 ; Break out if we find a match in the list. If we didn't find anything, keep the
 ; old guess and pray we're still correct :-D.
 if (DesktopIter = CurrentDesktopId) {
 CurrentDesktop := i + 1
 OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
 break
 }
 i++
 }
}
;
; This functions finds out ID of current session.
;
getSessionId()
{
 ProcessId := DllCall("GetCurrentProcessId", "UInt")
 if ErrorLevel {
 OutputDebug, Error getting current process id: %ErrorLevel%
 return
 }
 OutputDebug, Current Process Id: %ProcessId%
 DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
 if ErrorLevel {
 OutputDebug, Error getting session id: %ErrorLevel%
 return
 }
 OutputDebug, Current Session Id: %SessionId%
 return SessionId
}
;
; This function switches to the desktop number provided.
;
switchDesktopByNumber(targetDesktop)
{
 global CurrentDesktop, DesktopCount
 ; Re-generate the list of desktops and where we fit in that. We do this because
 ; the user may have switched desktops via some other means than the script.
 mapDesktopsFromRegistry()
 ; Don't attempt to switch to an invalid desktop
 if (targetDesktop > DesktopCount || targetDesktop < 1) {
 OutputDebug, [invalid] target: %targetDesktop% current: %CurrentDesktop%
 return
 }
 ; Go right until we reach the desktop we want
 while(CurrentDesktop < targetDesktop) {
 Send ^#{Right}
 CurrentDesktop++
 OutputDebug, [right] target: %targetDesktop% current: %CurrentDesktop%
 }
 ; Go left until we reach the desktop we want
 while(CurrentDesktop > targetDesktop) {
 Send ^#{Left}
 CurrentDesktop--
 OutputDebug, [left] target: %targetDesktop% current: %CurrentDesktop%
 }
}
;
; This function creates a new virtual desktop and switches to it
;
createVirtualDesktop()
{
 global CurrentDesktop, DesktopCount
 Send, #^d
 DesktopCount++
 CurrentDesktop = %DesktopCount%
 OutputDebug, [create] desktops: %DesktopCount% current: %CurrentDesktop%
}
;
; This function deletes the current virtual desktop
;
deleteVirtualDesktop()
{
 global CurrentDesktop, DesktopCount
 Send, #^{F4}
 DesktopCount--
 CurrentDesktop--
 OutputDebug, [delete] desktops: %DesktopCount% current: %CurrentDesktop%
}
; Main
SetKeyDelay, 75
mapDesktopsFromRegistry()
OutputDebug, [loading] desktops: %DesktopCount% current: %CurrentDesktop%
; User config!
; This section binds the key combo to the switch/create/delete actions
!1::switchDesktopByNumber(1)
!2::switchDesktopByNumber(2)
!3::switchDesktopByNumber(3)
!4::switchDesktopByNumber(4)
!5::switchDesktopByNumber(5)
!6::switchDesktopByNumber(6)
!7::switchDesktopByNumber(7)
!8::switchDesktopByNumber(8)
!9::switchDesktopByNumber(9)
;CapsLock & 1::switchDesktopByNumber(1)
;CapsLock & 2::switchDesktopByNumber(2)
;CapsLock & 3::switchDesktopByNumber(3)
;CapsLock & 4::switchDesktopByNumber(4)
;CapsLock & 5::switchDesktopByNumber(5)
;CapsLock & 6::switchDesktopByNumber(6)
;CapsLock & 7::switchDesktopByNumber(7)
;CapsLock & 8::switchDesktopByNumber(8)
;CapsLock & 9::switchDesktopByNumber(9)
;CapsLock & n::switchDesktopByNumber(CurrentDesktop + 1)
;CapsLock & p::switchDesktopByNumber(CurrentDesktop - 1)
;CapsLock & s::switchDesktopByNumber(CurrentDesktop + 1)
;CapsLock & a::switchDesktopByNumber(CurrentDesktop - 1)
;CapsLock & c::createVirtualDesktop()
;CapsLock & d::deleteVirtualDesktop()
; Alternate keys for this config. Adding these because DragonFly (python) doesn't send CapsLock correctly.
;^!1::switchDesktopByNumber(1)
;^!2::switchDesktopByNumber(2)
;^!3::switchDesktopByNumber(3)
;^!4::switchDesktopByNumber(4)
;^!5::switchDesktopByNumber(5)
;^!6::switchDesktopByNumber(6)
;^!7::switchDesktopByNumber(7)
;^!8::switchDesktopByNumber(8)
;^!9::switchDesktopByNumber(9)
;^!n::switchDesktopByNumber(CurrentDesktop + 1)
;^!p::switchDesktopByNumber(CurrentDesktop - 1)
;^!s::switchDesktopByNumber(CurrentDesktop + 1)
;^!a::switchDesktopByNumber(CurrentDesktop - 1)
;^!c::createVirtualDesktop()
;^!d::deleteVirtualDesktop()
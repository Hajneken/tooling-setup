; Initialize AutoHotkey
#Persistent
Random, Interval, 5000, 20000 ; Random interval between 5 and 20 seconds (in milliseconds)
SetTimer, PressRandomKey, %Interval%
Return

PressRandomKey:
    ; Generate a random number (1 to 27) to select a character (a to z or space)
    Random, RandomKey, 1, 27
    If (RandomKey = 27) ; If RandomKey is 27, send a space
        Send, {Space}
    Else ; Otherwise, send a random letter (a to z)
        Send, % Chr(RandomKey + 96)
Return

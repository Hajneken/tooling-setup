#!/bin/bash

CURRENT_SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | sed -E 's/^.+ = "?([^"]+)"?;$/\1/')

sketchybar --set $NAME label="$CURRENT_SOURCE"

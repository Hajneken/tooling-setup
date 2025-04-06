#!/bin/bash

get_iso_code() {
    local layout="$1"
    case "$layout" in
        "U.S.") echo "US" ;;
        "British") echo "GB" ;;
        "German") echo "DE" ;;
        "French") echo "FR" ;;
        "Czech") echo "CZ" ;;
        "Austrian") echo "AT" ;;
        *) echo "$layout" ;;  # Return the original layout if not found
    esac
}

update_keyboard_language() {
    CURRENT_SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | sed -E 's/^.+ = "?([^"]+)"?;$/\1/')
    ISO_CODE=$(get_iso_code "$CURRENT_SOURCE")
    sketchybar --set $NAME label="$ISO_CODE" icon="􀇳"
}

# Run initially
update_keyboard_language

case "$SENDER" in
    "forced") update_keyboard_language ;;
    "input_change") update_keyboard_language ;;
esac

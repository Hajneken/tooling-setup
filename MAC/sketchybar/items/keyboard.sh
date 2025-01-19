sketchybar --add event input_change AppleSelectedInputSourcesChangedNotification

sketchybar --add item keyboard_language right \
           --set keyboard_language \
                script="$PLUGIN_DIR/keyboard_language.sh" \
           --subscribe keyboard_language input_change

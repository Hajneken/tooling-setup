sketchybar --add item weather right \
           --set weather update_freq=7200 script="$PLUGIN_DIR/weather.sh" \
           --subscribe weather system_woke 
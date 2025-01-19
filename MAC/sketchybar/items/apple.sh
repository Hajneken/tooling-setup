#!/bin/bash

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

apple_logo=(
  icon=$APPLE
  icon.font="$FONT:Semibold:18.0"
  icon.color=$WHITE 
  icon.padding_left=4
  icon.padding_right=4
  background.color=none
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
)

sketchybar --add item apple.logo left                  \
           --set apple.logo "${apple_logo[@]}"         \
           
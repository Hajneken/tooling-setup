#!/bin/bash

WIFI_STATUS=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ -z "$WIFI_STATUS" ]; then
  sketchybar --set wifi icon="􀙈" label="Disconnected"
else
  sketchybar --set wifi icon="􀙇" label="$WIFI_STATUS"
fi

#!/bin/bash

WIFI_STATUS=$(system_profiler SPAirPortDataType | awk '/Current Network Information:/ { getline; print substr($0, 13, (length($0) - 13)); exit }')

if [ -z "$WIFI_STATUS" ]; then
  sketchybar --set wifi icon="􀙈" label="Disconnected"
else
  sketchybar --set wifi icon="􀙇" label="$WIFI_STATUS"
fi

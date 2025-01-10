#!/bin/bash

WEATHER_API_KEY=""

HOT=0xfff5b27d
WARM=0xfff5b27d
COOL=0xffa1d6e2
COLD=0xffa1d6e2


# WEATHER ICONS
THUNDERSTORM=􀇞
RAIN=􀇆
SUNNY=􀆭
CLOUDS=􀇂
SNOW=􀇎

# Get current location coordinates
# LOCATION=$(curl -s "https://ipapi.co/latlong/")
# LAT=$(echo $LOCATION | cut -d',' -f1)
# LON=$(echo $LOCATION | cut -d',' -f2)

# # OpenWeatherMap API endpoint (replace YOUR_API_KEY with actual key)
# API_ENDPOINT="https://api.openweathermap.org/data/2.5/weather?lat=$LAT&lon=$LON&units=metric&appid=$WEATHER_API_KEY"

# note HARDCODED for vienna with API don't push to github
API_ENDPOINT="https://api.openweathermap.org/data/2.5/weather?lat=48.2583&lon=16.3377&units=metric&$WEATHER_API_KEY"

# Only refresh weather data if older than an hour
if [[ ! -f "plugins/weather.json" ]] || [[ $(find "plugins/weather.json" -mmin +60) ]]; then
  curl -s -o plugins/weather.json "$API_ENDPOINT"
fi

# Extract weather data
TEMP=$(jq '.main.temp' plugins/weather.json)
RAIN=$(jq '.rain."1h" // 0' plugins/weather.json)
WIND=$(jq '.wind.speed' plugins/weather.json)
WEATHER_ID=$(jq '.weather[0].id' plugins/weather.json)

# Set icon and color based on weather conditions
if [[ $WEATHER_ID -ge 200 && $WEATHER_ID -lt 300 ]]; then
  ICON=$THUNDERSTORM
elif [[ $WEATHER_ID -ge 300 && $WEATHER_ID -lt 500 ]]; then
  ICON=$RAIN
elif [[ $WEATHER_ID -ge 600 && $WEATHER_ID -lt 700 ]]; then
  ICON=$SNOW
elif [[ $WEATHER_ID -gt 800 ]]; then
  ICON=$CLOUDS
else
  ICON=$SUNNY
fi

# Set color based on temperature
if (( $(echo "$TEMP > 25" | bc -l) )); then
  COLOR=$HOT
elif (( $(echo "$TEMP > 15" | bc -l) )); then
  COLOR=$WARM
elif (( $(echo "$TEMP > 5" | bc -l) )); then
  COLOR=$COOL
else
  COLOR=$COLD
fi

# Round temperature to nearest integer
TEMP=$(printf "%.0f" "$TEMP")

sketchybar --set "$NAME" label="${TEMP}°C" icon="$ICON" icon.padding_right=4 icon.color=$COLOR icon.padding_left=6 label.padding_left=0

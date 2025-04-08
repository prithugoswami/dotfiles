#!/bin/bash

# Battery level check
BATTERY_LEVEL=$(upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | sed 's/%//')

if [ "$BATTERY_LEVEL" -le 15 ]; then
    # Use correct DISPLAY and DBUS session for notify-send
    export DISPLAY=:0
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
    notify-send --urgency critical "🪫 Battery Low" "Battery is at ${BATTERY_LEVEL}%"
fi


#!/bin/sh

# device id=14
# toggles the touchapd on and sleeps for 30 seconds and then
# disables it again.
touchpad="$(xinput list-props 14 | awk 'NR == 2 {print $4}')"

if [ "$touchpad" -eq 0 ]; then
    xinput --enable 14
else
    xinput --disable 14
fi

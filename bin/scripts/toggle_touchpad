#!/bin/sh

id=$(xinput | grep -i touchpad | grep -o "id=[0-9]*" | grep -o "[0-9]*")
touchpad="$(xinput list-props $id | awk 'NR == 2 {print $4}')"

if [ "$touchpad" -eq 0 ]; then
    xinput --enable $id
else
    xinput --disable $id
fi

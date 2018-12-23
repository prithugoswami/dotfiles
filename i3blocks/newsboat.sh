#!/bin/sh
count=$(newsboat -x "reload" && newsboat -x "print-unread" | awk '{print $1}')
icon=$(echo -en "<span font='Font Awesome 5 Free'>\uf09e</span>")

if [ $count -gt 0 ];
then
    echo "<span color='#00FF00'>$icon $count</span>"
else
    echo "$icon $count"
fi

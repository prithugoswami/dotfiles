#!/bin/sh
icon=$(echo -en "<span font='Font Awesome 5 Free'>\uf09e</span>")
count=$(cat $HOME/.newsboat/unread)

case $BLOCK_BUTTON in
    1) setsid st -e newsboat &&
        count=$(newsboat -x 'print-unread' | cut -d ' ' -f1) ;;
esac

if [ $count -gt 0 ];
then
    echo "<span color='#00FF00'>$icon $count</span>"
elif [ $count = $(echo -e '\uf2f1') ]
then
    count=$(echo -en "<span font='Font Awesome 5 Free 8'>\uf2f1</span>")
    echo "<span color='#666666'>$icon $count</span>"
else
    echo -e "<span color='#666666'>$icon $count</span>"
fi

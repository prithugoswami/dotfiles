#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[ -f "$usermodmap" ] && xmodmap "$usermodmap"
[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset r rate 250 60
setxkbmap -layout 'us,in' -option "grp:shifts_toggle"\
    -option "ctrl:nocaps"

touchpad-conf && toggle_touchpad

[ -f ~/.xprofile ] && . ~/.xprofile

# exec i3
# exec xfce4-session
slstatus &
exec dwm

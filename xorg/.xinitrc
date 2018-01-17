#!/bin/sh

#xset +fp /usr/share/fonts/local
xset fp rehash

# Start deamons

# Set typematic
/usr/bin/xset r rate 180 20

# Set wallpaper

xrdb -merge -screens .Xdefaults

export PATH=${PATH}:${HOME}/bin

xinput --map-to-output $(xinput list --id-only "Wacom Co.,Ltd. Pen and multitouch sensor Finger touch") eDP1
xinput --map-to-output $(xinput list --id-only "Wacom Co.,Ltd. Pen and multitouch sensor Pen stylus") eDP1

# exec i3
exec ${HOME}/bin/start-nwm

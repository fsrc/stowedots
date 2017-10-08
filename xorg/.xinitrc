#!/bin/sh

#xset +fp /usr/share/fonts/local
xset fp rehash

xrdb -merge -screens .Xdefaults

export PATH=${PATH}:${HOME}/bin
export SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass

xinput --map-to-output $(xinput list --id-only "Wacom Co.,Ltd. Pen and multitouch sensor Finger touch") eDP1
xinput --map-to-output $(xinput list --id-only "Wacom Co.,Ltd. Pen and multitouch sensor Pen stylus") eDP1

eval `ssh-agent`

exec i3


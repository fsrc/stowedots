#!/bin/sh

#xset +fp /usr/share/fonts/local
xset fp rehash
#~/.bin/autoscreen.sh
#~/.bin/keyrate.sh

#pulseaudio --start

# Start deamons
#/usr/bin/mpd
/usr/bin/urxvtd -q -f -o

# Set typematic
/usr/bin/xset r rate 180 20

# Set wallpaper
# /usr/bin/feh --bg-scale ~/wallpapers/arch/A1.jpg
#nitrogen --restore &

#wicd-gtk &

#pasystray &
#pa-applet &

xrdb -merge -screens .Xdefaults

export PATH=${PATH}:${HOME}/bin

xinput --map-to-output $(xinput list --id-only "Wacom Co.,Ltd. Pen and multitouch sensor Finger touch") eDP1
xinput --map-to-output $(xinput list --id-only "Wacom Co.,Ltd. Pen and multitouch sensor Pen stylus") eDP1

# Launch window manager
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session /usr/bin/xmonad
#exec xmonad
#exec i3
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

exec gnome-session --session=i3-gnome
#exec i3-gnome

#!/bin/sh

#xset +fp /usr/share/fonts/local
xset fp rehash

#~/.bin/autoscreen.sh
#~/.bin/keyrate.sh

pulseaudio --start &

# Start deamons
#/usr/bin/mpd
/usr/bin/urxvtd -q -f -o

# Set typematic
/usr/bin/xset r rate 180 20

# Set wallpaper
# /usr/bin/feh --bg-scale ~/wallpapers/arch/A1.jpg
nitrogen --restore &

blueman-applet &
wicd-gtk &

pasystray &

# Launch window manager
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session /usr/bin/xmonad
#exec xmonad
exec i3

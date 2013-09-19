#!/bin/sh

hdmi=$(xrandr | grep "HDMI1 connected")

if [ -z "$hdmi" ] ; then
  dualscreen.sh
else
  singlescreen.sh
fi

nitrogen --restore
restart-urxvtd.sh

#!/bin/sh


HDMI_CONNECTED=$(xrandr | grep HDMI1 | awk '{ print $2 }')

if [ $HDMI_CONNECTED == "connected" ] ; then
  echo Dual screen mode
  ~/.bin/dualscreen.sh
else
  echo Single screen mode
  ~/.bin/singlescreen.sh
fi

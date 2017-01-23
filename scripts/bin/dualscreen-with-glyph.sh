#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 \
       --output DP1 --mode 2560x1440 --right-of eDP1 \
       --output HDMI2 --mode 1280x720 --above eDP1
#nitrogen --restore

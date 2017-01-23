#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 \
       --output HDMI2 --mode 1280x720 --above eDP1
#nitrogen --restore

#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 \
       --output DP1 --mode 1920x1080 --above eDP1
#nitrogen --restore

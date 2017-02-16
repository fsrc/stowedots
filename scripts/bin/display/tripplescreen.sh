#!/bin/sh

xrandr --output eDP1 --mode 2880x1800 \
  --output DP1 --mode 2560x1440 --above eDP1 \
  --output DP2 --mode 1920x1080 --right-of DP1

nitrogen --restore

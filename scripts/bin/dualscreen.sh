#!/bin/sh

xrandr --output eDP1 --mode 1366x768
xrandr --output DP1 --mode 2560x1440 --above eDP1
nitrogen --restore

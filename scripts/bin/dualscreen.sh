#!/bin/sh

xrandr --output eDP1 --mode 1366x768
xrandr --output HDMI1 --mode 1920x1080 --left-of eDP1
nitrogen --restore

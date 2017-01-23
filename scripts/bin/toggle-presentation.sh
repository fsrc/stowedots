#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 --output ${1:-HDMI2} --mode 1920x1080 --same-as eDP1


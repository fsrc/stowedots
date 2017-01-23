#!/bin/sh

setxkbmap -layout us -option >/dev/null
setxkbmap -layout us -option ctrl:nocaps 2>/dev/null

xset r rate 200 40

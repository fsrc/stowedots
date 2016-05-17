#!/bin/sh

CURR=$(currlang.sh)

if [ "$CURR" == "us" ] ; then
  setxkbmap -layout se -option ctrl:nocaps 2>/dev/null
else
  setxkbmap -layout us -option ctrl:nocaps 2>/dev/null
fi
/usr/bin/xset r rate 200 40

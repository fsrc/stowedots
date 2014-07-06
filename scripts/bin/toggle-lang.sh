#!/bin/sh

CURR=$(currlang.sh)

if [ "$CURR" == "us" ] ; then
  /usr/bin/setxkbmap se
else
  /usr/bin/setxkbmap us
fi
/usr/bin/xset r rate 200 40

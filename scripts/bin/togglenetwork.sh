#!/bin/sh

ethdev="eth0"

haseth=$(ip link list | grep -e "$ethdev")

if [ -z "$haseth" ] ; then
  wlan.sh
else
  sudo ip link set $ethdev up
  sudo dhcpcd $ethdev
fi


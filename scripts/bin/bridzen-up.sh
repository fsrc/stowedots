#!/bin/bash

#Control
BRIFILE=$(cat /sys/class/backlight/acpi_video0/actual_brightness)
MAXFILE=$(cat /sys/class/backlight/acpi_video0/max_brightness)

if [ $(expr $BRIFILE \< $MAXFILE) == 1 ] ; then
  NEWVAL=$(expr $BRIFILE + 1)
  echo $NEWVAL > /sys/class/backlight/acpi_video0/brightness
fi

~/bin/bridzen.sh

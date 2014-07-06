#!/bin/sh

curr=$(cat /sys/class/backlight/acpi_video0/brightness)

if [ $curr == "5" ] ; then
  echo 14 > /sys/class/backlight/acpi_video0/brightness
  echo 0 > /sys/class/leds/smc::kbd_backlight/brightness
elif [ $curr == "1" ] ; then
  echo 5 > /sys/class/backlight/acpi_video0/brightness
  echo 5 > /sys/class/leds/smc::kbd_backlight/brightness
else
  echo 1 > /sys/class/backlight/acpi_video0/brightness
  echo 1 > /sys/class/leds/smc::kbd_backlight/brightness
fi

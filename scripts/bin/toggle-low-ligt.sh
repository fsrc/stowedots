#!/bin/sh

curr=$(cat /sys/class/backlight/intel_backlight/brightness)

if [ $curr == "500" ] ; then
  cat /sys/class/backlight/intel_backlight/max_brightness > /sys/class/backlight/intel_backlight/brightness
  echo 0 > /sys/class/leds/smc::kbd_backlight/brightness
else
  echo 500 > /sys/class/backlight/intel_backlight/brightness
  echo 30 > /sys/class/leds/smc::kbd_backlight/brightness
fi

#!/bin/sh

monitor=$(xbacklight -get)
keyboard=$(cat /sys/class/leds/tpacpi::kbd_backlight/brightness)

echo "Current screen brightness $monitor, and keyboard $keyboard"

if [ $monitor == "50.000000" ] ; then
  xbacklight -set 100
  echo 0 > /sys/class/leds/tpacpi::kbd_backlight/brightness
else
  xbacklight -set 50
  echo 1 > /sys/class/leds/tpacpi::kbd_backlight/brightness
fi

monitor=$(cat /sys/class/backlight/intel_backlight/brightness)
keyboard=$(cat /sys/class/leds/tpacpi::kbd_backlight/brightness)

echo "New screen brightness $monitor, and keyboard $keyboard"

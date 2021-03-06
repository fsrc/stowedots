#!/usr/bin/env python3

import dbus
from sys import argv

def kb_light_set(delta):
    bus = dbus.SystemBus()
    kbd_backlight_proxy = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower/KbdBacklight')
    kbd_backlight = dbus.Interface(kbd_backlight_proxy, 'org.freedesktop.UPower.KbdBacklight')

    current = kbd_backlight.GetBrightness()
    maximum = kbd_backlight.GetMaxBrightness()
    new = max(0, current + delta)

    if new >= 0 and new <= maximum:
        current = new
        kbd_backlight.SetBrightness(current)

    # Return current backlight level percentage
    return 100 * current / maximum


if len(argv[1:]) == 1:
    if argv[1] == "--up" or argv[1] == "+":
        print(kb_light_set(1)) # ./kb-light.py (+|--up) to increment
    elif argv[1] == "--down" or argv[1] == "-":
        print(kb_light_set(-1)) # ./kb-light.py (-|--down) to decrement
    else:
        print("Unknown argument:", argv[1])
else:
    print("Script takes exactly one argument.", len(argv[1:]), "arguments provided.")

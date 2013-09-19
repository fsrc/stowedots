#!/bin/sh

/usr/bin/setxkbmap -print | grep xkb_symbols | /usr/bin/awk -F+ '{print $2}'


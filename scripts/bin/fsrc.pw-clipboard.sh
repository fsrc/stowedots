#!/usr/bin/env bash

lemonade server -allow 127.0.0.1 &
autossh -M 20000 -f -nNT -R 2489:127.0.0.1:2489 fredrik@fsrc.pw


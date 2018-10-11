#!/usr/bin/env bash

i3-msg -t get_workspaces | jq -j '.[] | select(.rect.x ) | if .visible == true then "<span underline=\"double\">"+" "+.name+"  "+"</span>" else " "+.name+"  " end'


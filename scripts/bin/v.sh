#!/bin/sh

pref=${PWD##*/}
socket=$(i3 --get-socketpath)
space=$( \
  i3-ipc -s "$socket" -t 1 -p \
  | grep -B4 -e "focused\"=>true" \
  | sed -ne '/num/ s/[^0-9]//gp' \
  )
i3-msg mark "$pref vifm" > /dev/null
i3-msg split h > /dev/null
i3-msg exec "urxvtc -cd $PWD -e vim --servername $pref" > /dev/null
sleep 0.1

i3-msg mark "$pref vim" > /dev/null
i3-msg split v > /dev/null
i3-msg exec "urxvtc -cd $PWD" > /dev/null
sleep 0.1

i3-msg mark "$pref terma" > /dev/null
i3-msg split h > /dev/null
i3-msg exec "urxvtc -cd $PWD" > /dev/null
sleep 0.1

i3-msg mark "$pref termb" > /dev/null
i3-msg "[con_mark=\"$pref vim\"] focus; resize grow height 38 px or 38 ppt" > /dev/null
i3-msg "[con_mark=\"$pref vifm\"] focus; resize shrink width 38 px or 38 ppt" > /dev/null
i3-msg "rename workspace to $space:$pref" > /dev/null

vifm -c "set vicmd='vim --servername $pref --remote' | only" ./ ./

i3-msg "[con_mark=\"$pref terma\"] kill" > /dev/null
i3-msg "[con_mark=\"$pref termb\"] kill" > /dev/null
i3-msg "exec vim --servername $pref --remote-send '<esc>:qa!<cr>'" > /dev/null

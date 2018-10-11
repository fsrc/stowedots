#!/usr/bin/env lsc

require! {
  \prelude-ls : {
    sort-by
    map
  }
  child_process : { exec }
}


(err, stdout, stderr) <- exec("i3-msg -t get_workspaces")

data = JSON.parse(stdout)
console.log "<tt>" + (data
|> sort-by (.num)
|> map (itm) ->
  color = if itm.focused
  then "\#555555"
  else "\#111111"

  "<span background=\"#color\"> </span><span size=\"large\" background=\"#color\">#{itm.name}</span><span background=\"#color\"> </span>"
).join('') + "</tt>"


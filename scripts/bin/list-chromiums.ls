#!/usr/bin/env lsc

require! {
  \prelude-ls : { obj-to-pairs, find, values, map }
  fs : { read-file }
}

argument =  process.argv.2

(err, txt) <- read-file("#{process.env.HOME}/.config/chromium/Local State", encoding:\utf8)

data = JSON.parse(txt)

if argument?
  profile = data.profile.info_cache
  |> obj-to-pairs
  |> find (pair) ->
    pair.1.user_name == argument

  console.log profile.0

else
  users = data.profile.info_cache
  |> values
  |> map (.user_name)
  |> map (user-name) -> console.log user-name



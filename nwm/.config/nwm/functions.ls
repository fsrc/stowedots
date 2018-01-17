require! {
  child_process : {
    spawn
  }
}

  # convinience functions for writing the keyboard shortcuts
export current-monitor = (nwm) ->
  nwm.monitors.get(nwm.monitors.current)

export move-to-monitor = (nwm, window, current-monitor, other-monitor-id) ->
  if window?
    window.monitor = other-monitor-id
    # set the workspace to the current workspace on that monitor
    other-monitor = nwm.monitors.get(other-monitor-id)

    window.workspace = other-monitor.workspaces.current
    # rearrange both monitors
    current-monitor.workspaces.get(current-monitor.workspaces.current).rearrange!
    other-monitor.workspaces.get(other-monitor.workspaces.current).rearrange!

export resize-workspace = (nwm, increment) ->
  workspace = current-monitor(nwm).current-workspace!
  workspace.set-main-window-scale(workspace.get-main-window-scale! + increment)
  workspace.rearrange!

export exec = (command, env-with-lang, on-err) ->
  console.log "exec: #{command}, #{env-with-lang}"
  term = spawn(command, [], { env: env-with-lang })

  term.stderr.set-encoding('utf8')
  term.stderr.on('data', (data) ->
    if /^execvp\(\)/.test(data)
      if on-err?
        on-err!)

export add-shortcut = (nwm, XK, Xh, base-modifier, shortcut) -->
  callback = shortcut.callback
  modifier = base-modifier
  # translate the modifier array to a X11 modifier
  if shortcut.modifier

    if shortcut.modifier.index-of('shift') > -1
      modifier = modifier .|. Xh.ShiftMask

    if shortcut.modifier.index-of('ctrl') > -1
      modifier = modifier .|. Xh.ControlMask

  # add shortcuts
  if Array.is-array(shortcut.key)
  then shortcut.key.for-each((key) -> nwm.add-key({ key: XK[key], modifier: modifier }, callback))
  else nwm.add-key({ key: XK[shortcut.key], modifier: modifier }, callback)


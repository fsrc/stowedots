require! {
  \./functions : {
    current-monitor
    move-to-monitor
    resize-workspace
    exec
    add-shortcut
  }
}

module.exports = (dependencies) ->

  # modules
  NWM   = dependencies.NWM
  XK    = dependencies.keysymdef
  Xh    = dependencies.Xh
  which = dependencies.which

  # instantiate nwm and configure it
  nwm = new NWM

  # resolved using node-which from a preset list, see bottom of the file
  best-available-term = 'st'
  best-available-browser = 'chromium'

  # load layouts
  layouts = dependencies.layouts

  nwm.add-layout('tile', layouts.tile)
  nwm.add-layout('monocle', layouts.monocle)
  nwm.add-layout('wide', layouts.wide)
  nwm.add-layout('grid', layouts.grid)


  # KEYBOARD SHORTCUTS
  # Change the base modifier to your liking e.g. Xh.Mod4Mask if you just want to use the meta key without Ctrl
  base-modifier = Xh.Mod4Mask # Win key

  if process.argv.index-of('--xephyr') > -1
  then base-modifier = Xh.Mod4Mask .|. Xh.ControlMask # Win + Ctrl

  env-with-lang = JSON.parse(JSON.stringify(process.env))

  env-with-lang.LANGUAGE = 'en_US.utf8'
  env-with-lang.LANG = 'en_US.utf8'
  env-with-lang.LC_ALL = 'en_US.utf8'


  keyboard_shortcuts = [
    {
      key: [1, 2, 3, 4, 5, 6, 7, 8, 9], # number keys are used to move between screens
      callback: (event) -> current-monitor(nwm).go(String.from-char-code(event.keysym))
    },
    {
      key: [1, 2, 3, 4, 5, 6, 7, 8, 9], # with shift, move windows between workspaces
      modifier: ['shift'],
      callback: (event) ->
        monitor = current-monitor(nwm)
        monitor.window-to(monitor.focused_window, String.from-char-code(event.keysym))
    },
    {
      key: 'Return', # enter key launches xterm
      modifier: ['shift'],
      callback: (event) -> exec('st', env-with-lang)
    },
    {
      key: 'Return', # enter key launches xterm
      modifier: ['ctrl'],
      callback: (event) -> exec(best-available-browser, env-with-lang)
    },
    {
      key: 'n', # enter key launches xterm
      modifier: ['ctrl'],
      callback: (event) -> exec("rse new", env-with-lang)
    },
    {
      key: 'o', # enter key launches xterm
      modifier: ['ctrl'],
      callback: (event) -> exec("rse -d open", env-with-lang)
    },
    {
      key: 'space', # enter key launches xterm
      modifier: ['shift'],
      callback: (event) -> exec('toggle-lang.sh', env-with-lang)
    },
    {
      key: 'd', # enter key launches xterm
      modifier: ['ctrl'],
      callback: (event) -> exec('dmenu_run', env-with-lang)
    },
    {
      key: 'q', # q key closes the current window
      modifier: ['shift'],
      callback: (event) ->
        monitor = current-monitor(nwm)
        if monitor.focused_window?
          nwm.wm.kill-window(monitor.focused_window)
    },
    {
      key: 'space', # space switches between layout modes
      callback: (event) ->
        monitor = current-monitor(nwm)
        workspace = monitor.current-workspace!
        workspace.layout = nwm.next-layout(workspace.layout)
        # monocle hides windows in the current workspace, so unhide them
        monitor.go(monitor.workspaces.current)
        workspace.rearrange!
    },
    {
      key: ['h'], # shrink master area
      callback: (event) ->
        resize-workspace(nwm, -5)
    },
    {
      key: ['l'], # grow master area
      callback: (event) ->
        resize-workspace(nwm, +5)
    },
    {
      key: 'Tab', # tab makes the current window the main window
      callback: (event) ->
        monitor = current-monitor(nwm)
        workspace = monitor.current-workspace!
        workspace.main-window = monitor.focused_window
        workspace.rearrange!
    },
    {
      key: 'comma', # moving windows between monitors
      modifier: ['shift'],
      callback: (event) ->
        monitor = current-monitor(nwm)
        window = nwm.windows.get(monitor.focused_window)
        if window? # empty if no windows
        then move-to-monitor(nwm, window, monitor, nwm.monitors.next(window.monitor))
    },
    {
      key: 'period', # moving windows between monitors
      modifier: ['shift'],
      callback: (event) ->
        monitor = current-monitor(nwm)
        window = nwm.windows.get(monitor.focused_window)
        if window? # empty if no windows
        then move-to-monitor(nwm, window, monitor, nwm.monitors.prev(window.monitor))
    },
    {
      key: 'j', # moving focus
      callback: ->
        monitor = current-monitor(nwm)
        if monitor.focused_window && nwm.windows.exists(monitor.focused_window)
          window = nwm.windows.get(monitor.focused_window)

          do
            previous = nwm.windows.prev(window.id)
            window = nwm.windows.get(previous)
          while window.workspace != monitor.workspaces.current

          console.log('Current', monitor.focused_window, 'previous', window.id)
          monitor.focused_window = window.id
          nwm.wm.focus-window(window.id)
    },
    {
      key: 'k', # moving focus
      callback: ->
        monitor = current-monitor(nwm)
        if monitor.focused_window && nwm.windows.exists(monitor.focused_window)
          window = nwm.windows.get(monitor.focused_window)

          do
            next = nwm.windows.next(window.id)
            window = nwm.windows.get(next)
          while window.workspace != monitor.workspaces.current

          console.log('Current', monitor.focused_window, 'next', window.id)
          monitor.focused_window = window.id
          nwm.wm.focus-window(monitor.focused_window)
    },
    {
      key: 'BackSpace', # quit
      modifier: ['shift', 'ctrl'],
      callback: -> process.exit!
    },
    {
      key: 'BackSpace',
      callback: -> current-monitor(nwm).go-back!
    }
  ]

  # take each of the keyboard shortcuts above and make add a key using nwm.addKey
  keyboard_shortcuts.for-each(add-shortcut(nwm, XK, Xh, base-modifier))

  # START
  terms = [
    'st',
    'sakura',
    'rxvt',
    'urxvt',
    'xterm'
  ]

  # find-term = (on-done) ->
  #   name = terms.shift!
  #   which(name, (err, filepath) ->
  #     if err or not filepath
  #       find-term(on-done)
  #     else
  #       on-done(null, name)
  #   )

  # find-term((err, term) ->
  #   best-available-term = term
  #   nwm.start(->))

  exec('keyrate.sh', env-with-lang)
  nwm.start(->)

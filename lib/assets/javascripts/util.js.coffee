# util

@WT = {}

@WT.util =
  # create namespace under window.WT
  # e.g.
  #   NgWords = namespace "NgWords"
  namespace: (nsString) ->
    parts = nsString.split "."
    parts = parts.slice 1 if parts[0] is "WT"
    parent = window.WT

    for part in parts
      do (part) ->
        parent[part] = {} unless parent[part]?
        parent = parent[part]

    parent

  # noop
  noop: ->

  # logging
  log: if window.console? and _.isFunction(console.log) then _.bind(console.log, console) else noop

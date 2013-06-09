# util

@WT = {}

@WT.util =
  namespace: (nsString) ->
    parts = nsString.split "."
    parts = parts.slice 1 if parts[0] is "WT"
    parent = window.WT

    for part in parts
      do (part) ->
        parent[part] = {} unless parent[part]?
        parent = parent[part]

    parent

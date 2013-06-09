#= require ng_words/list-view

# @WT = {}

$(=>

  init()

  new @WT.NgWords.ListView el: "#ng-words"
)

init = ->
  $.ajaxSetup
    headers:
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')


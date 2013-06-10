util = @WT.util

NgWords = util.namespace "NgWords"

class NgWords.Model extends Backbone.Model

  validate: (attibutes) ->
    switch
      when _.isEmpty(attibutes.word) then "enter word"
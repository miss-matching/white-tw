#= require ./model

util = @WT.util

NgWords = util.namespace "NgWords"

class NgWords.Collection extends Backbone.Collection

  url: "/ng_words"

  model: NgWords.Model
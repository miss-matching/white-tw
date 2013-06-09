#= require ./item-template

util = @WT.util

NgWords = util.namespace "NgWords"

class NgWords.ItemView extends Backbone.View

  className: "ng-word"

  events:
    "click .edit": "edit"
    "click .destroy": "destroy"

  render: () ->
    @$el.html(@template @options.model.toJSON())
    @

  edit: (e) ->
    e.preventDefault()
    alert "edit #{@options.model.get('word')}"

  destroy: (e) ->
    e.preventDefault()
    alert "destroy"

  template: JST["ng_words/item-template"]

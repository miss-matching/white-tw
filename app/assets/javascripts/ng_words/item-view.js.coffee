#= require ./item-template

util = @WT.util

NgWords = util.namespace "NgWords"

class NgWords.ItemView extends Backbone.View

  className: "ng-word"

  events:
    "click .destroy": "destroy"
    "click .edit": "edit"
    "dblclick .display": "edit"
    "keydown [name=word]": "commit"
    "focusout [name=word]": "render"

  initialize: ->
    @model.on "change", @render

  render: =>
    @$el.html(@template @model.toJSON())
    @

  commit: (e) ->
    return if( e.keyCode? and e.keyCode isnt 13) or ( e.which? and e.which isnt 13)
    e.preventDefault()
    @model.set( word : $(e.target).val() )
    @model.save()


  edit: (e) ->
    e.preventDefault()
    @$('.word').addClass('edit')



  destroy: (e) ->
    e.preventDefault()
    alert "destroy"

  template: JST["ng_words/item-template"]

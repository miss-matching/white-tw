#= require ./collection
#= require ./item-view
#= require ./list-template
  
util = @WT.util

NgWords = util.namespace "NgWords"

class NgWords.ListView extends Backbone.View

  events:
    "submit form.new-ng-word": "create"

  initialize: () ->
    @collection = new NgWords.Collection
    @collection.on "add", @renderOne
    @collection.on "reset", @render
    @collection.fetch reset: true

  render: () =>
    @$el.html(@template())
    @collection.each @renderOne
    @

  renderOne: (model) =>
    @$(".word-list").append(
      new NgWords.ItemView(model: model).render().el
    )

  create: (e) ->
    e.preventDefault()
    @collection.create word: @$("[name=new]").val()
    @$("[name=new]").val("")

  template: JST["ng_words/list-template"]
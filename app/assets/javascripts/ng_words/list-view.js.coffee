#= require ./collection
#= require ./item-view
  
util = @WT.util

NgWords = util.namespace "NgWords"

class NgWords.ListView extends Backbone.View

  initialize: () ->
    @collection = new NgWords.Collection
    @collection.on "reset", @render
    @collection.fetch reset: true

  render: () =>
    @collection.each @renderOne
    @

  renderOne: (model) =>
    @$el.append(new NgWords.ItemView(model: model).render().el)
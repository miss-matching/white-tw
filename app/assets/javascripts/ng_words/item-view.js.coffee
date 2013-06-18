#= require ./item-template

util = @WT.util

NgWords = util.namespace "NgWords"


class NgWords.ItemView extends Backbone.View

  tagName: "li"
  className: "ng-word"

  events:
    "click .destroy": "registerConfirmedClick"
    "confirmedClick .destroy": "destroy"
    "click .edit": "edit"
    "dblclick .display": "edit"
    "keydown [name=word]": "commit"
    "focusout [name=word]": "render"

  initialize: ->
    @model.on "change", @render
    @model.on "destroy", @remove, @
    @triggerConfirmDestroy =
      new NgWords.CancelableTimerAction( 3000, => 
        @$('.destroy').trigger('confirmedClick')
      )

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

  registerConfirmedClick: (e) =>
    e.preventDefault()
    
    if @triggerConfirmDestroy.waiting is on
      @$('.destroy').text('Destroy')
      @triggerConfirmDestroy.cancel()
    else
      @$('.destroy').text('Cancel')
      @triggerConfirmDestroy.start()

  destroy: (e) ->
    e.preventDefault()
    @model.destroy(wait: true)
    

  template: JST["ng_words/item-template"]

class NgWords.CancelableTimerAction

  constructor: ( @timeMergin, @action ) ->
    @waiting = false
    @waitingTimer = null

  start: ->
    @waiting = true
    @waitingTimer = setTimeout( @action, @timeMergin )
    @

  cancel:  ->
    @waiting = false
    clearTimeout( @waitingTimer )
    @waitingTimer = null
    @


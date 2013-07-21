class @Geyser extends Backbone.View

  initialize: (@options) ->
    console.log 'hello world!'
    @render()

  render: ->
    $('#main').html 'test'
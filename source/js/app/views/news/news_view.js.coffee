define ['composite.view' 
        'jquery' 
        'underscore'
        'app/templates/news/new'
], (CompositeView, $, _, newTemplate) ->

  class NewsView extends CompositeView
    
    className: 'new-view'

    initialize: (options) ->
      ''

    template: JST['app/templates/news/']
        
    render: ->
      @$el.html @template
        news: @model
      @

  
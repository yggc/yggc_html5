define ['composite.view' 
        'jquery' 
        'underscore'
        'app/templates/news/index'
], (CompositeView, $, _, newTemplate) ->

  class NewsView extends CompositeView
    
    className: 'news-view'

    initialize: (options) ->
      ''

    template: JST['app/templates/news/index']
        
    render: ->
      @$el.html @template
        news: @model
      @

  
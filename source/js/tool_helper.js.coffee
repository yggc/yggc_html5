define ['backbone','jquery'], (Backbone, $) ->

  class window.ToolHelper

    alert: (content, title = '阳光公采') ->
      alert(content, title)

    hideLoading: ->
      $('#loading').hide() 

    showLoading: ->
      $('#loading').show()
    
    log: (info) ->
       console.log('LOG: ' + info ) if window.console && window.console.log
define ['backbone','jquery','viewnavigator'], (Backbone, $, ViewNavigator) ->

  class window.ToolHelper

    alert: (content, title = '阳光公采') ->
      alert(content, title)

    hideLoading: ->
      $('#loading').hide() 

    showLoading: ->
      $('#loading').show()
    
    log: (info) ->
       console.log('LOG: ' + info ) if window.console && window.console.log

    pushView: ->
      view = @getView()
      window.viewNavigator.pushView(view)

    popView: ->
      window.viewNavigator.popView()

    getView: ->
      bodyView = $('<div>' + Math.random().toString() + 
        '<hr><li href="#" onclick="App.tool_helper.pushView()" class="viewNavigator_backButton">push view</li>' +
        ' <li href="#" onclick="App.tool_helper.popView()" class="viewNavigator_backButton">pop view</li><hr>' + 
        @getMeat() + '</div>')
      links = bodyView.find('a')

      title: "Default View " + parseInt(Math.random()*1000),
      backLabel: "Back"
      view:  bodyView
          

    getMeat: ->
      iterations = 1 + parseInt(Math.random() * 25)
      result = "sss"

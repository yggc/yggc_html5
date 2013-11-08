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

    pushView: (view = @firstView()) ->
      window.viewNavigator.pushView(view)

    popView: ->
      window.viewNavigator.popView()

    firstView: ->
      tmpView = $('<div>' +
        '<a href="#" onclick="App.tool_helper.pushView()" class="viewNavigator_backButton">登录</a>' +
        '<a href="#" onclick="App.tool_helper.popView()" class="viewNavigator_backButton">back</a>' + 
        '</div>')

      title: "新闻首页",
      backLabel: "<div class='back'><i></i></div>"
      view:  ''
          
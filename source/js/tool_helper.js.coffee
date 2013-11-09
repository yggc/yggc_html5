define ['backbone','jquery','viewnavigator','app/views/slide_menu_icon'], (Backbone, $, ViewNavigator, SlideMenuIconView) ->

  class window.ToolHelper

    alert: (content, title = '阳光公采') ->
      alert(content, title)

    hideLoading: ->
      $('#loading').hide() 

    showLoading: ->
      $('#loading').show()
    
    log: (info) ->
       console.log('LOG: ' + info ) if window.console && window.console.log
    
    # hasEvent: (element, eventName) ->
    #   if $(element).data("events") && $(element).data("events")[eventName]
    #     true
    #   else
    #     false

    pushView: (view = @firstView()) ->
      window.viewNavigator.pushView(view)

    popView: ->
      window.viewNavigator.popView()

    closeSideBar: ->
      slide.close()
      window.App.menuIsOpen = false

    openSideBar: ->
      slide.open()
      window.App.menuIsOpen = true

    firstView: (view = '') ->
      window.slideIcon = new SlideMenuIconView()
      res = 
        title: "新闻首页"
        slideIcon: slideIcon.el
        view:  view

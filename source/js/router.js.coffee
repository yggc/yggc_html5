define [
  'backbone' 
  'jquery'
  'noClickDelay'
  'tool_helper'
  'app/models/login'
  'app/views/login_view'
  'app/views/news/news_view'
  'viewnavigator'
], (Backbone, $, NoClickDelay, ToolHelper, Login, LoginView, NewsView, ViewNavigator) ->
  
  class Router extends Backbone.Router
    
    initialize: (options) ->
      window.App.tool_helper = new ToolHelper()
      window.viewNavigator = new ViewNavigator( 'body' )
      defaultView = App.tool_helper.firstView()
      # defaultView = new NewsView()
      defaultView.backLabel = "<div class='slide-menu'><i></i></div>"
      window.viewNavigator.pushView(defaultView)
      # if !@loggedIn()
      #   @login()
      # else
      #   @home()

    swap: (newView) ->
      @currentView.leave() if @currentView && @currentView.leave
      @currentView = newView
    
    loggedIn: ->
      token = window.localStorage.getItem('userAccessToken')
      if token
        App.currentUser = new User
        App.currentUser.set
          id: window.localStorage.getItem('userId')
          token: window.localStorage.getItem('userAccessToken')
          email: window.localStorage.getItem('userEmail')
        true
      else
        false

    routes:
      '#': 'news'
      'news': 'news'
      'login': 'login'

    news: ->
      App.tool_helper.hideLoading()
      news = new news()
      newsView = new NewsView
        collection: news
      @swap(newsView)
      newsView.fetchNews()
      $('#content').html(newsView.el)

    login: ->
      App.tool_helper.hideLoading()
      login = new Login()
      loginView = new LoginView
        model: login
      $('#main').prepend(loginView.el)
    
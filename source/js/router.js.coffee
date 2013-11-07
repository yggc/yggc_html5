define [
  'backbone' 
  'jquery'
  'tool_helper'
], (Backbone, $, ToolHelper) ->
  
  class Router extends Backbone.Router
    
    initialize: (options) ->
      window.App.tool_helper = new ToolHelper()
    #   if !@loggedIn()
    #     @login()
    #   else
    #     @home()

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
      $('#main').prepend(menuView.el)
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
      $('body').prepend(loginView.el)

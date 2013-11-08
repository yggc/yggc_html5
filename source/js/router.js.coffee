define [
  'backbone' 
  'jquery'
  'noClickDelay'
  'tool_helper'
  'app/models/login'
  'app/views/login_view'
  'app/views/slide_bar'
  'app/views/news/news_view'
  'viewnavigator'
  'slidingview'
  'animationEnhanced'
], (Backbone, $, NoClickDelay, ToolHelper, Login, LoginView, SlideBarView, 
    NewsView, ViewNavigator, SlidingView, AnimationEnhanced) ->
  
  class Router extends Backbone.Router
    
    initialize: (options) ->
      window.App.tool_helper = new ToolHelper()
      window.viewNavigator = new ViewNavigator('body')
      # load first view
      defaultView = App.tool_helper.firstView()
      window.viewNavigator.pushView(defaultView)
      # load slide bar
      slideBarView = new SlideBarView()
      $('.slidingview_wrapper').html(slideBarView.el)
      window.slide = new SlidingView( 'sidebar', 'main' )
      App.tool_helper.hideLoading()
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
      $('.contentHolder').html(newsView.el)

    login: ->
      App.tool_helper.hideLoading()
      login = new Login()
      loginView = new LoginView
        model: login
      $('.contentHolder').prepend(loginView.el)
    
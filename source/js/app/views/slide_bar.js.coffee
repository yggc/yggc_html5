define [
  'composite.view'
  'jquery'
  'app/templates/slide_bar'
  'app/views/login_view'
  'app/views/register_view'
], (CompositeView, $, SlideBarTemplate, LoginView, RegisterView) ->
  
  class SlideBar extends CompositeView
  
    id: 'slide_bar_view'

    initialize: (options) ->
      @$el.html JST['app/templates/slide_bar'] 

    events:
      'click .login': 'login'
      'click .register': 'register'

    login: ->
      slide.close()
      App.tool_helper.pushView
        title: '登录'
        view: $ (new LoginView()).el
        backLabel: "<div class='back'><i></i></div>"

    register: ->
      slide.close()
      App.tool_helper.pushView
        title: '注册'
        view: $ (new RegisterView()).el
        backLabel: "<div class='back'><i></i></div>"

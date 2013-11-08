define [
  'composite.view'
  'jquery'
  'app/models/user'
  'app/templates/login_register/login'
  'app/templates/login_register/login_header'
], (CompositeView, $, ProfileView, User, LoginTemplate, LoginHeaderTemplate)->
  
  class LoginView extends CompositeView
    
    tagName: 'div'
    id: 'login'

    initialize: (options) ->
      # $('header').html JST['app/templates/login_register/login_header'] 
      @$el.html JST['app/templates/login_register/login'] 

    events:
      'click #login-btn': 'login'
      'click #register-btn': 'register'
      'click #forget-password': 'forgetPassword'

    login: ->
      email = $('#login').find('.email').val()
      password = $('#login').find('.password').val()
      loginData =
        login: email
        password: password
        get_json: true
      $('#loading').show()
      @model.save loginData,
        wait: true
        success: @successCreate
    
    register: ->
      App.tool_helper.alert('to register view')
      # App.router.register()

    forgetPassword: ->
      App.tool_helper.alert('to forget-password view')
      # App.router.forgetPassword()

    successCreate: (model, response, options) ->
      data = response.data
      if data.error_message
        App.tool_helper.alert data.error_message
      else
        user = data.user
        window.localStorage.setItem('userAccessToken', user.token) 
        window.localStorage.setItem('userId', user.id)
        window.localStorage.setItem('userEmail', user.email) 
        App.router.loggedIn()
        App.router.home()
      App.tool_helper.hideLoading()


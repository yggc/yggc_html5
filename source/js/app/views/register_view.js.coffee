define [
  'composite.view'
  'jquery'
  'app/models/user'
  'app/templates/login_register/register'
], (CompositeView, $, User, RegisterTemplate) ->
  
  class RegisterView extends CompositeView
    
    tagName: 'div'
    id: 'register'

    initialize: (options) ->
      @$el.html JST["app/templates/login_register/register"] 
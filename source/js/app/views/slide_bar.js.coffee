define [
  'composite.view'
  'jquery'
  'app/templates/slide_bar'
], (CompositeView, $, SlideBarTemplate) ->
  
  class SlideBar extends CompositeView
  
    id: 'slide_bar_view'

    initialize: (options) ->
      @$el.html JST['app/templates/slide_bar'] 

    events:
      'click #login-btn': 'login'
      'click #register-btn': 'register'
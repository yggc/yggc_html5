require ['jquery', 'backbone', 'router'], ($, Backbone, Router) ->
  $(document).ready ->
    # FastClick.attach(document.body)
    window.App = 
      router: new Router()
      menuIsOpen: false
    $('.slide-menu').click ->
      if App.menuIsOpen
        slide.close()
        window.App.menuIsOpen = false
      else
        slide.open()
        window.App.menuIsOpen = true
     Backbone.history.start()

define [
  'composite.view'
  'jquery'
  'app/templates/slide_menu_icon'
], (CompositeView, $, SlideMenuIconTemplate) ->
  
  class SlideMenuIconView extends CompositeView
  
    className: 'slide-menu'

    initialize: (options) ->
      @$el.html JST['app/templates/slide_menu_icon'] 

    events:
      'click i': 'toggleSideBar'

    toggleSideBar: ->
      console.info 'ddd'
      if App.menuIsOpen
        App.tool_helper.closeSideBar()
      else
        App.tool_helper.openSideBar()

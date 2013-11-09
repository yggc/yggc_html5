require ['jquery', 'backbone', 'router','tool_helper'], ($, Backbone, Router, ToolHelper) ->
  $(document).ready ->
    # FastClick.attach(document.body)
    window.App.tool_helper = new ToolHelper()
    window.App.router = new Router()
    window.App.menuIsOpen = false
    Backbone.history.start()


require.config
  paths:
    jquery: "vendor/jquery"
    underscore: "vendor/underscore"
    backbone: "vendor/backbone"
    viewnavigator: "vendor/slide/viewnavigator"
    noClickDelay: "vendor/slide/noClickDelay"

  shim:
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"
    viewnavigator:
      deps: ["jquery"]
      exports: 'ViewNavigator'
window.App =
  # apiHost: 'http://www.sinopr.org'
  apiHost: 'http://0.0.0.0:3000'

require ["app"]


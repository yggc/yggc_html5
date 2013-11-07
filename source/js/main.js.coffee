
require.config
  paths:
    jquery: "vendor/jquery"
    underscore: "vendor/underscore"
    backbone: "vendor/backbone"
    forbid:   "vendor/forbid-selected"
  shim:
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

window.App =
  # apiHost: 'http://www.sinopr.org'
  apiHost: 'http://0.0.0.0:3000'

require ["app"]


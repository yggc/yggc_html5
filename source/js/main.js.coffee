
require.config
  paths:
    jquery: "vendor/jquery"
    underscore: "vendor/underscore"
    backbone: "vendor/backbone"
    viewnavigator: "vendor/slide/viewnavigator"
    slidingview: "vendor/slide/slidingview"
    noClickDelay: "vendor/slide/noClickDelay"
    animationEnhanced: "vendor/slide/jquery.animate-enhanced"

  shim:
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"
    viewnavigator:
      deps: ['jquery']
      exports: 'ViewNavigator'
    slidingview:
      exports: 'SlidingView'
    animationEnhanced:
      exports: 'AnimationEnhanced'
window.App =
  # apiHost: 'http://www.sinopr.org'
  apiHost: 'http://0.0.0.0:3000'

require ["app"]


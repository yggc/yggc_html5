define ['backbone'], (Backbone) ->
  
  class Event extends Backbone.Model
    
    url: ->
      App.apiHost + '/news/' + @id + '?token=' + currentUser.get('token')

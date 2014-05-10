Ractive = require 'ractive'
t = require './templates'

module.exports = ->
  new Ractive
    el: '#app-container'
    template: t.index
    data:
      example: null

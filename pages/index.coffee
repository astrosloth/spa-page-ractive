Ractive = require 'ractive'
fs = require 'fs'

module.exports = Ractive.extend
  template: fs.readFileSync 'pages/index.ract', 'utf8'
  data:
    example: 'fish'
    clickCount: 0
  init: ->
    @on 'clicked', -> @add 'clickCount'

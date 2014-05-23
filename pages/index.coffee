Ractive = require 'ractive'
fs = require 'fs'

module.exports = Ractive.extend
  template: fs.readFileSync 'pages/index.ract', 'utf8'
  init: ->
    @on 'clicked', -> @add 'clickCount'

  data:
    example: 'fish'
    clickCount: 0

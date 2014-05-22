fs = require 'fs'

module.exports = new class
  constructor: ->
    @template = fs.readFileSync 'pages/index.ract', 'utf8'
    @data =
      example: 'fish'
      clickCount: 0
    @events =
      clicked: @onClick
    @ractive = null

  attach: (ractive) -> @ractive = ractive

  onClick: =>
    @ractive.add 'clickCount'
    alert "clicked #{@ractive.get 'clickCount'} times"

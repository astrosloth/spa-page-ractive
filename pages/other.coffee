fs = require 'fs'
Ractive = require 'ractive'
Ractive.components.editable = require '../components/editable'

module.exports = new class
  constructor: ->
    @template = fs.readFileSync 'pages/other.ract', 'utf8'
    @data =
      e: 'potato'
      e2: 'purple'

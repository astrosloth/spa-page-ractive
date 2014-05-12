fs = require 'fs'

module.exports = new class
  constructor: ->
    @template = fs.readFileSync 'pages/other.html', 'utf8'

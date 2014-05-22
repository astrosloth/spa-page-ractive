fs = require 'fs'

module.exports = new class
  constructor: ->
    @template = fs.readFileSync 'pages/notfound.ract', 'utf8'

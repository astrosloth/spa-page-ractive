fs = require 'fs'

module.exports = new class
  constructor: ->
    @template = fs.readFileSync 'pages/notfound.html', 'utf8'

fs = require 'fs'
Ractive = require 'ractive'

module.exports = Ractive.extend
  template: fs.readFileSync 'pages/notfound.ract', 'utf8'

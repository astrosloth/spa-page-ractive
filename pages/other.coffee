Ractive = require 'ractive'
fs = require 'fs'

module.exports = Ractive.extend
  template: fs.readFileSync 'pages/other.ract', 'utf8'

  data:
    e: 'potato'
    e2: 'purple'

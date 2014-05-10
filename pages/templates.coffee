fs = require 'fs'

exports.index = fs.readFileSync './pages/index.html', 'utf8'
exports.other = fs.readFileSync './pages/other.html', 'utf8'
exports.notfound = fs.readFileSync './pages/notfound.html', 'utf8'

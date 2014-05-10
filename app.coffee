page = require 'page'
index = require './pages/index'
other = require './pages/other'
notfound = require './pages/notfound'

page '/', index
page '/other', other
page '*', notfound
page()

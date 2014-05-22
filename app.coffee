page = require 'page'
Ractive = require 'ractive'
pages = require './pages'
settings = require './settings'

currentRactive = null

switchRactive = (RactExt) -> (ctx) ->
  currentRactive?.teardown()
  ractOpts =
    el: '#app-container'
    debug: settings.debug
  if ctx.state.rdata? then ractOpts.data = ctx.state.rdata
  currentRactive = ctx.ractive = new RactExt ractOpts
  ctx.state.rdata = currentRactive.get()
  currentRactive.on 'teardown', -> ctx.save()

for p in pages
  page p.path, switchRactive p.RactExt

page()

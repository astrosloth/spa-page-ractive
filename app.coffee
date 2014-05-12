page = require 'page'
Ractive = require 'ractive'
pages = require './pages'
settings = require './settings'

currentRactive = null

ractive = (page) -> (ctx) ->
  currentRactive?.teardown()
  ctx.state.rdata = ctx.state.rdata ? page.data
  currentRactive = ctx.ractive = new Ractive
    el: '#app-container'
    template: page.template
    data: ctx.state.rdata
    debug: settings.debug
  currentRactive.on 'teardown', -> ctx.save()
  page.attach? currentRactive
  for event, handler of page.events
    currentRactive.on event, handler

page '*', (ctx, next) ->
  next()
page '/', ractive pages.index
page '/other', ractive pages.other
page '*', ractive pages.notfound
page()

page = require 'page'
Ractive = require 'ractive'
templates = require './templates'
settings = require './settings'

currentRactive = null

ractive = (tmpl) -> (ctx) ->
  currentRactive?.teardown()
  ctx.state.rdata = ctx.state.rdata ? {}
  currentRactive = ctx.ractive = new Ractive
    el: '#app-container'
    template: templates[tmpl]
    data: ctx.state.rdata
    debug: settings.debug
  currentRactive.on 'teardown', -> ctx.save()

page '*', (ctx, next) ->
  next()
page '/', ractive 'index'
page '/other', ractive 'other'
page '*', ractive 'notfound'
page()

page = require 'page'
Ractive = require 'ractive'
templates = require './templates'
settings = require './settings'

ractive = (tmpl) -> (ctx) ->
  r = ctx.ractive = new Ractive
    el: '#app-container'
    template: templates[tmpl]
    data: ctx.state
    debug: settings.debug
  r.on 'change', -> ctx.save()

page '*', (ctx, next) ->
  next()
page '/', ractive 'index'
page '/other', ractive 'other'
page '*', ractive 'notfound'
page()

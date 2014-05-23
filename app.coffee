page = require 'page'
Ractive = require 'ractive'
pages = require './pages'
components = require './components'
settings = require './settings'

appHost = new class
  constructor: -> @teardown()

  teardown: ->
    @currentRact?.teardown()
    @currentRact = null

  switchTo: (Ract) -> (ctx) =>
    @teardown()
    opts =
      el: '#app-container'
      debug: settings.debug
    @currentRact = new Ract opts

for name, ract of components
  Ractive.components[name] = ract

for path, Ract of pages
  page path, appHost.switchTo Ract

page()

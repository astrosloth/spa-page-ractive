Ractive = require 'ractive'
fs = require 'fs'

module.exports = Ractive.extend
  template: fs.readFileSync 'components/editable.ract', 'utf8'
  init: ->
    @on 'edit', ->
      @set 'editing', true
      @find('input').select()

    @on 'done', -> @set 'editing', false

  data:
    editing: false

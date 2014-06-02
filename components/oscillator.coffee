Ractive = require 'ractive'
fs = require 'fs'

module.exports = Ractive.extend
  template: fs.readFileSync 'components/oscillator.ract', 'utf8'
  init: ->
    @audioctx = new AudioContext()
    @oscillator = null
    @find('input[type="range"]').value = @get 'frequency'
    @on 'toggle', ->
      if @get('playing') and @oscillator?
        @oscillator.stop()
        @oscillator = null
        @set 'playing', false
      else
        @oscillator = @audioctx.createOscillator()
        @oscillator.frequency.value = @get 'frequency'
        @oscillator.connect @audioctx.destination
        @oscillator.start(0)
        @set 'playing', true
    @observe 'frequency', (freq) ->
      if @oscillator? and @get 'playing' then @oscillator.frequency.value = freq

  data:
    frequency: 440
    min: 22
    max: 440 * 4
    playing: false

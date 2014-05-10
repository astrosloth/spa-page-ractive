PouchDB = require 'pouchdb'

module.exports = new class
  constructor: ->
    @db = new PouchDB()

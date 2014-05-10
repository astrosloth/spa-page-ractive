gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'
uglify = require 'gulp-uglify'
connect = require 'gulp-connect'

gulp.task 'serve', connect.server

gulp.task 'default', ->
  browserify
    entries: ['./app.coffee']
    extensions: ['.coffee']
  .bundle()
  .pipe source 'app.js'
  .pipe gulp.dest './build'
  .pipe streamify uglify()
  .pipe gulp.dest './build/min'

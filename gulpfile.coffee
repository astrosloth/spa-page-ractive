gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'
uglify = require 'gulp-uglify'
connect = require 'gulp-connect'

gulp.task 'app', ->
  browserify
    entries: ['./app.coffee']
    extensions: ['.coffee']
  .transform 'coffeeify'
  .transform 'brfs'
  .bundle()
  .pipe source 'app.js'
  .pipe gulp.dest './build'
  .pipe streamify uglify()
  .pipe gulp.dest './build/min'

statics = []

gulp.task 'static', ->
  for s in statics
    gulp.src s
    .pipe gulp.dest './'

gulp.task 'build', ['app', 'static']

gulp.task 'serve', connect.server

gulp.task 'watch', ->
  gulp.watch statics.concat(['*.coffee', 'pages/*', 'components/*']), ['build']

gulp.task 'default', ['build', 'serve', 'watch']

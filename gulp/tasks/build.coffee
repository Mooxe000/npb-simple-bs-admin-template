echo = console.log
gulp = require 'gulp'
gulpFilter = require 'gulp-filter'

coffee = require 'gulp-coffee'
jade = require 'gulp-jade'
less = require 'gulp-less'

tap = require 'gulp-tap'
watch = require 'gulp-watch'
browserSync = require 'browser-sync'

module.exports = ->

  jadeFilter = gulpFilter ['**/*.jade']
  lessFilter = gulpFilter ['**/*.less']
  coffeeFilter = gulpFilter ['**/*.coffee']

  gulp.src 'src/**/*'

  # jade
  .pipe jadeFilter
  .pipe jade
    pretty: true
    locals: {}
  .pipe jadeFilter.restore()

  # stylus
  .pipe lessFilter
  .pipe less()
  .pipe lessFilter.restore()

  # coffee
  .pipe coffeeFilter
  .pipe coffee
    bare: true
  .pipe coffeeFilter.restore()

  # browserSync
  .pipe browserSync.reload stream:true

  # dest
  .pipe gulp.dest 'build'

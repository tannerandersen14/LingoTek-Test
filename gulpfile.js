'use strict';

var gulp = require('gulp');
var concat = require('gulp-concat');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var gulpIf = require('gulp-if');
var gulpIfElse = require('gulp-if-else');
var jade = require('gulp-jade');
var livereload = require('gulp-livereload');
var replace = require('gulp-replace');
var stylus = require('gulp-stylus');
var uglify = require('gulp-uglify');
var css = require('gulp-minify-css');
var ngAnnotate = require('gulp-ng-annotate');
var htmlmin = require('gulp-htmlmin');
var nodemon = require('gulp-nodemon');
var notify = require('gulp-notify');
var lr = require('tiny-lr');
var server = lr()

gulp.task('watch', function() {
  livereload({ start: true, auto: false })
  server.listen(5052, function(err) {
    if (err) {
      return console.log(err);
    }
    gulp.watch(['./src/cs/**/*.coffee', './src/css/**/*.styl', './src/views/**/*.jade', './src/*.jade'], ['coffee', 'compileStyles', 'jade', 'index', 'watch'])
  });
});

gulp.task('nodemon', function() {
  livereload({ start: true, auto: false })
  nodemon({
    script: './server.js'
  })
})

gulp.task('compileStyles', function(){
  gulp.src('./src/css/**/*.styl')
    .pipe(stylus())
 	  .pipe(css())
    .pipe(gulp.dest('./public'))
    .pipe(livereload(server))
});

gulp.task('coffee', function() {
  gulp.src('./src/cs/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(ngAnnotate())
    .pipe(uglify())
    .pipe(concat('all.min.js'))
    .pipe(gulp.dest('./public/'))
    .pipe(livereload(server))
});

gulp.task('jade', function() {
  gulp.src(['./src/views/**/*.jade'])
    .pipe(jade())
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('./public'))
    .pipe(livereload(server))
});

gulp.task('index', function() {
  gulp.src('./src/*.jade')
    .pipe(jade())
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('./public'))
    .pipe(livereload(server))
});

gulp.task('default', ['coffee', 'compileStyles', 'jade', 'index', 'watch', 'nodemon']);

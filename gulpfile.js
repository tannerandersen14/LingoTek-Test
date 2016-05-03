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

var watcher = gulp.task('watch', function() {
  livereload.listen();
  gulp.watch(['./src/cs/**/*.coffee', './src/css/**/*.styl', './src/views/**/*.jade', './src/*.jade'], ['default'])
});
watcher.on('change', function( event ) {
        console.log('File ' + event.path + ' was ' + event.type + ' at ' + new Date() + ' , running tasks...');
});

gulp.task('compileStyles', function(){
  gulp.src('./src/css/**/*.styl')
    .pipe(stylus())
 	  .pipe(css())
    .pipe(gulp.dest('./public'))
    .pipe(livereload())
});

gulp.task('coffee', function() {
  gulp.src('./src/cs/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(ngAnnotate())
    .pipe(uglify())
    .pipe(concat('all.min.js'))
    .pipe(gulp.dest('./public/'))
    .pipe(livereload())
});

gulp.task('jade', function() {
  gulp.src(['./src/views/**/*.jade'])
    .pipe(jade())
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('./public'))
    .pipe(livereload())
});

gulp.task('index', function() {
  gulp.src('./src/*.jade')
    .pipe(jade())
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('./public'))
    .pipe(livereload())
});

gulp.task('default', ['compileStyles', 'coffee', 'jade', 'index']);

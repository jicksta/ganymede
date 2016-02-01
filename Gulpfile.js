var gulp = require('gulp');
//var sourcemaps = require('gulp-sourcemaps');
var elm  = require('gulp-elm');
var sass = require('gulp-sass');

///////////////////////////////////////////////////////////

gulp.task('default', ['sass:watch', 'elm:watch']);

///////////////////////////////////////////////////////////

gulp.task('elm-init', elm.init);
gulp.task('elm', ['elm-init'], function(){
   return gulp.
            src('src/*.elm').
            pipe(elm()).
            pipe(gulp.dest('build/'));
});

///////////////////////////////////////////////////////////

gulp.task('sass', function () {
  gulp.
    src('./sass/**/*.scss').
    pipe(sass().on('error', sass.logError)).
    pipe(gulp.dest('./build/css'));
});

///////////////////////////////////////////////////////////

gulp.task('elm:watch', ['elm'], function(){
  gulp.watch('./src/**/*.elm', ['elm']);
});

gulp.task('sass:watch', ['sass'], function () {
  gulp.watch('./sass/**/*.scss', ['sass']);
});



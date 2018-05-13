/// <binding AfterBuild='default' ProjectOpened='default' />
var gulp = require('gulp');
var bower = require('gulp-bower');
var concat = require('gulp-concat');
var replace = require('gulp-replace');

gulp.task('OpenInAbracadabraTask', function () { return OIAConcat() });

gulp.task('default',
    ['OpenInAbracadabraTask']);

function OIAConcat () { 

    //var filesToConcat = ['aaa.md', 'bbb.md'];
    
    //filesToConcat.push(
    //    'bbb.md'
    //);

    return gulp
        //.src(filesToConcat)
        //.pipe(concat('aaa.md' + 'bbb.md'));
        //.pipe(gulp.dest('.'));
        .pipe(concat('aaa.md' + 'bbb.md'));
} 

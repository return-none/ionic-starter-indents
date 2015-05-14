gulp = require('gulp')
concat = require('gulp-concat')
rename = require('gulp-rename')

jade = require('gulp-jade')
sass = require('gulp-sass')
coffee  = require('gulp-coffee')
sourcemaps = require('gulp-sourcemaps')

path = {
    coffee: ['./assets/coffee/app.coffee', './assets/coffee/**/*.coffee'],
    sass: ['./assets/sass/**/*.sass'],
    jade: ['./assets/jade/**/*.jade']
}

dest = {
    coffee: './www/js/',
    sass: './www/css/',
    jade: './www/templates/'
}

clog = (error) ->
    console.log(error.toString())
    @.emit('end')
    return @

gulp.task('coffee', ->
    gulp.src(path.coffee)
    .pipe(sourcemaps.init())
    .pipe(coffee({bare: true}).on('error', clog))
    .pipe(concat('app.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(dest.coffee))
)

gulp.task('scss', ->
    gulp.src('./assets/sass/ionic.app.scss')
    .pipe(sass({errLogToConsole: true}))
    .pipe(rename({extname: '.css'}))
    .pipe(gulp.dest(dest.sass))
)

gulp.task('sass', ->
    gulp.src(path.sass)
    .pipe(sourcemaps.init())
    .pipe(concat('app.css'))
    .pipe(sass({indentedSyntax: true, errLogToConsole: true}))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(dest.sass))
)

gulp.task('jade', ->
    gulp.src(path.jade)
    .pipe(jade().on('error', clog))
    .pipe(gulp.dest(dest.jade))
)

gulp.task('watch', ->
    gulp.watch('./assets/sass/ionic.app.scss', ['scss'])
    gulp.watch(path.coffee, ['coffee'])
    gulp.watch(path.sass, ['sass'])
    gulp.watch(path.jade, ['jade'])
)

gulp.task('default', ['coffee', 'sass', 'jade', 'scss'])

module.exports = (grunt) ->
  'use strict'

  grunt.initConfig

    autoprefixer:
      options:
        browsers: ['last 2 version', 'ie 8', 'ie 7']
      dist:
        src: ['css/screen.css']
        dest: 'css/screen.css'

    browser_sync:
      files:
        src: ['htdocs/index.html', 'htdocs/css/*.css']
      options:
        server:
          baseDir: 'htdocs'
        watchTask: true
        ghostMode:
          scroll: true
          links: true
          forms: true

    connect:
      server:
        options:
          port: 8080
          base: 'htdocs/'
          open: 'http://localhost:8080/'

    copy:
      main:
        src: 'js/*.js'
        dest: 'htdocs/'

    csscss:
      options:
        compass: true
        require: 'config.rb'
      dist:
        src:['sass/screen.sass']

    cssmin:
      dist:
        src: ['css/screen.css']
        dest: 'htdocs/css/styles.min.css'

    csscomb:
      dist:
        options:
          sortOrder: 'csscomb.json'

        src: ['css/screen.css']
        dest: 'htdocs/css/screen.css'

    csslint:
      dist:
        options:
          csslintrc: '.csslintrc'
        src: ['css/screen.css']
        dest: 'htdocs/css/screen.css'

    sass:
      dist:
        options:
          style: 'expanded'
          compass: true

        files:
          'htdocs/css/screen.css': 'sass/screen.sass'

    slim:
      dist:
      	options:
          pretty: false
        
        files:
          'htdocs/index.html': 'slim/index.slim'

    watch:
      options:
        livereload: true
        spawn: false

      js:
        files: 'js/*.js'
        tasks: 'copy'

      sass:
        files: 'sass/*.sass'
        tasks: 'sass:dist'

      slim:
        files: 'slim/index.slim'
        tasks: 'slim:dist'


  grunt.registerTask 'default', [], ->
    grunt.loadNpmTasks 'grunt-slim'
    grunt.loadNpmTasks 'grunt-notify'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.task.run 'connect', 'watch'

  grunt.registerTask 'style', [], ->
    grunt.loadNpmTasks 'grunt-notify'
    grunt.loadNpmTasks 'grunt-csscss'
    grunt.loadNpmTasks 'grunt-csscomb'
    grunt.loadNpmTasks 'grunt-autoprefixer'
    grunt.loadNpmTasks 'grunt-contrib-csslint'
    grunt.task.run 'autoprefixer', 'csscomb', 'csscss', 'csslint'

  grunt.registerTask 'min', [], ->
    grunt.loadNpmTasks 'grunt-notify'
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.task.run 'cssmin'

  grunt.registerTask 'sync', [], ->
    grunt.loadNpmTasks 'grunt-browser-sync'
    grunt.task.run 'default'
    grunt.task.run 'browser_sync'

module.exports = (grunt) ->
  'use strict'

  grunt.initConfig

    autoprefixer:
      options:
        browsers: ['last 2 version', 'ie 8', 'ie 7']
      dist:
        src: 'css/screen.css'
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

    coffee:
      options:
        sourceMap: true
        bare: true
      compile:
        files:
          'htdocs/js/script.js': 'coffee/script.coffee'

    connect:
      server:
        options:
          port: 8080
          base: 'htdocs/'
          open: 'http://localhost:8080/'

    csscss:
      options:
        compass: true
        require: 'config.rb'
      dist:
        src:'sass/screen.sass'

    cssmin:
      dist:
        src: 'htdocs/css/screen.css'
        dest: 'htdocs/css/screen.min.css'

    csscomb:
      dist:
        options:
          sortOrder: 'csscomb.json'
        src: 'css/screen.css'
        dest: 'htdocs/css/screen.css'

    csslint:
      dist:
        options:
          csslintrc: '.csslintrc'
        src: 'css/screen.css'
        dest: 'htdocs/css/screen.css'

    imagemin:
      dist:
        options:
          optimizationLevel: 3
        files: [
          expand: true
          cwd: 'develop/img/'
          src: ['**/*.{png,jpg,gif}']
          dest: 'htdocs/img/'
        ]

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

      coffee:
        files: 'coffee/*.coffee'
        tasks: 'coffee'

      sass:
        files: 'sass/*.sass'
        tasks: 'sass'

      slim:
        files: 'slim/index.slim'
        tasks: 'slim'

  grunt.registerTask 'default', [], ->
    grunt.task.run 'dev'

  grunt.registerTask 'dev', [], ->
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.task.run 'connect', 'watch'

  grunt.registerTask 'watch', [], ->
    grunt.loadNpmTasks 'grunt-slim'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.task.run 'watch'

  grunt.registerTask 'sync', [], ->
    grunt.loadNpmTasks 'grunt-browser-sync'
    grunt.task.run 'browser_sync', 'watch'

  grunt.registerTask 'style', [], ->
    grunt.loadNpmTasks 'grunt-csscss'
    grunt.loadNpmTasks 'grunt-csscomb'
    grunt.loadNpmTasks 'grunt-autoprefixer'
    grunt.loadNpmTasks 'grunt-contrib-csslint'
    grunt.task.run 'autoprefixer', 'csscomb', 'csscss', 'csslint'

  grunt.registerTask 'min', [], ->
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.loadNpmTasks 'grunt-contrib-imagemin'
    grunt.task.run 'cssmin', 'imagemin'

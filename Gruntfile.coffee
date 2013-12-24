module.exports = (grunt) ->
  'use strict'

  grunt.initConfig

    pkg: grunt.file.readJSON("package.json")

    autoprefixer:
      options:
        browsers: ['last 2 version', 'ie 8', 'ie 7']
      dist:
        src: '<%= sass.dist.dest %>'
        dest: 'htdocs/css/screen.style.css'

    browser_sync:
      files:
        src: ['<%= slim.dist.dest %>', '<%= sass.dist.dest %>']
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
        src: '<%= pkg.name %>/coffee/script.coffee'
        dest: 'htdocs/js/script.js'

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
        src: '<%= autoprefixer.dist.dest %>'

    cssmin:
      dist:
        src: '<%= sass.dist.dest %>'
        dest: 'htdocs/css/screen.min.css'

    csscomb:
      dist:
        options:
          sortOrder: 'csscomb.json'
        src: '<%= autoprefixer.dist.dest %>'
        dest: 'htdocs/css/screen.css'

    csslint:
      dist:
        options:
          csslintrc: '.csslintrc'
        src: '<%= autoprefixer.dist.dest %>'
        dest: 'htdocs/css/screen.css'

    imagemin:
      dist:
        options:
          optimizationLevel: 7
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
        src: '<%= pkg.name %>/sass/screen.sass'
        dest: 'htdocs/css/screen.css'

    slim:
      dist:
        options:
          pretty: true
        src: '<%= pkg.name %>/index.slim'
        dest: 'htdocs/index.html'

    watch:
      options:
        spawn: false
        atBegin: true
        livereload: true

      coffee:
        files: '<%= coffee.compile.src %>'
        tasks: 'coffee'

      sass:
        files: '<%= sass.dist.src %>'
        tasks: 'sass'

      slim:
        files: '<%= slim.dist.src %>'
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

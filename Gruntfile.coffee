module.exports = (grunt) ->
  'use strict'

  grunt.initConfig

    # grunt-bower-task
    # https://github.com/yatskevich/grunt-bower-task
    bower:
      install:
        options:
          targetDir: './source'
          layout: 'byType'
          install: true
          verbose: false
          clearnTargetDir: true
          cleanBowerDir: true

    # grunt-browser-sync
    # https://github.com/shakyshane/grunt-browser-sync
    browser_sync:
      files:
        src: ['build/index.html', 'build/stylesheets/style.css']
      options:
        server:
          baseDir: 'build'
        watchTask: false
        ghostMode:
          scroll: true
          links: true
          forms: true

    # grunt-contrib-connect
    # https://github.com/gruntjs/grunt-contrib-connect
    connect:
      server:
        options:
          port: 9001
          base: 'build'
          open: 'http://localhost:9001/'

    # grunt-csscomb
    # https://github.com/csscomb/grunt-csscomb
    # https://github.com/csscomb/csscomb.js
    csscomb:
      options:
        config: 'csscomb.json'
      dist:
        expand: true
        cwd: 'build/stylesheets/'
        src: ['*.css']
        dest: 'build/stylesheets'

    # grunt-prettify
    # https://github.com/jonschlinkert/grunt-prettify
    prettify:
      options:
        condense: true
        padcomments: false
        indent: 2
        indent_char: ' '
        indent_inner_html: 'false'
        brace_style: 'expand'
        wrap_line_length: 0
        preserve_newlines: true
        unformatted: [
          'dd'
        ]
      files:
        expand: true
        cwd: 'build'
        src: ['**/*.html']
        dest: 'build'

    # grunt-contrib-htmlmin
    # https://github.com/gruntjs/gruntcontrib-htmlmin
    htmlmin:
      options:
        removeComments: true
        collapseWhitespace: true
      files:
        expand: true
        cwd: 'build'
        src: '**/*.html'
        dest: 'build'

    # grunt-contrib-watch
    # https://github.com/gruntjs/grunt-contrib-watch
    watch:
      options:
        spawn: false
        atBegin: false
        livereload: true

  grunt.registerTask 'default', [], ->
    grunt.loadNpmTasks 'grunt-bower-task'
    grunt.task.run 'bower'

  grunt.registerTask 'p', [], ->
    grunt.loadNpmTasks 'grunt-csscomb'
    grunt.loadNpmTasks 'grunt-prettify'
    grunt.loadNpmTasks 'grunt-contrib-htmlmin'
    grunt.task.run 'htmlmin', 'prettify', 'csscomb'

  grunt.registerTask 's', [], ->
    grunt.loadNpmTasks 'grunt-browser-sync'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.task.run 'browser_sync', 'watch'

  grunt.registerTask 'w', [], ->
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.task.run 'connect', 'watch'

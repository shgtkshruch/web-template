module.exports = (grunt) ->
  grunt.initConfig

    autoprefixer:
      options:
        browsers: ["last 2 version", "ie 8", "ie 7"]
      dist:
        src: ["css/screen.css"]
        dest: "css/screen.css"

    bower:
      install:
        options:
          targetDir: "./lib"
          layout: "byType"
          install: "true"
          verbose: "false"
          cleanTargetDir: "true"
          cleanBowerDir: "false"

    browser_sync:
      files:
        src: ["htdocs/index.html", "htdocs/css/*.css"]
      options:
        server:
          baseDir: "htdocs"
        watchTask: true
        ghostMode:
          scroll: true
          links: true
          forms: true

    compass:
      dist:
        options:
          config: "config.rb"

        sassDir: "sass"
        cssDir: "css"
        imgDir: "img"
        javascriptDir: "js"
        outputStyle: "expanded"
        httpPath: "htdocs"

    copy:
      main:
        src: "js/*.js"
        dest: "htdocs/"

    csscss:
      options:
        compass: true
        require: "config.rb"
      dist:
        src:["sass/screen.sass"]

    cssmin:
      dist:
        src: ["css/screen.css"]
        dest: "htdocs/css/styles.min.css"

    csscomb:
      dist:
        options:
          sortOrder: "csscomb.json"

        src: ["css/screen.css"]
        dest: "htdocs/css/screen.css"

    csslint:
      dist:
        options:
          csslintrc: ".csslintrc"
        src: ["css/screen.css"]
        dest: "htdocs/css/screen.css"

    sass:
      dist:
        options:
          style: "expanded"
          compass: true

        src: ["sass/screen.sass"]
        dest: "htdocs/css/screen.css"

    slim:
      dist:
      	options:
          pretty: "false"

        src: ["slim/index.slim"]
        dest: "htdocs/index.html"

    watch:
      options:
        livereload: true

      # compass:
      #   files: "sass/*.sass"
      #   tasks: "compass:dist"

      js:
        files: "js/*.js"
        tasks: "copy"

      sass:
        files: "sass/*.sass"
        tasks: "sass"

      slim:
        files: "slim/index.slim"
        tasks: "slim"

  grunt.loadNpmTasks "grunt-slim"
  grunt.loadNpmTasks "grunt-csscss"
  grunt.loadNpmTasks "grunt-notify"
  grunt.loadNpmTasks "grunt-csscomb"
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-browser-sync"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-csslint"

  grunt.registerTask "default", ["browser_sync", "watch"]
  grunt.registerTask "stylesheet", ["sass", "autoprefixer", "csscomb"]
  grunt.registerTask "build", ['sass', 'cssmin', 'slim']
  grunt.registerTask "bower", "bower.install"

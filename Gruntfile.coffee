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
        dest: "css/screen.css"

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

      sass:
        files: "sass/*.sass"
        tasks: "sass:dist"

      slim:
        files: "<%= slim.dist.src %>"
        tasks: "slim:dist"

  grunt.loadNpmTasks "grunt-slim"
  grunt.loadNpmTasks "grunt-csscss"
  grunt.loadNpmTasks "grunt-csscomb"
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-csslint"

  grunt.registerTask "default", "watch"
  grunt.registerTask "stylesheet", ["sass", "autoprefixer", "csscomb"]
  grunt.registerTask "build", ['compass', 'sass', 'cssmin', 'slim']
  grunt.registerTask "bower", "bower.install"

module.exports = (grunt) ->
  grunt.initConfig

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

    sass:
      dist:
        options:
          style: "expanded"
          compass: "true"

        src: ["sass/screen.sass"]
        dest: "css/screen.css"

    cssmin:
      dist:
        src: ["css/screen.css"]
        dest: "htdocs/css/styles.min.css"

    csscomb:
      dist:
        options:
          sortOrder: "config/csscomb.json"
        
        src: ["css/screen.css"]
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

      compass:
        files: "sass/*.sass"
        tasks: "compass:dist"

      sass:
        files: "sass/*.sass"
        tasks: "sass:dist"

      csscomb:
        files: "<%= csscomb.dist.src %>"
        tasks: "csscomb:dist"

      cssmin:
        files: "<%= cssmin.dist.src %>"
        tasks: "cssmin:dist"

      slim:
        files: "<%= slim.dist.src %>"
        tasks: "slim:dist"

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-csscomb"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-slim"
  grunt.loadNpmTasks "grunt-bower-task"
  
  grunt.registerTask "default", "watch"
  grunt.registerTask "build", ['compass', 'sass', 'cssmin', 'slim']
  grunt.registerTask "bower", "bower.install"

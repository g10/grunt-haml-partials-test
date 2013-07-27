module.exports = (grunt) ->

  #
  grunt.loadNpmTasks 'grunt-haml'

  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.loadNpmTasks 'grunt-open'



  # paths

  PATH =

    src_dir: 'src'
    build_dir: 'build'


  #
  # config
  #

  grunt.initConfig

    # dev server on localhost

    connect:

      build:
        options:
          hostname: 'localhost'
          port: 8000
          base: PATH.build_dir
          keepalive: false

    # clean directories

    clean:
      build:
        src: [ PATH.build_dir ]

    # open urls and files

    open:
       dev:
        path: 'http://localhost:8000/main.html'

    # compile haml (supports inline coffeescript)

    haml:

      options:
        language: 'coffee'

      compile:
        expand: true
        cwd: PATH.src_dir
        src: [ '**/*.haml' ]
        dest: PATH.build_dir
        ext: '.html'




  #
  # main cli tasks
  #

  grunt.registerTask 'dev-opt1', [
    'clean:build' 
    'haml:compile'
    'connect'
    'open:dev'
  ]

  grunt.registerTask 'dev-opt2', [
    'clean:build' 
    'haml:compilePartial'
    'connect'
    'open:dev'
  ]

  #

  grunt.registerTask 'default', ['dev-opt1']


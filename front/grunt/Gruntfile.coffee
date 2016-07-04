module.exports = (grunt)->


  # タスクの設定
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['src/*.coffee']
      tasks: 'coffee'
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: 'dest/'
          ext: '.js'
        ]

  # モジュールの読み込み
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # タスクの登録
  grunt.registerTask 'default', ['watch']
  return

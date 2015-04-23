// Generated on 2014-08-28 using generator-webapp 0.4.9
'use strict';

// # Globbing
// for performance reasons we're only matching one level down:
// 'test/spec/{,*/}*.js'
// use this if you want to recursively match all subfolders:
// 'test/spec/**/*.js'

module.exports = function (grunt) {
  // Load grunt tasks automatically
  require('load-grunt-tasks')(grunt);

  // Time how long tasks take. Can help when optimizing build times
  require('time-grunt')(grunt);

  // Define the configuration for all the tasks
  grunt.initConfig({
    compass : {
      dist: {
        options: {
          outputStyle: 'compressed',
          sassDir: 'Projet/Front/sass',
          cssDir: 'public/projet/front/css'
        }
      }
    },
    composer : {},
    bower : {
      options: {
        targetDir: 'public/projet/bower_components'
      },
      install: {},
      update: {}
    },
    clean: {
      dist: {
        files: [
          {
            dot: true,
            src: [
              'dist/*'
            ]
          }
        ]
      }
    },
    rsync: {
      options: {
        args: [
          '-uazL'
        ],
        exclude: [
          '.git',
          '.git*',

          '*.default.ini',
          'local.ini',

          '*.sql',
          'nb_project',
          'upload',
          'db',

          '*.scss',
          'config.rb',
          '.sass-cache',

          'nbproject',

          'package.json',
          'node_modules',
          'Gruntfile.js',

          '.bowerrc',
          'bower.json',

          'composer.*',
          '/dist'
        ],
        recursive: true
      },
      dist: {
        options: {
          src: './',
          dest: './dist',
          delete: true
        }
      }
//      production: {
//        options: {
//          args: [
//            '-uavzL'
//          ],
//          src: './dist/',
//          dest: 'www',
//          host: 'user@doma.in'
//        }
//      }
    },
//    uglify: {
//      dist: {
//        files: {
//        }
//      }
//    },
    copy: {
      dist: {
        files: [
          {
            src: 'upload/temp',
            dest: 'dist/upload/temp'
          }
        ]
      }
    }

//    replace: {
//      dist: {
//        src: 'dist/public/projet/front/js/main.js',
//        dest: 'dist/public/projet/front/js/main.js',
//        replacements: [
//          {
//            from: /urlArgs\:[^\,]*\,/g,
//            to: 'urlArgs: "<%= gitinfo.local.branch.current.shortSHA %>",'
//          }
//        ]
//      }
//    },
//    gitinfo: {
//      options: {
//        cwd: './'
//      }
//    }

//    htmlmin: {
//      dist: {
//        options: {
//          removeComments: false,
//          collapseWhitespace: true
//        },
//        files: {
//          'dist/Projet/Front/view/main.phtml': 'Projet/Front/view/main.phtml'
//        }
//      }
//    }
  });

  // updating server and client libs
  grunt.registerTask('updateLibs', [
    'composer:update',
    'bower:update'
  ]);

  grunt.registerTask('requireBust', [
    'gitinfo',
    'replace'
  ]);

  // copying and uglifying files to dist directory
  grunt.registerTask('build', [
    'clean:dist',
    'compass:dist',
    'rsync:dist',
    'uglify:dist',
    'copy:dist',
//    'htmlmin:dist',
    'requireBust'
  ]);

//  grunt.registerTask('deploy', [
//    'rsync:production'
//  ]);
};

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    config: {
      static: 'ascent_jet/common/static/',
      // static: '/Users/ivan/Sites/ascent_jet/ascent_jet/common/static/',
      templates: 'ascent_jet/'
    },

    bowercopy: {
      options: {
        srcPrefix: 'bower_components'
      },
      scripts: {
        options: {
          destPrefix: '<%= config.static %>scripts/vendor'
        },
        files: {
          'jquery/jquery.js': 'jquery/jquery.js',
          'slick/slick.js': 'slick/dist/slick.js',
          'slick-carousel/slick.js': 'slick-carousel/slick/slick.js',
          'angular/angular.js': 'angular/angular.js',
          'angular/angular-animate.js': 'angular-animate/angular-animate.js',
          'angular/angular-aria.js': 'angular-aria/angular-aria.js',
          'angular/angular-cookies.js': 'angular-cookies/angular-cookies.js',
          'angular/angular-messages.js': 'angular-messages/angular-messages.js',
          'angular/angular-resource.js': 'angular-resource/angular-resource.js',
          'angular/angular-route.js': 'angular-route/angular-route.js',
          'angular/angular-sanitize.js': 'angular-sanitize/angular-sanitize.js',
          'angular/angular-touch.js': 'angular-touch/angular-touch.js',
          'angular/angular-route.js': 'angular-route/angular-route.js',
          'superfish/superfish.js': 'superfish/dist/js/superfish.js',
          'jquery-ui/core.js': 'jquery-ui/ui/core.js',
          'jquery-ui/datepicker.js': 'jquery-ui/ui/datepicker.js',
          'jquery-ui/widget.js': 'jquery-ui/ui/widget.js',
          'jquery-ui/position.js': 'jquery-ui/ui/position.js',
          'jquery-ui/menu.js': 'jquery-ui/ui/menu.js',
          'jquery-ui/autocomplete.js': 'jquery-ui/ui/autocomplete.js',
          'angular/angular-autocomplete.js': 'ui-autocomplete/autocomplete.js',
          'angular/angular-date.js': 'angular-ui-date/src/date.js',
          'angular/angular-checklist.js': 'checklist-model/checklist-model.js',
          'angular/angular-biscuit.js': 'ng-biscuit/dist/ng-biscuit.js',
          'angular/angular-lodash.js': 'lodash/dist/lodash.js',
          'angular/angular-maps.js': 'angular-google-maps/dist/angular-google-maps.js',
          'angular/angular-select2.js': 'angular-ui-select/dist/select.js',
          'select2/select2.js': 'select2/dist/js/select2.js',
          'angular/angular-local-storage.js': 'angular-local-storage/dist/angular-local-storage.js',
          'angular/angular-mask.js': 'angular-mask/dist/ngMask.js',
          'angular/angular-dialog.js': 'ngDialog/js/ngDialog.js',
          'angular/angular-slick.js': 'angular-slick/dist/slick.js',
          'angular/angular-shims-placeholder.js': 'angular-shims-placeholder/dist/angular-shims-placeholder.js',
          'fancybox/fancybox.js': 'fancybox/source/jquery.fancybox.js',
          'cookie/cookied.js': 'js-cookie/src/js.cookie.js',
          'jquery-validation/jquery-validation.js': 'jquery-validation/dist/jquery.validate.js',
          'jquery-placeholder/jquery-placeholder.js': 'jquery-placeholder/jquery.placeholder.js',
        }
      }
    },

    concat: {
      app: {
        src: ['<%= config.static %>scripts/app/**/*.js'],
        dest: '<%= config.static %>scripts/app.js'
      },
      vendor: {
        src: [
          '<%= config.static %>scripts/vendor/jquery/jquery.js',
          '<%= config.static %>scripts/vendor/slick/slick.js',
          '<%= config.static %>scripts/vendor/slick-carousel/slick.js',
          '<%= config.static %>scripts/vendor/jquery-ui/core.js',
          '<%= config.static %>scripts/vendor/jquery-ui/datepicker.js',
          '<%= config.static %>scripts/vendor/jquery-ui/widget.js',
          '<%= config.static %>scripts/vendor/jquery-ui/position.js',
          '<%= config.static %>scripts/vendor/jquery-ui/menu.js',
          '<%= config.static %>scripts/vendor/jquery-ui/autocomplete.js',
          '<%= config.static %>scripts/vendor/superfish/superfish.js',
          '<%= config.static %>scripts/vendor/infobox/infobox.js',
          '<%= config.static %>scripts/vendor/popover/jquery.webui-popover.min.js',
          '<%= config.static %>scripts/vendor/select2/select2.js',
          '<%= config.static %>scripts/vendor/fancybox/fancybox.js',
          '<%= config.static %>scripts/vendor/angular/angular.js',
          '<%= config.static %>scripts/vendor/angular/angular-animate.js',
          '<%= config.static %>scripts/vendor/angular/angular-aria.js',
          '<%= config.static %>scripts/vendor/angular/angular-cookies.js',
          '<%= config.static %>scripts/vendor/angular/angular-messages.js',
          '<%= config.static %>scripts/vendor/angular/angular-resource.js',
          '<%= config.static %>scripts/vendor/angular/angular-route.js',
          '<%= config.static %>scripts/vendor/angular/angular-sanitize.js',
          '<%= config.static %>scripts/vendor/angular/angular-touch.js',
          '<%= config.static %>scripts/vendor/angular/angular-autocomplete.js',
          '<%= config.static %>scripts/vendor/angular/angular-date.js',
          '<%= config.static %>scripts/vendor/angular/angular-checklist.js',
          '<%= config.static %>scripts/vendor/angular/angular-biscuit.js',
          '<%= config.static %>scripts/vendor/angular/angular-lodash.js',
          '<%= config.static %>scripts/vendor/angular/angular-maps.js',
          '<%= config.static %>scripts/vendor/angular/angular-local-storage.js',
          '<%= config.static %>scripts/vendor/angular/angular-select2.js',
          '<%= config.static %>scripts/vendor/angular/angular-mask.js',
          '<%= config.static %>scripts/vendor/angular/angular-dialog.js',
          '<%= config.static %>scripts/vendor/angular/angular-popover.js',
          '<%= config.static %>scripts/vendor/angular/angular-equals.js',
          '<%= config.static %>scripts/vendor/angular/angular-slick.js',
          '<%= config.static %>scripts/vendor/angular/angular-shims-placeholder.js',
          '<%= config.static %>scripts/vendor/cookie/cookie.js',
          '<%= config.static %>scripts/vendor/jquery-validation/jquery-validation.js',
          '<%= config.static %>scripts/vendor/jquery-placeholder/jquery-placeholder.js',
        ],
        dest: '<%= config.static %>scripts/lib.js'
      },
      services: {
        src: ['<%= config.static %>scripts/services/**/*.js'],
        dest: '<%= config.static %>scripts/services.js'
      },
      controllers: {
        src: ['<%= config.static %>scripts/controllers/**/*.js'],
        dest: '<%= config.static %>scripts/controllers.js'
      }
    },

    uglify: {
      app: {
        files: {'<%= config.static %>scripts/app.min.js': ['<%= config.static %>scripts/app.js']}
      },
      vendor: {
        files: {'<%= config.static %>scripts/lib.min.js': ['<%= config.static %>scripts/lib.js']}
      },
      services: {
        files: {'<%= config.static %>scripts/services.min.js': ['<%= config.static %>scripts/services.js']}
      },
      controllers: {
        files: {'<%= config.static %>scripts/controllers.min.js': ['<%= config.static %>scripts/controllers.js']}
      }
    },

    compass: {
      options: {
        sassDir: '<%= config.static %>styles/sass',
        cssDir: '<%= config.static %>styles',
        generatedImagesDir: '<%= config.static %>images',
        imagesDir: '<%= config.static %>images',
        javascriptsDir: '<%= config.static %>scripts',
        fontsDir: '<%= config.static %>fonts',
        //importPath: '<%= config.src %>/bower_components',
        httpImagesPath: '<%= config.static %>images',
        httpGeneratedImagesPath: '<%= config.static %>images',
        httpFontsPath: '<%= config.static %>fonts',
        relativeAssets: true,
        outputStyle: 'compress'
      },
      dist: {
        options:{
          httpImagesPath: '../images'
        }
      },
      server: {
        options: {
          sourcemap: false
        }
      },
      live: {
        options: {
          watch: true
        }
      }
    },

    watch: {
      options: { livereload: true },
      javascript: {
        files: ['<%= config.static %>scripts/**/*.js', '!<%= config.static %>scripts/app.js', '!<%= config.static %>scripts/controllers.min.js', '!<%= config.static %>scripts/services.min.js', '!<%= config.static %>scripts/controllers.js', '!<%= config.static %>scripts/services.js', '!<%= config.static %>scripts/app.min.js', '!<%= config.static %>scripts/lib.js', '!<%= config.static %>scripts/lib.min.js'],
        tasks: ['concat:app', 'concat:services', 'concat:controllers', 'uglify:app', 'uglify:services', 'uglify:controllers']
      },
      compass: {
        files: ['<%= config.static %>styles/sass/**/*.{scss,sass}'],
        tasks: ['compass:server'],
        options:{
          spawn: true
        }
      },
      livereload: {
        options: {
          livereload: '<%= connect.options.livereload %>'
        },
        files: [
          '**/*.html',
          '<%= config.static %>styles/{,*/}*.css',
          '<%= config.static %>scripts/{,*/}*.js',
          '<%= config.static %>images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
        ]
      }
    },

    connect: {
      options: {
        livereload: {
          options: {
            open: true,
            base: [
              '<%= config.static %>',
              '<%= config.static %>',
              '.',
            ]
          }
        }
      }
    }
  });

  // Load plugins here.
  grunt.loadNpmTasks("grunt-bowercopy");
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Register tasks here.

  grunt.registerTask('server', [
    'compass:server',
    'connect:livereload',
    'watch'
  ]);

  grunt.registerTask('dist', [
    'uglify'
  ]);

  grunt.registerTask('default', ['watch']);

};

const mix = require('laravel-mix');
const WebpackRTLPlugin = require('webpack-rtl-plugin');
/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */
mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css')
    .styles([
      'public/css/backend/bootstrap.min.css',
      'public/css/backend/select2.min.css',
      'public/css/backend/jquery.dataTables.min.css',
      'public/css/backend/dataTables.bootstrap4.min.css',
      'public/css/backend/select.dataTables.min.css',
      'public/css/backend/buttons.dataTables.min.css',
      'public/css/backend/bootstrap-datetimepicker.min.css',
      'public/css/backend/dropzone.min.css',
      'public/css/backend/toastr.css',
      'public/css/backend/adminltev3.css',
      // 'public/css/backend/videojs-seek-buttons.css',
      'public/css/backend/custom.css',
    ],'public/css/backend/backend-custom.css')
    .scripts([
      'public/js/backend/jquery-3.2.1.slim.min.js',
        'public/js/backend/popper.min.js',
        'public/js/backend/jquery.min.js',
        'public/js/backend/jquery3.3.1.min.js',
        'public/js/backend/bootstrap.min.js',
        'public/js/backend/select2.full.min.js',
        'public/js/backend/moment.min.js',
        'public/js/backend/jquery.dataTables.min.js',
        'public/js/backend/dataTables.bootstrap4.min.js',
        'public/js/backend/dataTables.buttons.min.js',
        'public/js/backend/dataTables.select.min.js',
        'public/js/backend/buttons.flash.min.js',
        'public/js/backend/buttons.html5.min.js',
        'public/js/backend/buttons.print.min.js',
        'public/js/backend/buttons.colVis.min.js',
        'public/js/backend/pdfmake.min.js',
        'public/js/backend/vfs_fonts.js',
        'public/js/backend/jszip.min.js',
        'public/js/backend/ckeditor.js',
        'public/js/backend/bootstrap-datetimepicker.min.js',
        'public/js/backend/dropzone.min.js',
        'public/js/backend/toastr.min.js',
        'public/js/backend/sweetalert2@9.js',
        'public/js/backend/jscolor.js',
        'public/js/main.js',
        'public/js/backend/admin.js',
        'public/js/backend/query.validate.min.js',
        'public/js/backend/backend.js'
    ],'public/js/backend/backend-custom.js');

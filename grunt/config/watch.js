module.exports = {
    js:         {
        files:   ['<%= config.app %>/scripts/**/*.js'],
        tasks:   [],
        options: {
            livereload: '<%= connect.options.livereload %>'
        }
    },
    compass:    {
        files: ['<%= config.app %>/styles/**/*.scss'],
        tasks: ['compass:server']
    },
    templates:  {
        files: ['<%= config.app %>/views/**/*.html'],
        tasks: ['ngtemplates'],
        options: {
            livereload: '<%= connect.options.livereload %>'
        }
    },
    html: {
        files: ['<%= config.app %>/index.html', '<%= config.app %>/config.json'],
        tasks: ['template:server'],
        options: {
            livereload: '<%= connect.options.livereload %>'
        }
    },
    livereload: {
        options: {
            livereload: '<%= connect.options.livereload %>'
        },
        files:   [
            '.tmp/styles/{,*/}*.css',
            '.tmp/js/{,*/}*.js',
            '<%= config.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}',
            '<%= config.app %>/config.json'
        ]
    }
};

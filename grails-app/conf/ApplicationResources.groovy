modules = {

    bootstrap {
        dependsOn 'jquery'
        resource url: [dir: 'bootstrap3/js', file: 'bootstrap.js', plugin:'collectory-plugin'], disposition: 'head', exclude: '*'
        resource url: [dir: 'bootstrap3/css', file: 'bootstrap.min.css', plugin:'collectory-plugin'], attrs: [media: 'screen, projection, print']
    }
    generic {
        dependsOn 'bootstrap, collectory' //
        resource url: [dir:'js', file:'application.js']
        resource url: [dir:'css', file:'generic.css']
    }
}
modules = {

    bootstrap {
        resource url:[dir:'js', file:'bootstrap.js', plugin: 'collectory-plugin', disposition: 'head']
        resource url:[dir:'css', file:'bootstrap.css', plugin: 'collectory-plugin'], attrs:[media:'screen, projection, print']
        resource url:[dir:'css', file:'bootstrap-responsive.css', plugin: 'collectory-plugin'], attrs:[media:'screen', id:'responsiveCss']
    }
    generic {
        dependsOn 'bootstrap, collectory' //
        resource url: [dir:'js', file:'application.js']
        resource url: [dir:'css', file:'generic.css']
    }
}
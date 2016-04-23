modules = {
    alf {
        dependsOn 'bootstrap3, collectory' //
        resource url: [dir:'js', file:'application.js']
        resource url: [dir:'css', file:'generic.css']
        resource url: [dir:'images', file:'header_gbif_site.png'] 
        resource url: [dir:'images', file:'rss.png'] 
        resource url: [dir:'images', file:'facebook.png'] 
        resource url: [dir:'images', file:'twitter.png'] 
        resource url: [dir:'css/images', file:'arrow_state_grey_right.png']
        resource url: [dir:'images', file:'ala-white.png']
        resource url: [dir:'images', file:'crowdin-white.png']
        resource url: [dir:'images', file:'gbif-fr.png']
        resource url: [dir:'images', file:'logo-gbif.jpg']
        resource url: [dir:'images/skin', file:'ExpandArrow.png']
        resource url: [dir:'images/ala', file:'fauna_button_bgwd.png']
        resource url: [dir:'images/ala', file:'insects_button_bgwd.png']
        resource url: [dir:'images/ala', file:'microbes_button_bgwd.png']
        resource url: [dir:'images/ala', file:'plants_button_bgwd.png']
        resource url: [dir:'images/ala', file:'all_button_bgwd.png']
        resource url: [dir:'images/ala', file:'mycetes_button_bgwd.png']
        resource url: [dir:'images/ala', file:'paleontology_button_bgwd.png']
    }
    bootstrap {
        resource url:[dir:'js', file:'bootstrap.js', plugin: 'collectory-plugin', disposition: 'head']
        resource url:[dir:'css', file:'bootstrap.css', plugin: 'collectory-plugin'], attrs:[media:'screen, projection, print']
        resource url:[dir:'css', file:'bootstrap-responsive.css', plugin: 'collectory-plugin'], attrs:[media:'screen', id:'responsiveCss']
    }
    bootstrap3 {
        resource url: [dir: 'bootstrap3/js', file: 'bootstrap.js', disposition: 'head']
        resource url: [dir: 'bootstrap3/css', file: 'bootstrap.css', attrs: [media: 'screen, projection, print']]
        resource url: [dir: 'bootstrap3/css', file: 'bootstrap-theme.css', attrs: [media: 'screen, projection, print']]
    }
    generic {
        dependsOn 'bootstrap, collectory' //
        resource url: [dir:'js', file:'application.js']
        resource url: [dir:'css', file:'generic.css']
    }
}
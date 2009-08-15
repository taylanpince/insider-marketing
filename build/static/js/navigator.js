/*
*	Navigator
*	Pops up new content pages in a centered box
*	
*	Requires jQuery library (http://www.jquery.com)
*	
*	Taylan Pince (taylanpince at gmail dot com) - August 14, 2009
*/

$.namespace("core.Navigator");

core.Navigator = $.Class.extend({
    
    selector : "",
    url : "",
    
    page_template : '<div id="Page"></div>',

    display_page : function(response, status, request) {
        $(this.selector).find("#Page").fadeIn();
    },
    
    load_page : function() {
        $(this.selector).find("#Page").load(this.url + " #Body", {}, this.display_page.bind(this));
    },
    
    launch_page : function(url) {
        this.url = url + "?" + (Math.random() * 1000);

        $(this.selector).find("#Page").fadeOut("fast", this.load_page.bind(this));
    },

    init : function(selector) {
        this.selector = selector;

        $(this.selector).append(this.page_template);
    }

});

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
    close_template : '<a href="javascript:void(0);" onclick="nav.close_page();" class="close">X</a>',
    standby_template : '<span class="standby">Please wait…</span>',

    display_page : function(response, status, request) {
        $(this.selector).find("#Page").append(this.close_template).fadeIn();
        $(this.selector).find(".standby").remove();
    },
    
    load_page : function() {
        $(this.selector).find("#Page").load(this.url + " #Body", {}, this.display_page.bind(this));
    },
    
    launch_page : function(url) {
        $(this.selector).find(".standby").remove();
        $(this.selector).append(this.standby_template);

        this.url = url + "?" + (Math.random() * 1000);

        $(this.selector).find("#Page").fadeOut("fast", this.load_page.bind(this));
    },
    
    close_page : function() {
        $(this.selector).find("#Page").fadeOut("fast");
    },

    init : function(selector) {
        this.selector = selector;

        $(this.selector).append(this.page_template);
    }

});

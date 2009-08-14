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
    
    page_template : '<div id="Page"></div>',

    render_template : function(template, values) {
        for (val in values) {
            var re = new RegExp("%\\(" + val + "\\)", "g");
        
            template = template.replace(re, values[val]);
        }
    
        return template;
    },
    
    launch_page : function(url) {
        $(this.selector).find("#Page").load(url);
    },

    init : function(selector) {
        this.selector = selector;

        $(this.selector).append(this.page_template);
    }

});

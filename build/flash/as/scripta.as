import as.frameMan;

// var easeIn = mx.transitions.easing.Strong.easeIn;
// var easeInReg = mx.transitions.easing.Regular.easeIn;
var easeNone = mx.transitions.easing.None.easeNone;
var easeOut = mx.transitions.easing.Strong.easeOut;
// var easeInOut = mx.transitions.easing.Strong.easeInOut;

var fMan = new frameMan([2000, 1500, 1500, 500, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 500]);

//************************************
// PRELOAD.
//************************************
var preloadInt = setInterval(checkPreLoad, 100);

function checkPreLoad() {
	if (_root.getBytesTotal() > 4 && _root.getBytesLoaded() == _root.getBytesTotal()) {
		clearInterval(preloadInt);
		gotoAndStop("start");
		fMan.start();
	}
}

function launchPage() {
    getURL("javascript:nav.launch_page('" + this.href + "')");
}

function launchLink() {
    getURL("javascript:nav.launch_link('" + this.href + "')");
}

fMan.frame[0] = function() { // Intro 1
    tween_fn(intro_1, "_alpha", 100, 1.5, easeNone);
    tween_fn(intro_15, "_alpha", 100, 1.5, easeNone);
}

fMan.frame[1] = function() { // Intro 2
    tween_fn(intro_2, "_alpha", 100, 0.5, easeNone);
}

fMan.frame[2] = function() { // Intro Fade Out
    tween_fn(intro_1, "_alpha", 0, 0.5, easeNone);
}

fMan.frame[3] = function() { // Copy, Logo
    tween_fn(intro_2, "_alpha", 0, 0.5, easeNone);
    tween_fn(intro_15, "_alpha", 0, 0.5, easeNone);
    tween_fn(copy, "_alpha", 100, 0.5, easeNone);
    tween_fn(logo, "_alpha", 100, 0.5, easeNone);
}

fMan.frame[4] = function() { // About
    tween_fn(about, "_alpha", 100, 0.5, easeNone);
    
    about.href = "/about/";
    about.onRelease = launchPage;
}

fMan.frame[5] = function() { // Box 1
    tween_fn(box_1, "_alpha", 100, 0.5, easeNone);
}

fMan.frame[6] = function() { // Promise
    tween_fn(promise, "_alpha", 100, 0.5, easeNone);
    
    promise.href = "/promise/";
    promise.onRelease = launchPage;
}

fMan.frame[7] = function() { // Box 2
    tween_fn(what_we_do, "_alpha", 100, 0.5, easeNone);

	what_we_do.href = "/what-we-do/";
	what_we_do.onRelease = launchPage;
}

fMan.frame[8] = function() { // Marketing
    tween_fn(services, "_alpha", 100, 0.5, easeNone);
    
    services.href = "/services/";
    services.onRelease = launchPage;
}

fMan.frame[9] = function() { // Box 3
    tween_fn(box_3, "_alpha", 100, 0.5, easeNone);
}

fMan.frame[10] = function() { // Portfolio
    tween_fn(portfolio, "_alpha", 100, 0.5, easeNone);
    
    portfolio.href = "/portfolio/";
    portfolio.onRelease = launchPage;
}

fMan.frame[11] = function() { // Box 4
    tween_fn(blog, "_alpha", 100, 0.5, easeNone);

	blog.href = "http://blog.insidermarketinggroup.ca";
	blog.onRelease = launchLink;
}

fMan.frame[12] = function() { // Team
    tween_fn(team, "_alpha", 100, 0.5, easeNone);
    
    team.href = "/team/";
    team.onRelease = launchPage;
}

fMan.frame[13] = function() { // Box 5
    tween_fn(projects, "_alpha", 100, 0.5, easeNone);

	projects.href = "/current-projects/";
	projects.onRelease = launchPage;
}

fMan.frame[14] = function() { // Testimonials
    tween_fn(testimonials, "_alpha", 100, 0.5, easeNone);
    
    testimonials.href = "/testimonials/";
    testimonials.onRelease = launchPage;
}

fMan.frame[15] = function() { // Box 6
    tween_fn(giving_back, "_alpha", 100, 0.5, easeNone);

	giving_back.href = "/giving-back/";
	giving_back.onRelease = launchPage;
}

fMan.frame[16] = function() { // Contact
    tween_fn(contact, "_alpha", 100, 0.5, easeNone);
    
    contact.href = "/contact/";
    contact.onRelease = launchPage;
}

fMan.frame[17] = function() { // Box 1
    stop();
}

function tween_fn(clip,props,vals,time,ease){
	clip.f = 0;
	clip.tf = time * 30; // 30 frames per second.
	clip.props = (typeof props == "string") ? [props] : props;
	clip.vals = (typeof props == "string") ? [vals] : vals;
	clip.ovals = [];
	clip.cvals = [];
	
	for (var i = 0; i < clip.props.length; i++) {
		clip.ovals[i] = clip[clip.props[i]];
		clip.cvals[i] = clip.vals[i] - clip.ovals[i];
	}
	
	clip.ease = (ease != undefined) ? ease : easeOut;
	
	clip.onEnterFrame = function() {
		for (var i = 0; i < this.props.length; i++) {
			this[this.props[i]] = this.ease(this.f,this.ovals[i], this.cvals[i], this.tf);
			// t: current time, b: beginning value, c: change in value, d: duration
			// t and d can be in frames or seconds/milliseconds
			// Math.easeInQuad = function (t, b, c, d)
		}

		if (this.f >= this.tf) delete this.onEnterFrame;

		this.f++;
		
		if (this.j != undefined){
			this._y += Math.cos(this.j);
			this.j += 0.1;
		}
	}
}

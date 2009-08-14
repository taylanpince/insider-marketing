/* *********************************************
as.frameMan
************************************************

Description:	frame-based animation manager

Creation date:	Tue Oct 02 2007
Created by:	Kirby Szeto (K0 Studios)
Modified:	-
Notes:	-

***********************************************/

class as.frameMan {
	// class definition
	
	// variables
	var frameInt:Number;
	var frameTimes:Array;
	
	var frame:Array; // array of functions.
	var currentframe:Number;

	public var init:Function;	
	
	public function frameMan (timeArr:Array) {
		_root.stop(); 
		
		frameTimes = timeArr;
		frame = [];
// 		init();
	}
	
	public function preloadUpdate(){
		
	}
	
	public function start(){
		currentframe = 0;
		frame[0].apply();
		// begin.
		frameInt = setInterval(this,"goFrame",frameTimes[0],1);
	}
	
	public function stop(){
		trace ("stop " + this + frameInt);
		clearInterval(frameInt);
	}
	
	public function resume(num){
		currentframe = (num!=undefined) ? num : currentframe+1;
		frame[currentframe].apply();
		// begin.
		frameInt = setInterval(this,"goFrame",frameTimes[currentframe],currentframe+1);
	}
	
	private function goFrame(num){
		clearInterval(frameInt);
		trace ("go frame " + num);
		currentframe = num;
		
		if (num<frameTimes.length){
			frameInt = setInterval(this, "goFrame", frameTimes[num], num+1);
			trace ("set interval" + frameInt);
		}
		
		frame[num].apply();
	}
}
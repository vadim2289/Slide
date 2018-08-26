/// @description Insert description here
// You can write your code in this editor
//global.log+="!!!!"
//show_debug_message(global.log)
/*if(global.speed_<=1){
	global.speed_+=0.05
	//global.speed_=clamp(abs(global.speed_),0,0.4);	
	//global.speed_=0
}*/

if(global.pause_game){
	global.pause=false
	global.pause_game=false
	global.speed_=global.save_speed_
}else{
	global.pause=true
	global.pause_game=true
	global.save_speed_=global.speed_
	global.speed_=0
}
/// @description global step
// You can write your code in this editor
//show_debug_message("wall1  "+string(wall1.enable))
//show_debug_message("wall2222  "+string(wall2.enable))
//global.speed_=lerp(global.speed_,0.0,0.0025)

if(global.shift!=0){
	if(global.shift_count!=0){	
		global.shift_count-=global.speed_*sign(global.speed_)
		global.speed_+=sign(global.speed_)*0.1
	
		if(global.shift_count<=global.shift/2){
			global.speed_-=sign(global.speed_)*0.1
		}
		if(global.shift_count-global.speed_*sign(global.speed_)<0){		
				global.speed_=sign(global.speed_)*global.shift_count	
		}
	}else{
		obj_pl.restart_mode=false
		global.shift=0
		alarm[0]=50		
	}
}
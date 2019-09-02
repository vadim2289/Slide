/// @description Insert description here
// You can write your code in this editor
global.pause=false
global.speed_=global.max_speed_


		obj_pl.result_radius=1400
		obj_pl.AI="on_air"
		image_speed=1
		//show_debug_message("STOLKNOVENIE "+" "+string(result_))
		
		
		
//obj_pl.gravity_=0
obj_pl.alpha=85
//obj_pl.alarm[0]=20
//obj_pl.result_radius+=obj_pl.vertical_speed;
//show_debug_message("solid_fall"+string(result_radius))
obj_pl.x=global.x_+lengthdir_x(obj_pl.result_radius,obj_pl.alpha); 
obj_pl.y=global.y_+lengthdir_y(obj_pl.result_radius,obj_pl.alpha);
//show_debug_message("yyyyyyyy "+" "+string(obj_pl.y))
obj_pl.alarm[0]=20

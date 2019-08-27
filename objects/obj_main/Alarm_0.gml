/// @description Insert description here
// You can write your code in this editor
global.pause=false
global.speed_=global.max_speed_

for (var i = 0; i  < 400 ; i += 100)
{
	var result_=770-i
	var empty_place=instance_place(room_width/2,result_,obj_eath)
	if(empty_place==noone){
		obj_pl.result_radius=result_-45
		break;
	}
}				
obj_pl.gravity_=0
obj_pl.alpha=90
//obj_pl.alarm[0]=20
obj_pl.result_radius+=obj_pl.vertical_speed;
//show_debug_message("solid_fall"+string(result_radius))
obj_pl.x=global.x_+lengthdir_x(obj_pl.result_radius,obj_pl.alpha); 
obj_pl.y=global.y_+lengthdir_y(obj_pl.result_radius,obj_pl.alpha);
obj_pl.alarm[0]=20
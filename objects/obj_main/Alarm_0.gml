/// @description Insert description here
// You can write your code in this editor
global.pause=false
global.speed_=global.max_speed_

for (var i = 400; i  > -1 ; i -= 100)
{
	var result_=850-i
	var empty_place=instance_place(room_width/2+5,result_+5,obj_eath)
	if(empty_place!=noone){
		obj_pl.result_radius=725+i
		show_debug_message("STOLKNOVENIE "+" "+string(result_))
		
		
	}
}				
//obj_pl.gravity_=0
obj_pl.alpha=80
//obj_pl.alarm[0]=20
//obj_pl.result_radius+=obj_pl.vertical_speed;
//show_debug_message("solid_fall"+string(result_radius))
obj_pl.x=global.x_+lengthdir_x(obj_pl.result_radius,obj_pl.alpha); 
obj_pl.y=global.y_+lengthdir_y(obj_pl.result_radius,obj_pl.alpha);
show_debug_message("yyyyyyyy "+" "+string(obj_pl.y))
obj_pl.alarm[0]=20

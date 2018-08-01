/// @description Insert description here
// You can write your code in this editor


if(global.play_){	
	alpha+=global.speed_	
	image_angle=alpha-90
	start_alpha=image_angle+90
	
}else{
	if(global.mouse_l=="eath"){			
		alpha=start_alpha+global.rotation_mouse
		image_angle=alpha-90
	}else if(global.mouse_l=="solid"){	
		if(global.object_mouse==id){
			alpha=start_alpha+global.rotation_mouse
			image_angle=alpha-90
		}
	}	
}
x=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
y=global.y_+lengthdir_y(global.radius_+height_radius,alpha);
//show_debug_message(image_index)
if(alarm_true&&image_index > image_number-1){
		image_speed=0;
		sprite_index=spr_pie_up_stand
		alarm_true=false
		alarm[0]=time_pause	
		//show_debug_message(alarm_true)
	}	
	scr_360()
/// @description Insert description here
// You can write your code in this editor


if(!global.first_after_shift){
	alpha+=global.speed_	
}
	image_angle=alpha-90
	start_alpha=image_angle+90
	

if(alarm_true&&image_index > image_number-1){
		image_speed=0;
		sprite_index=spr_pie_up_stand
		alarm_true=false
		alarm[0]=time_pause	
		//show_debug_message(alarm_true)
}	
	if(alpha>=360){
		alpha-=360
	}else if(alpha<-90&&global.shift>0){
		alpha+=360
	}

if(alpha>=270){
	instance_destroy();
}

x=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
y=global.y_+lengthdir_y(global.radius_+height_radius,alpha);
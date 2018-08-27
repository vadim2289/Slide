/// @description Insert description here
// You can write your code in this editor
if(!global.first_after_shift){
	alpha+=global.speed_	
}
image_angle=alpha-90
start_alpha=image_angle+90


	if(alpha>=360){
		alpha-=360
	}else if(alpha<-90){
		alpha+=360
	}
if(!global.pause){
	if(alpha>=270){
		show_debug_message("destroy "+string(alpha))
		instance_destroy();
	}
}

x=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
y=global.y_+lengthdir_y(global.radius_+height_radius,alpha);
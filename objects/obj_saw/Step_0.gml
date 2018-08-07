/// @description Insert description here
// You can write your code in this editor


	
	alpha+=global.speed_	
	alpha_little_radius+=little_radius_speed*global.speed_
	image_angle=alpha-90
	start_alpha=image_angle+90
	//show_debug_message(alpha_little_radius)
	x_big_radius=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
	y_big_radius=global.y_+lengthdir_y(global.radius_+height_radius,alpha);

	x=x_big_radius+lengthdir_x(little_radius,alpha_little_radius);
	y=y_big_radius+lengthdir_y(little_radius,alpha_little_radius);

if(alpha>=600){
	instance_destroy();
}
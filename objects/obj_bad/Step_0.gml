/// @description Insert description here
// You can write your code in this editor



	alpha+=global.speed_	
	image_angle=alpha-90
	start_alpha=image_angle+90

x=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
y=global.y_+lengthdir_y(global.radius_+height_radius,alpha);
if(alpha>=600){
	instance_destroy();
}
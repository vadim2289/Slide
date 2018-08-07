/// @description Insert description here
// You can write your code in this editor



	alpha+=global.speed_	
	image_angle=alpha-90
	start_alpha=image_angle+90
	alpha_little_radius=alpha+12*sin(alpha/7) // horizon
	//alpha_little_radius=alpha// horizon
	//rad_=50*sin(alpha/4)
	
	x=global.x_+lengthdir_x(global.radius_+height_radius,alpha_little_radius);
	y=global.y_+lengthdir_y(global.radius_+height_radius,alpha_little_radius);



if(alpha>=600){
	instance_destroy();
}
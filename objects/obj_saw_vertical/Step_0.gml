/// @description Insert description here
// You can write your code in this editor


	alpha+=global.speed_	
	image_angle=alpha-90
	start_alpha=image_angle+90
	alpha_little_radius=alpha// horizon
	rad_=65*sin(alpha/6)// 65 высота 6 скорость
	
	x=global.x_+lengthdir_x(global.radius_+height_radius+rad_,alpha_little_radius);
	y=global.y_+lengthdir_y(global.radius_+height_radius+rad_,alpha_little_radius);


scr_360()



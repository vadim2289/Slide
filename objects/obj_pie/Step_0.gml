/// @description Insert description here
// You can write your code in this editor

if(!global.first_after_shift){
	alpha+=global.speed_;
}
//alpha=degtorad(0);
//alpha_grad=radtodeg(alpha)
if(alpha>=360||alpha<=-360){
	alpha-=360*sign(global.speed_);	
}

if(alpha>=270){
	instance_destroy();
}
image_angle=alpha-90;

x=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
y=global.y_+lengthdir_y(global.radius_+height_radius,alpha);
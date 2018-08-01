x=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
y=global.y_+lengthdir_y(global.radius_+height_radius,alpha);

alpha+=global.speed_;
//alpha=degtorad(0);
//alpha_grad=radtodeg(alpha)

if(alpha>=600){
	instance_destroy();
}
/// @description Insert description here
// You can write your code in this editor
//scr_move_round()
if(!global.first_after_shift){
	alpha+=global.speed_+speed_	
}
if(global.first_after_shift){
	object_set_visible(self,true)
	sprite_index=spr_solid_fall
	image_index=0
	image_speed=0
	alarm[0]=-1
	
}
	image_angle=alpha-90
	start_alpha=image_angle+90
if(visible){
	if(fall_){
		alarm[0]=time_
		fall_=false
		sprite_index=spr_solid_fall_true
		image_index=0
		image_speed=0
	}
	
	if(alarm[0]<time_*0.8&&alarm[0]>time_*0.6){
		image_index=1
		image_speed=0
	}
	if(alarm[0]<time_*0.6&&alarm[0]>time_*0.4){
		image_index=2
		image_speed=0
	}
	if(alarm[0]<time_*0.4&&alarm[0]>time_*0.2){
		image_index=3
		image_speed=0
	}
	if(alarm[0]<time_*0.2&&alarm[0]>0){
		image_index=4
		image_speed=0
	}
}
	if(alpha>=360){
		alpha-=360
	}else if(alpha<-90){
		alpha+=360
	}

if(alpha>=270){
	instance_destroy();
}
x=global.x_+lengthdir_x(global.radius_+height_radius,alpha); 
y=global.y_+lengthdir_y(global.radius_+height_radius,alpha);
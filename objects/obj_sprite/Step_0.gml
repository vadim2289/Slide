/// @description Insert description here
// You can write your code in this editor
if(!global.first_after_shift){
	rotation_start+=global.speed_;
}
	if(rotation_start>=360){
		rotation_start-=360
		sector_updating=false;
		//show_debug_message("AAAAAAAAAAAAAAAAAAA")
	}else if(rotation_start<0){
		rotation_start+=360	
		sector_updating=false;
	}
if(!global.pause){
	if(rotation_start>350&&rotation_start<359&&!sector_updating)
	{	
		//sector_updating=true;
		//sector_id=scr_sector_update();	
	
	}
}
image_angle=rotation_start;
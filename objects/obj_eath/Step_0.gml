/// @description Insert description here
// You can write your code in this editor


rotation_start+=global.speed_;

if(rotation_start>=360||rotation_start<=0){
	rotation_start-=360*sign(global.speed_);	
	sector_updating=false;
	//show_debug_message("AAAAAAAAAAAAAAAAAAA")
}
if(rotation_start>350&&rotation_start<359&&!sector_updating)
{
	if(global.shift==0){
		sector_updating=true;
		sector_id=scr_sector_update();	
	}
}
image_angle=rotation_start;


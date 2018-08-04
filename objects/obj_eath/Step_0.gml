/// @description Insert description here
// You can write your code in this editor

rotation_start+=global.speed_;

if(rotation_start>=360||rotation_start<=-360){
	rotation_start-=360*sign(global.speed_);	
	sector_updating=false;
	show_debug_message("AAAAAAAAAAAAAAAAAAA")
}
if(rotation_start>350&&rotation_start<359&&!sector_updating)
{
	sector_updating=true;
	scr_sector_update();

	
}
image_angle=rotation_start;


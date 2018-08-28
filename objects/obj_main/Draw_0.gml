/// @description Insert description here
// You can write your code in this edi
draw_set_font(font_testing)
draw_set_color(c_white)
draw_text(100,100,fps)
//draw_text(100,200,sector_r.rotation_start)
//draw_text(room_width/2,100,score)

draw_text(room_width/2-50,200,""+string(global.testing))

draw_text(room_width/2-10,250,"sector_r rotation: "+string(sector_r.rotation_start))
if(instance_exists(global.test_instance_prev)){
	draw_text(room_width/2-10,300,"sector_previous instance_alpha: "+string(global.test_instance_prev.alpha))
	
}



if(instance_exists(global.test_instance_post)){
	draw_text(room_width/2-10,350,"sector_post instance_alpha: "+string(global.test_instance_post.alpha))
}


draw_text(room_width/2-10,450,"solid_alpha_in_sector: "+string(global.testing_solid))



draw_set_font(font_sector)
draw_set_color(c_black)
draw_text(global.x_+lengthdir_x(global.radius_-150,sector_r.rotation_start-45)
	,global.y_+lengthdir_y(global.radius_-150,sector_r.rotation_start-45)
	,sector_r.sector_id)
draw_text(global.x_+lengthdir_x(global.radius_-150,sector_u.rotation_start-45)
	,global.y_+lengthdir_y(global.radius_-150,sector_u.rotation_start-45)
	,sector_u.sector_id)
draw_text(global.x_+lengthdir_x(global.radius_-150,sector_l.rotation_start-45)
	,global.y_+lengthdir_y(global.radius_-150,sector_l.rotation_start-45)
	,sector_l.sector_id)
draw_text(global.x_+lengthdir_x(global.radius_-150,sector_d.rotation_start-45)
	,global.y_+lengthdir_y(global.radius_-150,sector_d.rotation_start-45)
	,sector_d.sector_id)
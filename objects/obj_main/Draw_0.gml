/// @description Insert description here
// You can write your code in this edi
draw_set_font(font_testing)
draw_set_color(c_white)
draw_text(100,100,fps)
//draw_text(100,200,sector_r.rotation_start)
draw_text(room_width/2,100,score)

draw_text(room_width/2,300,global.testing)

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
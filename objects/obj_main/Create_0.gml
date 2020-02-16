/// @description Create_game
// You can write your code in this editor
global.radius_=825;
global.x_=room_width/2;
global.y_=room_height+415;
//global.y_=room_height-1200;
//global.y_=room_height-2.5*415;
global.speed_=0.3;
global.max_speed_=0.3;
global.save_speed_=0;
//global.sector_numb=0;
//global.max_=3;
global.DB=ds_grid_create(100,43)
global.string_end="0";
//global.play_=true
global.testing=""
//global.log=""
//global.number_=0
global.pause=false
global.pause_game=false
//global.last_sector=1
global.shift=0
global.shift_count=0
global.first_after_shift=false
global.score_=0

global.test_instance_prev=noone
//global.test_instance_post=noone
//global.testing_solid=0
/*
var w = window_get_width() / 3; 
var h = window_get_height() / 3;

display_set_gui_size(w, h);

var cam = view_get_camera(0);

view_set_wport(0, w); view_set_hport(0, h);

camera_set_view_size(cam, view_wport[0], view_hport[0]);

//camera_set_view_target(view_camera[0], player_obj); 
//camera_set_view_border(view_camera[0], w/2, h/2);

surface_resize(application_surface, w, h);
//global.string_write=""
*/

//var DB=ds_grid_create(10,10)
instance_create_layer(global.x_,global.y_-global.radius_-150,"Instances",obj_pl);
//instance_create_layer(global.x_,global.y_-global.radius_,"Instances",obj_pie);
//wall1=instance_create_layer(global.x_,global.y_-global.radius_,"Instances",obj_wall);
//wall2=instance_create_layer(global.x_,global.y_-global.radius_+100,"Instances",obj_wall);
//wall2.hight_radius=-300
//instance_create_layer(global.x_,global.y_-global.radius_,"Instances",obj_solid);
//wall22=instance_create_layer(global.x_,global.y_-global.radius_,"Instances",obj_solid);
//wall22.height_radius=155
//wall22.alpha=270

//new_meteor=instance_create_layer(-50,0,"Instances",obj_meteor)
//new_ufo=instance_create_layer(-50,-20,"Instances",obj_ufo)

// помещаем секторы коллизий
sector_r=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // правая точка
sector_r.rotation_start=90;
sector_r.sprite_index=spr_circle_F;
sector_r.sector_id=0

sector_u=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // верхнаяя точка
sector_u.rotation_start=180;
sector_u.sprite_index=spr_circle_F;
sector_u.sector_id=0

sector_l=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // левая точка
sector_l.rotation_start=270;
sector_l.sprite_index=spr_circle_F;
sector_l.sector_id=0

sector_d=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // нижняя точка
sector_d.rotation_start=0;
sector_d.sprite_index=spr_circle_F;
sector_d.sector_id=0


//Test_sprite
/*
sector_r_sprite=instance_create_layer(global.x_,global.y_,"Instances",obj_sprite); // правая точка
//sector_r_sprite.sprite_index=sprite551
sector_r_sprite.rotation_start=90;
//sector_r_sprite.image_speed=1

//sector_r_sprite.sprite_index=spr_circle_F;/*
/*
sector_r_sprite.sprite_index=2;
sector_r_sprite.sprite_index=3;
sector_r_sprite.sprite_index=4;
sector_r_sprite.sprite_index=5;
sector_r_sprite.sprite_index=6;
sector_r_sprite.sprite_index=7;
*/
//sector_r_sprite.sector_id=0
/*

sector_u_sprite=instance_create_layer(global.x_,global.y_,"Instances",obj_sprite); // верхнаяя точка
sector_u_sprite.rotation_start=180;
//sector_u_sprite.sprite_index=spr_circle_F;
//sector_u_sprite.sector_id=0

sector_l_sprite=instance_create_layer(global.x_,global.y_,"Instances",obj_sprite); // левая точка
sector_l_sprite.rotation_start=270;
//sector_l_sprite.sprite_index=spr_circle_F;
//sector_l_sprite.sector_id=0

sector_d_sprite=instance_create_layer(global.x_,global.y_,"Instances",obj_sprite); // нижняя точка
sector_d_sprite.rotation_start=0;
//sector_d_sprite.sprite_index=spr_circle_F;
//sector_d_sprite.sector_id=0
*/
/*
var steps=90
for (var i=0;i<20;i++){
	view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
	view_.alpha=steps
	steps-=9
	
}


*/

// помещаем визуал дна
sectors=instance_create_layer(global.x_,global.y_,"Instances",obj_eath_view); // правая точка
sectors.rotation_start=90;
sectors.sprite_index=spr_earth_view;
sectors=instance_create_layer(global.x_,global.y_,"Instances",obj_eath_view); // верхняя точка
sectors.rotation_start=180;
sectors.sprite_index=spr_earth_view;
sectors=instance_create_layer(global.x_,global.y_,"Instances",obj_eath_view); // левая точка
sectors.rotation_start=270;
sectors.sprite_index=spr_earth_view;
sectors=instance_create_layer(global.x_,global.y_,"Instances",obj_eath_view); // нижняя точка
sectors.rotation_start=0;
sectors.sprite_index=spr_earth_view;




if (file_exists(working_directory +"levelDB.txt")){
	var file=file_text_open_read(working_directory +"levelDB.txt");
	var string_end=file_text_read_string(file);
	ds_grid_read(global.DB,string_end)
	file_text_close(file);
}
randomize()
//scr_db_create();



// подгрузка карт спрайтов нужно пересматривать каждый раз когда добавляешь новый спрайт
draw_texture_flush();
/*
draw_sprite(spr_circle_C, 0, 0, 0);

draw_sprite(spr_circle_E, 0, 0, 0);

draw_sprite(spr_solid3, 0, 0, 0);

draw_sprite(spr_solid2, 0, 0, 0);

draw_sprite(spr_pie, 0, 0, 0);
*/
//new_solid=instance_create_layer(0,0,"Instances", obj_solid);

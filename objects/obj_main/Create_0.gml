/// @description Create_game
// You can write your code in this editor
global.radius_=825;
global.x_=room_width/2;
global.y_=room_height+415;
global.speed_=0.3;
global.sector_numb=0;
global.max_=3;
global.DB=ds_grid_create(100,43)
global.string_end="-1";
global.play_=true
global.testing=""
global.log=""
global.number_=0

//global.string_write=""


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

new_meteor=instance_create_layer(0,0,"Instances",obj_meteor)
new_ufo=instance_create_layer(-10,-20,"Instances",obj_ufo)


sector_r=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // правая точка
sector_r.rotation_start=90;

sector_r.sprite_index=0;/*
sector_r.sprite_index=2;
sector_r.sprite_index=3;
sector_r.sprite_index=4;
sector_r.sprite_index=5;
sector_r.sprite_index=6;
sector_r.sprite_index=7;
*/



sector_u=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // верхнаяя точка
sector_u.rotation_start=180;
sector_u.sprite_index=1;

sector_l=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // левая точка
sector_l.rotation_start=270;
sector_l.sprite_index=0;

sector_d=instance_create_layer(global.x_,global.y_,"Instances",obj_eath); // нижняя точка
sector_d.rotation_start=0;
sector_d.sprite_index=1;

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

draw_sprite(spr_circle_C, 0, 0, 0);

draw_sprite(spr_circle_E, 0, 0, 0);

draw_sprite(spr_solid3, 0, 0, 0);

draw_sprite(spr_solid2, 0, 0, 0);

draw_sprite(spr_pie, 0, 0, 0);

//new_solid=instance_create_layer(0,0,"Instances", obj_solid);

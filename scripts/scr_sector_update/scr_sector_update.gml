var j=9;
var object_loc=noone
var alpha_loc=0
var height_radius_loc=0
var sprite_id_loc=""
score+=5
if(global.string_end!="-1"){ // если не первый проход
			
	var result_row=irandom_range(int64(global.string_end)*10,int64(global.string_end)*10+9) // рандомный выбор из выбранного десятка секторов базы
	/*global.number_+=1
	result_row=global.number_
	if result_row>49{
		result_row=0
		global.number_=0
	}*/
	//result_row=6
	
	global.string_end= scr_random_range(global.DB[# result_row,2])	// выбираем вид сектора из допустимых для следующего прохода
	//global.string_end=string(irandom_range(0,1))
	//global.string_end= "0" // временно
	global.testing=" string_end "+string(global.string_end)+" result_row "+string(result_row)
	sprite_index=asset_get_index(global.DB[# result_row,0]);  // загружаем спрайт сектора
	/*if(global.number_/2-round(global.number_/2)==0){
		sprite_index=spr_circle_R // загружаем спрайт сектора
	}else{
		sprite_index=spr_circle_E
	}*/
	for(var pool=3;pool<43;pool+=4){		
		if(global.DB[# result_row,pool]!=0){				
			object_loc=asset_get_index(global.DB[# result_row,pool]) // берем наименование объекта
//object_loc=global.DB[# result_row,pool] // берем наименование объекта
			alpha_loc=global.DB[# result_row,pool+1]-90+rotation_start // берем угол (то есть позицию объекта)
			height_radius_loc=global.DB[# result_row,pool+2] //берем высоту объекта
			sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])	 // берем название спрайта				
			//sprite_id_loc=global.DB[# result_row,pool+3]	 // берем название спрайта				
			new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
				global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
				object_loc);  // создаем экземпляр объекта по взятым параметрам
			new_solid.sprite_index=sprite_id_loc // назначаем ему спрайт
			new_solid.alpha=alpha_loc //  назначаем ему угол
			new_solid.height_radius=height_radius_loc // назначаем ему высоту
			new_solid.start_alpha=alpha_loc //  назначаем ему стартовый угол
			new_solid.image_angle=alpha_loc-90 //  поворачиваем его спрайт по углу
			//show_debug_message(" string_end "+string(global.string_end)+" result_row "+string(result_row)+" !! "+string(new_solid.sprite_index))
		}
		j--
	}		
			
			
}else{ // если первый проход в самом начале игры
	//global.string_end="0";
	var result_row=27 // 0 для первого прохода
	//var result_row=irandom_range(5,9)
	global.string_end= scr_random_range(global.DB[# result_row,2])	 // выбираем вид сектора из допустимых для следующего прохода
	global.testing=" string_end "+string(global.string_end)+" result_row "+string(result_row)
	sprite_index=asset_get_index(global.DB[# result_row,0]);
	for(var pool=3;pool<43;pool+=4){		
		if(global.DB[# result_row,pool]!=0){				
			object_loc=asset_get_index(global.DB[# result_row,pool])
			alpha_loc=global.DB[# result_row,pool+1]-90+rotation_start
			height_radius_loc=global.DB[# result_row,pool+2]
			sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])					
			new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
				global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
				object_loc);
			new_solid.sprite_index=sprite_id_loc
			new_solid.alpha=alpha_loc
			new_solid.height_radius=height_radius_loc
			new_solid.start_alpha=alpha_loc
			new_solid.image_angle=alpha_loc-90
			//show_debug_message(" string_end "+string(global.string_end)+" result_row "+string(result_row)+" !! "+string(new_solid.sprite_index))
		}
		j--
	}
	global.string_end="0"  // временно
}

with (obj_enemy){	
	depth=depth-10
}


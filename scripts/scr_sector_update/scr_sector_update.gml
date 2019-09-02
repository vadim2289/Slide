var j=9;
var object_loc=noone
var alpha_loc=0
var height_radius_loc=0
var sprite_id_loc=""
//score+=5


if(global.string_end!="-1"){ // если не первый проход
			
	var result_row=irandom_range(int64(global.string_end)*10,int64(global.string_end)*10+9) // рандомный выбор из выбранного десятка секторов базы
//	global.log+="X"+string(result_row)
	//global.number_+=1
	//result_row=global.number_
	//if result_row>49{
		result_row=0 // временно
//		global.number_=0
//	}
	//result_row=round(random_range(197,198))
	show_debug_message("CREATE!!!!!!!!!!! "+string(result_row))
	global.string_end= scr_random_range(global.DB[# result_row,2])	// выбираем вид сектора из допустимых для следующего прохода
	
	//global.string_end=string(irandom_range(0,1))
	global.string_end= "0" // временно
	//global.testing=" string_end "+string(global.string_end)+" result_row "+string(result_row)
	//global.testing=string(result_row)
	
	sprite_index=asset_get_index(global.DB[# result_row,0]);  // загружаем спрайт сектора
	depth=depth-10
	//	sprite_index=asset_get_index("spr_circle_small"); // временно
	
	/*if(global.number_/2-round(global.number_/2)==0){
		sprite_index=spr_circle_R // загружаем спрайт сектора
	}else{
		sprite_index=spr_circle_E
	}*/
	for(var pool=3;pool<43;pool+=4){		
		if(global.DB[# result_row,pool]!=0){				
			object_loc=asset_get_index(global.DB[# result_row,pool]) // берем наименование объекта
			
			//object_loc=obj_solid
			
			alpha_loc=global.DB[# result_row,pool+1]-90+rotation_start // берем угол (то есть позицию объекта)
			height_radius_loc=global.DB[# result_row,pool+2] //берем высоту объекта
			sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])	 // берем название спрайта		
			
			//sprite_id_loc=spr_solid3_5		
			
			new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
				global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
				object_loc);  // создаем экземпляр объекта по взятым параметрам
			new_solid.sprite_index=sprite_id_loc // назначаем ему спрайт
			new_solid.alpha=alpha_loc-360 //  назначаем ему угол
			new_solid.height_radius=height_radius_loc // назначаем ему высоту
			new_solid.start_alpha=alpha_loc-360 //  назначаем ему стартовый угол
			new_solid.image_angle=alpha_loc-90 //  поворачиваем его спрайт по углу
			//show_debug_message(" string_end "+string(global.string_end)+" result_row "+string(result_row)+" !! "+string(new_solid.sprite_index))
			//show_debug_message("alpha_create_solid "+string(alpha_loc)+" rotation_start "+string(rotation_start))
		}
		j--
	}		
			
			
}else{ // если первый проход в самом начале игры
	//global.string_end="0";
	var result_row=0 // 0 для первого прохода
	//var result_row=irandom_range(5,9)
	global.string_end= scr_random_range(global.DB[# result_row,2])	 // выбираем вид сектора из допустимых для следующего прохода
	//global.testing=" string_end "+string(global.string_end)+" result_row "+string(result_row)
	sprite_index=asset_get_index(global.DB[# result_row,0]);
	
	//sprite_index=spr_circle_small // временно
	
	for(var pool=3;pool<43;pool+=4){		
		if(global.DB[# result_row,pool]!=0){				
			object_loc=asset_get_index(global.DB[# result_row,pool])
			
			//object_loc=obj_solid// временно
			
			alpha_loc=global.DB[# result_row,pool+1]-90+rotation_start
			height_radius_loc=global.DB[# result_row,pool+2]
			sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])	
			
			//sprite_id_loc=spr_solid3_5	// временно
			/*
			new_solid=instance_create_layer(0, // временно
				0,"Instances",
				object_loc);
			new_solid.sprite_index=sprite_id_loc
			new_solid.alpha=alpha_loc
			new_solid.height_radius=height_radius_loc
			new_solid.start_alpha=alpha_loc
			new_solid.image_angle=alpha_loc-90
			*/
			
			
			new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
				global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
				object_loc);
				
			new_solid.sprite_index=sprite_id_loc
			new_solid.alpha=alpha_loc-360
			new_solid.height_radius=height_radius_loc
			new_solid.start_alpha=alpha_loc-360
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
return result_row

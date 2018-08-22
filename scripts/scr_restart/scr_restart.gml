var alpha_target=0
var result=0
var i=3
var previous_i=0
var result_previous=0

ar[3]=obj_main.sector_r
ar[2]=obj_main.sector_u
ar[1]=obj_main.sector_l
ar[0]=obj_main.sector_d

repeat(4){
	alpha_target=ar[i].rotation_start-alpha
	if(alpha_target<=90&&alpha_target>=0){
		result=ar[i]
		break;		
	}
	i--
}
if(i==0){
	previous_i=3
}else{
	previous_i=i-1
}
result_previous=ar[previous_i]
global.testing="Crash in sector "+string(result.sector_id)

if(result.rotation_start>180){	
	//удаление всех объектов в районе предыдущего сектора
	with(obj_solid){
		if(alpha<=result_previous.rotation_start+360&&alpha>result_previous.rotation_start+270){
			instance_destroy()
		}
	}
	with(obj_enemy){
		if(alpha<=result_previous.rotation_start+360&&alpha>result_previous.rotation_start+270){
			instance_destroy()
		}
	}
	with(obj_solid_fall){
		if(alpha<=result_previous.rotation_start+360&&alpha>result_previous.rotation_start+270){
			instance_destroy()
		}
	}	
	scr_shift(-1,result)
}else{	
	if(result.rotation_start<90){
		scr_shift(1,result)
	}else{
		scr_shift(-1,result)
	}
}




/*
var q=3
score-=5
repeat(4){
var j=9;
var object_loc=noone
var alpha_loc=0
var height_radius_loc=0
var sprite_id_loc=""


	//var result_row=irandom_range(int64(global.string_end)*10,int64(global.string_end)*10+9) // рандомный выбор из выбранного десятка секторов базы

	//global.string_end= scr_random_range(global.DB[# result.sector_id,2])	// выбираем вид сектора из допустимых для следующего прохода
	
	ar[q].sprite_index=asset_get_index(global.DB[# result.sector_id,0]);  // загружаем спрайт сектора
	
	for(var pool=3;pool<43;pool+=4){		
		if(global.DB[# result_row,pool]!=0){				
			object_loc=asset_get_index(global.DB[# result_row,pool]) // берем наименование объекта
			
		
			
			alpha_loc=global.DB[# result_row,pool+1]-90+rotation_start // берем угол (то есть позицию объекта)
			height_radius_loc=global.DB[# result_row,pool+2] //берем высоту объекта
			sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])	 // берем название спрайта		
		
			
			new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
				global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
				object_loc);  // создаем экземпляр объекта по взятым параметрам
			new_solid.sprite_index=sprite_id_loc // назначаем ему спрайт
			new_solid.alpha=alpha_loc //  назначаем ему угол
			new_solid.height_radius=height_radius_loc // назначаем ему высоту
			new_solid.start_alpha=alpha_loc //  назначаем ему стартовый угол
			new_solid.image_angle=alpha_loc-90 //  поворачиваем его спрайт по углу
		
		}
		j--
	}		
		
		
}	



with (obj_enemy){	
	depth=depth-10
}*/
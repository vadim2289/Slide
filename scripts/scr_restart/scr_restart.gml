var alpha_target=0
var result=0
var i=3
var previous_i=0
var post_previous_i=0
var after_i=0
var result_previous=0
var result_after=0
var result_post_previous=0
global.testing=""
ar[3]=obj_main.sector_r
ar[2]=obj_main.sector_u
ar[1]=obj_main.sector_l
ar[0]=obj_main.sector_d

repeat(4){
	alpha_target=ar[i].rotation_start-alpha
	if(alpha_target<=90&&alpha_target>=0){
		
		result=ar[i]
		//show_debug_message(string(ar[i].rotation_start)+" "+"RESULT i "+string(i))
		break;		
	}
	i--
}
show_debug_message(string(ar[i].rotation_start)+" "+"RESULT i "+string(i))
if(i==0){
	previous_i=3
}else{
	previous_i=i-1
}
result_previous=ar[previous_i]

if(previous_i==0){
	post_previous_i=3
}else{
	post_previous_i=previous_i-1
}
result_post_previous=ar[post_previous_i]

if(i==3){
	after_i=0
}else{
	after_i=i+1
}
result_after=ar[after_i]
show_debug_message(string(result.sector_id)+" pr "+string(result_previous.sector_id)+"  post "+string(result_post_previous.sector_id)+"  after "+string(result_after.sector_id))
global.testing="Crash in sector "+string(result.sector_id)+" sector_result_rot:  "+string(result.rotation_start)+"  player_alpha: "+string(alpha)

if(result.rotation_start>180){	
	show_debug_message(string(result.sector_id)+" >180 alpha "+string(result.rotation_start))
	//удаление всех объектов в районе предыдущего сектора
	//show_debug_message(result_previous.sector_id)
	with(obj_solid){
	//	show_debug_message(result_post_previous.sector_id)
		if(alpha<=result_post_previous.rotation_start||alpha>result_previous.rotation_start-90){
			show_debug_message("DESTROY___  "+string(alpha))
			instance_destroy()
		}
	}
	with(obj_enemy){
		if(type_obj!="bullet"&&type_obj!="obj_meteor"){		
			if(alpha<=result_post_previous.rotation_start||alpha>result_previous.rotation_start-90){
				show_debug_message("DESTROY___  "+string(alpha))
				instance_destroy()
			}
		}
	}
	with(obj_solid_fall){
		if(alpha<=result_post_previous.rotation_start||alpha>result_previous.rotation_start-90){
			show_debug_message("DESTROY___  "+string(alpha))
			instance_destroy()
		}
	}	
	
	var j=9;
	var object_loc=noone
	var alpha_loc=0
	var height_radius_loc=0
	var sprite_id_loc=""
			
	var result_row=int64(result_previous.sector_id)	
	result_previous.sprite_index=asset_get_index(global.DB[# result_row,0]);  
	for(var pool=3;pool<43;pool+=4){		
		if(global.DB[# result_row,pool]!=0){				
			object_loc=asset_get_index(global.DB[# result_row,pool]) // берем наименование объекта
			if(object_loc!=obj_move_enemy){
				//object_loc=obj_solid
			
				alpha_loc=global.DB[# result_row,pool+1]-90+result_previous.rotation_start // берем угол (то есть позицию объекта)
				height_radius_loc=global.DB[# result_row,pool+2] //берем высоту объекта
				sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])	 // берем название спрайта		
			
				//sprite_id_loc=spr_solid3_5		
			
				result_previous.new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
					global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
					object_loc);  // создаем экземпляр объекта по взятым параметрам
				result_previous.new_solid.sprite_index=sprite_id_loc // назначаем ему спрайт
				result_previous.new_solid.alpha=alpha_loc //  назначаем ему угол
				result_previous.new_solid.height_radius=height_radius_loc // назначаем ему высоту
				result_previous.new_solid.start_alpha=alpha_loc //  назначаем ему стартовый угол
				result_previous.new_solid.image_angle=alpha_loc-90 //  поворачиваем его спрайт по углу
				show_debug_message(" inatsnace_create_previous "+string(result_previous.new_solid.alpha))
				global.test_instance_prev=result_previous.new_solid
			}
			
		}
		j--
	}		
	with (obj_enemy){	
		depth=depth-10
	}	
	
	// для previous result
	result_post_previous.sector_id=42
	var result_row=int64(result_post_previous.sector_id)	
	result_post_previous.sprite_index=asset_get_index(global.DB[# result_row,0]);  
	/*
	var j=9;
	var object_loc=noone
	var alpha_loc=0
	var height_radius_loc=0
	var sprite_id_loc=""
			
	var result_row=int64(result_post_previous.sector_id)	
	sprite_index=asset_get_index(global.DB[# result_row,0]);  
	for(var pool=3;pool<43;pool+=4){		
		if(global.DB[# result_row,pool]!=0){				
			object_loc=asset_get_index(global.DB[# result_row,pool]) // берем наименование объекта
			
			//object_loc=obj_solid
			
			alpha_loc=global.DB[# result_row,pool+1]-90+result_post_previous.rotation_start // берем угол (то есть позицию объекта)
			height_radius_loc=global.DB[# result_row,pool+2] //берем высоту объекта
			sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])	 // берем название спрайта		
			
			//sprite_id_loc=spr_solid3_5		
			
			result_post_previous.new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
				global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
				object_loc);  // создаем экземпляр объекта по взятым параметрам
			result_post_previous.new_solid.sprite_index=sprite_id_loc // назначаем ему спрайт
			result_post_previous.new_solid.alpha=alpha_loc+360 //  назначаем ему угол
			result_post_previous.new_solid.height_radius=height_radius_loc // назначаем ему высоту
			result_post_previous.new_solid.start_alpha=alpha_loc+360 //  назначаем ему стартовый угол
			result_post_previous.new_solid.image_angle=alpha_loc-90 //  поворачиваем его спрайт по углу
			//show_debug_message(" inatsnace_create_post "+string(result_previous.new_solid.alpha))
			global.test_instance_post=result_post_previous.new_solid
			//show_debug_message(" string_end "+string(result_post_previous.new_solid.alpha))
		}
		j--
	}		
	with (obj_enemy){	
		depth=depth-10
	}	
	
	*/
	global.string_end= scr_random_range(global.DB[# int64(result_after.sector_id),2])	// выбираем вид сектора из допустимых для следующего прохода
	show_debug_message("!!!! updateing "+string(result_post_previous.sector_updating))
	result_post_previous.sector_updating=false
	scr_shift(-1,result)
}else{	
	if(result.rotation_start<90){
		show_debug_message("<90")
		//удаление всех объектов в районе следующего сектора
		with(obj_solid){
				if(alpha<=result_after.rotation_start&&alpha>result_after.rotation_start-90){
					instance_destroy()
				}
		}
		with(obj_enemy){
			if(type_obj!="bullet"&&type_obj!="obj_meteor"){		
				if(alpha<=result_after.rotation_start&&alpha>result_after.rotation_start-90){
					instance_destroy()
				}
			}
		}
		with(obj_solid_fall){
			if(alpha<=result_after.rotation_start&&alpha>result_after.rotation_start-90){
				instance_destroy()
			}
		}	
				
		global.string_end= scr_random_range(global.DB[# int64(result.sector_id),2])	// выбираем вид сектора из допустимых для следующего прохода
		scr_shift(-1,result_previous)
		
	}else{
			show_debug_message(">90")
		with(obj_solid){
			if(alpha>=0){
					if(alpha<=result_post_previous.rotation_start&&alpha>result_previous.rotation_start){
						instance_destroy()
					}
				}else{
					if(alpha<=result_post_previous.rotation_start-360&&alpha>result_previous.rotation_start-360){
						instance_destroy()
					}
				}
		}
		with(obj_enemy){
			if(type_obj!="bullet"&&type_obj!="obj_meteor"){		
				if(alpha>=0){
					if(alpha<=result_post_previous.rotation_start&&alpha>result_previous.rotation_start){
						instance_destroy()
					}
				}else{
					if(alpha<=result_post_previous.rotation_start-360&&alpha>result_previous.rotation_start-360){
						instance_destroy()
					}
				}
			}
		}
		with(obj_solid_fall){
			if(alpha>=0){
					if(alpha<=result_post_previous.rotation_start&&alpha>result_previous.rotation_start){
						instance_destroy()
					}
				}else{
					if(alpha<=result_post_previous.rotation_start-360&&alpha>result_previous.rotation_start-360){
						instance_destroy()
					}
				}
		}			
		result_post_previous.sector_id=42
		var result_row=int64(result_post_previous.sector_id)	
		result_post_previous.sprite_index=asset_get_index(global.DB[# result_row,0]);  
		global.string_end= scr_random_range(global.DB[# int64(result_after.sector_id),2])// выбираем вид сектора из допустимых для следующего прохода
		global.testing=result_post_previous.rotation_start
		show_debug_message("!!!! updateing "+string(result_post_previous.sector_updating))
		result_post_previous.sector_updating=false
		scr_shift(-1,result)
		
	}
}
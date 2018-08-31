/// @description Insert description here
// You can write your code in this editor

if(!global.pause){
	button_key=keyboard_check_pressed(vk_up)
	button_down=keyboard_check(vk_down);
	key_horizon=keyboard_check(vk_right)-keyboard_check(vk_left);
	
	vertical_speed-=gravity_	

	if(key_horizon>0){
		horizontal_speed-=acceleration_	
		horizontal_speed=clamp(horizontal_speed,0,-speed_);	
		image_speed=2	
	}else if(key_horizon<0){
		horizontal_speed+=acceleration_
		horizontal_speed=clamp(abs(horizontal_speed),0,speed_*1.5);
		image_speed=0
	}else{
		horizontal_speed=lerp(horizontal_speed,0,acceleration_*1.5)
		image_speed=1
	}
	alpha+=horizontal_speed;

	var x_future=global.x_+lengthdir_x(result_radius+vertical_speed,alpha);
	var y_future=global.y_+lengthdir_y(result_radius+vertical_speed,alpha);
	var x_future_1=global.x_+lengthdir_x(result_radius+sign(vertical_speed),alpha);
	var y_future_1=global.y_+lengthdir_y(result_radius+sign(vertical_speed),alpha);
	var result_radius_local=result_radius

	if(x_future<-10){
		global.pause=true
					super_power=true
					result_radius=1500
					scr_restart()
					gravity_=0
					result_radius_local=result_radius
					alpha=90
					alarm[0]=20
	}
	if(y_future>room_height+10){
			global.pause=true
					super_power=true
					result_radius=1500
					scr_restart()
					gravity_=0
					result_radius_local=result_radius
					alpha=90
					alarm[0]=20
	}
	if(place_meeting(x_future,y_future,obj_enemy)){
		var inst= instance_place(x_future,y_future,obj_enemy)
		if(inst.type_obj=="obj_good"){
			global.pause=true
			global.speed_=0;
			alarm[2]=50 // задержка перед активацией лута
			loot="good"
			//alarm[1]=inst.time
			instance_destroy(inst)		
		}else if(inst.type_obj=="obj_bad"){
			global.pause=true
			global.speed_=0;
			alarm[2]=50 // задержка перед активацией лута
			loot="bad"
			//alarm[1]=inst.time_
			//global.speed_=inst.speed_
			//bad_active=inst.speed_
			instance_destroy(inst)
		}
		else if(super_power==false){	
			
			global.pause=true	
			bad_active=-1
			scr_restart()
			gravity_=0
			super_power=true
			alarm[0]=20
			result_radius=1500
			result_radius_local=result_radius
			alpha=90
			result_radius+=vertical_speed;
			//show_debug_message("solid_fall"+string(result_radius))
			x=global.x_+lengthdir_x(result_radius,alpha); 
			y=global.y_+lengthdir_y(result_radius,alpha);
			exit;
			
		}
	}

	if(place_meeting(x_future,y_future,obj_eath)){
		var inst= instance_place(x_future,y_future,obj_eath)
		if(inst.visible){
		
			AI="on_eath"
			//Доводим персонаж плавно с шагом +1 или -1 до момента соприкосновения с объектом.	
			while !place_meeting(x_future_1,y_future_1,obj_eath){	
				result_radius=result_radius_local
				result_radius_local+=sign(vertical_speed);	
				x_future_1=global.x_+lengthdir_x(result_radius_local,alpha); 
				y_future_1=global.y_+lengthdir_y(result_radius_local,alpha);			
			}	
			//Проверка коллизий при погружении в объект более чем на 16 пикселей - рестарт	
			while place_meeting(global.x_+lengthdir_x(result_radius_local+sign(vertical_speed),alpha),global.y_+lengthdir_y(result_radius_local+sign(vertical_speed),alpha),obj_eath){		
				result_radius_local+=1	
				//show_debug_message("while place_meeting_"+string(result_radius_local)+" dopusk "+string(abs(result_radius-result_radius_local)))
				if(abs(result_radius-result_radius_local)>dopusk){// если игрок проваливается в солид больше чем на 20 пикселей, то конец, если меньше, то нор, встает наверх
					//game_restart()
					if(!super_power){
						//var inst= instance_place(global.x_+lengthdir_x(result_radius_local+sign(vertical_speed),alpha),global.y_+lengthdir_y(result_radius_local+sign(vertical_speed),alpha),obj_eath)
						//global.testing_solid=inst.alpha
						global.pause=true
						super_power=true
						result_radius=1500
						bad_active=-1
						scr_restart()
						gravity_=0
						result_radius_local=result_radius
						alpha=90
						alarm[0]=20
						result_radius+=vertical_speed;
						//show_debug_message("solid_fall"+string(result_radius))
						x=global.x_+lengthdir_x(result_radius,alpha); 
						y=global.y_+lengthdir_y(result_radius,alpha);
						exit;
					
						//var inst= instance_place(global.x_+lengthdir_x(result_radius_local+sign(vertical_speed),alpha),global.y_+lengthdir_y(result_radius_local+sign(vertical_speed),alpha),obj_eath)
						//global.testing_solid=inst
					
						break; // остновка while после рестарта, чтобы не считал до конца	
					
					}
					break; // остновка while после рестарта, чтобы не считал до конца			
				}
			}	
			vertical_speed=0;// обнуление вертикальной скорости здесь, чтобы работала проверка на  погружение в спрайт выше	
			result_radius=result_radius_local
	

			if(object_get_name(inst.object_index)=="obj_solid_fall"&&inst.alarm[0]<=0){
				inst.fall_=true
			}
			// Для предотвращения дергания задаем строгую позицию по возможным радиусам
			if(object_get_name(inst.object_index)!="obj_solid_fall"){
				if(result_radius_local<730){
					result_radius=725
				}else if(result_radius_local>820&&result_radius_local<830){
					result_radius=825	
					//show_debug_message(result_radius)
				}else if(result_radius_local>920&&result_radius_local<930){
					result_radius=925
				}else if(result_radius_local>1020&&result_radius_local<1030){
					result_radius=1025
				}else if(result_radius_local>1120&&result_radius_local<1130){
					result_radius=1125
				}
			}else{
				result_radius=inst.height_radius+global.radius_-1
				//show_debug_message("solid_fall"+string(result_radius))
			}
		
		}

	}else{
		AI="jamp"	
	}
	if(button_down>0){
		sprite_index=spr_pld
		image_angle=alpha-90
	}else {
		sprite_index=spr_pl
		image_angle=alpha-90
	}
	if(button_key){
		//show_debug_message(AI)
		//show_debug_message(vertical_speed)
	}

	if(button_key>0&&AI="on_eath"){		
		vertical_speed=button_key*jump_
	}


	result_radius+=vertical_speed;
	//show_debug_message("solid_fall"+string(result_radius))
	x=global.x_+lengthdir_x(result_radius,alpha); 
	y=global.y_+lengthdir_y(result_radius,alpha);

}else{	
	vertical_speed=0
	horizontal_speed=0
}
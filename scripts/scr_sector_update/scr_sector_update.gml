var j=9;
var object_loc=noone
var alpha_loc=0
var height_radius_loc=0
var sprite_id_loc=""
var var_view=rotation_start-360
//var var_view_2=rotation_start-360
var var_view_3=rotation_start-364.5
var depth_waves=-10
var propusk=true
var first_counter=0
var second_counter=0
var third_counter=0
var radius_waves=0
var first_radius=0;
var second_radius=0;
var third_radius=0;
var counter_=0
var counter_cloud=0
var step_cloud=11.25
var delete_last_wave=-1
var global_counter=0



//score+=5


//if(global.string_end!="-1"){ // если не первый проход
			
	var result_row=irandom_range(int64(global.string_end)*10,int64(global.string_end)*10+9) // рандомный выбор из выбранного десятка секторов базы
								//	global.log+="X"+string(result_row)
									//global.number_+=1
									//result_row=global.number_
									//if result_row>49{
	
	
									//result_row=0 // временно
												
												
								//		global.number_=0
								//	}
									//result_row=round(random_range(197,198))
	show_debug_message("CREATE!!!!!!!!!!! "+string(result_row))
	
	
	
	global.string_end= scr_random_range(global.DB[# result_row,2])	// выбираем вид сектора из допустимых для следующего прохода
	
	
	//global.string_end=string(irandom_range(0,9))
	
											//global.string_end=string(irandom_range(0,1))
	
	
																						//global.string_end= "0" // временно
												
												
											//global.testing=" string_end "+string(global.string_end)+" result_row "+string(result_row)
											//global.testing=string(result_row)
	
	sprite_index=asset_get_index(global.DB[# result_row,0]);  // загружаем спрайт сектора
	depth=depth-10
	
	// Визуализация водопадов и назначение последовательностей волн	
	switch(sprite_index){
		case spr_circle_F:
			first_counter=10
			first_radius=0
			third_radius=0
			break;
		case spr_circle_C:
			first_counter=2
			first_radius=0
			second_counter=6
			second_radius=-100
			third_counter=2
			third_radius=0
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=-1
			view_.alpha=var_view-22.5
			view_.depth=-100
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=1
			view_.alpha=var_view-66.5
			view_.depth=-100
			third_radius=0
			break;
		case spr_circle_E:
			first_counter=10
			first_radius=-100
			third_radius=-100
			break;
		case spr_circle_L:
			first_counter=3
			first_radius=-100
			second_counter=7
			second_radius=0
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=1
			view_.alpha=var_view-22.5
			view_.depth=-100
			third_radius=0
			break;
		case spr_circle_LR:
			first_counter=3
			first_radius=-100
			second_counter=4
			second_radius=0
								delete_last_wave=14 // удалить 14 волну
			third_counter=3
			third_radius=-100
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=1
			view_.alpha=var_view-22.5
			view_.depth=-100
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=-1
			view_.alpha=var_view-66.5
			view_.depth=-100		
			third_radius=-100
			break;
		case spr_circle_R:
			first_counter=7
			first_radius=0
			
									delete_last_wave=14 // удалить 14 волну
			
			second_counter=3
			second_radius=-100
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=-1
			view_.alpha=var_view-66.5
			view_.depth=-100	
			third_radius=-100
			break;
		case spr_circle_RR:
			first_counter=5
			first_radius=0
			
									delete_last_wave=10 // удалить 10 волну
			
			second_counter=5
			second_radius=-100
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=-1
			view_.alpha=var_view-45
			view_.depth=-100
			third_radius=-100
			break;
		case spr_circle_LL:
			first_counter=5
			first_radius=-100
			second_counter=5
			second_radius=0
			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			view_.sprite_index=spr_waterfall
			view_.image_xscale=1
			view_.alpha=var_view-45
			view_.depth=-100
			third_radius=0
			break;		
	}	
	//end
	
	if (first_radius>global.third_counter_prev) {
		view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
		view_.sprite_index=spr_waterfall
		view_.image_xscale=1
		view_.alpha=var_view
		view_.depth=-100
	}else if (first_radius<global.third_counter_prev) {
		view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
		view_.sprite_index=spr_waterfall
		view_.image_xscale=-1
		view_.alpha=var_view
		view_.depth=-100
		instance_destroy(global.last_wave_id)
	}
	
	global.third_counter_prev=third_radius
	
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
			new_solid.sprite_index=sprite_id_loc // назначаем ему спрайт коллизии
			new_solid.alpha=alpha_loc-360 //  назначаем ему угол
			new_solid.height_radius=height_radius_loc // назначаем ему высоту
			new_solid.start_alpha=alpha_loc-360 //  назначаем ему стартовый угол
			new_solid.image_angle=alpha_loc-90 //  поворачиваем его спрайт по углу
			
			
			// визуализация объекта
			
			
				
				

				
				// назначаем спрайт визуального объекта в зависимости от коллизии				
				switch(new_solid.sprite_index){
				
					case spr_solid1_5:
					
					view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
					view_1.alpha=new_solid.alpha
					view_1.height_radius=new_solid.height_radius
					//view_1.start_alpha=new_solid.start_alpha+50
					view_1.image_angle=new_solid.image_angle					
					view_1.depth=-100	
					view_1.sprite_index=spr_cloud_0_1	
				
					break;
					case spr_solid1_4:
			
						
					repeat 2{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_1	
						counter_cloud+=step_cloud
					}
						
					break;
					case spr_solid1_3:
				
					
						
					repeat 4{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_1	
						counter_cloud+=step_cloud
					}
						
					break;
					case spr_solid1_2:
					
					
						
						
						repeat 6{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_1	
						counter_cloud+=step_cloud
					}
					break;
					case spr_solid1:					
						
						
							repeat 8{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_1	
						counter_cloud+=step_cloud
					}
						
					break;
					case spr_solid2_5:
					view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
					view_1.sprite_index=spr_cloud_0_2	
						
					break;
					case spr_solid2_4:
					
					repeat 2{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_2
						counter_cloud+=step_cloud
					}
						
						
						
						
					break;
					case spr_solid2_3:
					
					repeat 4{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_2
						counter_cloud+=step_cloud
					}						
					break;
					case spr_solid2_2:
					repeat 6{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_2
						counter_cloud+=step_cloud
					}		
					break;
					case spr_solid2:
					repeat 8{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_2
						counter_cloud+=step_cloud
					}	
					break;
					case spr_solid3_5:
					
					view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
					view_1.alpha=new_solid.alpha
					view_1.height_radius=new_solid.height_radius
					view_1.start_alpha=new_solid.start_alpha
					view_1.image_angle=new_solid.image_angle					
					view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_3
					
						
					break;
					case spr_solid3_4:
					repeat 2{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_3
						counter_cloud+=step_cloud
					}	
						
					break;
					case spr_solid3_3:
					repeat 4{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_3
						counter_cloud+=step_cloud
					}		
					break;
					case spr_solid3_2:
					repeat 6{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_3
						counter_cloud+=step_cloud
					}	
						
					break;
					case spr_solid3:
					repeat 8{
						view_1=instance_create_layer(new_solid.x,new_solid.y,"Instances", obj_view);  // создаем визуальный объект по координатам коллизии
						view_1.alpha=new_solid.alpha-counter_cloud
						view_1.height_radius=new_solid.height_radius
						//view_1.start_alpha=new_solid.start_alpha+50
						view_1.image_angle=new_solid.image_angle					
						view_1.depth=-100	
						view_1.sprite_index=spr_cloud_0_3
						counter_cloud+=step_cloud
					}	
					break;
			
			}
			counter_cloud=0
			//show_debug_message(" string_end "+string(global.string_end)+" result_row "+string(result_row)+" !! "+string(new_solid.sprite_index))
			//show_debug_message("alpha_create_solid "+string(alpha_loc)+" rotation_start "+string(rotation_start))
		}
// уменьшение счетчика количества волн на каждый из трех участков сектора
				if first_counter>0 {	
					counter_=first_counter
					radius_waves=first_radius
					first_counter-=1
					//counter_=first_counter
				}else if second_counter>0{
					counter_=second_counter
					radius_waves=second_radius
					second_counter-=1
					//counter_=second_counter
				}else if third_counter>0{
					counter_=third_counter
					radius_waves=third_radius
					third_counter-=1
					//counter_=third_counter
				}
				
// создание волн переднего и заднего плана по счетчикам, пропуск - это создание пары волн с другого начального кадра анимации  			
				if(propusk){
					view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
					global_counter+=1
					view_.height_radius=radius_waves
					view_.alpha=var_view
					var_view-=9
					view_.depth=depth_waves
					if(radius_waves<0){						
						view_.sprite_index=spr_down_front_wave
					}else{
						view_.sprite_index=spr_up_front_wave
					}
					depth_waves-=1
					if counter_>0 {
						if(delete_last_wave!=global_counter+1){			
							view_3=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
							global.last_wave_id=view_3
							global_counter+=1
							view_3.height_radius=radius_waves
							view_3.alpha=var_view_3
							var_view_3-=9					
							if(radius_waves<0){						
								view_3.sprite_index=spr_down_back_wave
							}else{
								view_3.sprite_index=spr_up_back_wave
							}
							view_3.depth=-depth_waves
							view_3.image_index=3
						}else{
							global_counter+=1
						}
							
					}
					
				}else{		
					view_2=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
					global_counter+=1
					view_2.height_radius=radius_waves
					view_2.alpha=var_view
					//view_2.sprite_index=sprite581
					var_view-=9
					if(radius_waves<0){						
						view_2.sprite_index=spr_down_front_wave
					}else{
						view_2.sprite_index=spr_up_front_wave
					}
					view_2.depth=depth_waves
					view_2.image_index=6		
					depth_waves-=1
					if counter_>0 {
						
						if(delete_last_wave!=global_counter+1){			
						view_3=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
						global.last_wave_id=view_3
							global_counter+=1
							view_3.height_radius=radius_waves
							view_3.alpha=var_view_3
							var_view_3-=9						
							if(radius_waves<0){	
						
								view_3.sprite_index=spr_down_back_wave
							}else{
						
								view_3.sprite_index=spr_up_back_wave
							}
							view_3.depth=-depth_waves
							view_3.image_index=9	
						}else{
							global_counter+=1
						}
						
					}
							
					
				}
			
			propusk=!propusk	
			
				
		
			//depth_waves-=1
		
			//view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
			//view_.alpha=var_view
			//var_view-=9
			j--
	}		
			
			
					//}else{ // если первый проход в самом начале игры
					//	//global.string_end="0";
					//	var result_row=2 // 0 для первого прохода
					//	//var result_row=irandom_range(5,9)
					//	global.string_end= scr_random_range(global.DB[# result_row,2])	 // выбираем вид сектора из допустимых для следующего прохода
					//	//global.testing=" string_end "+string(global.string_end)+" result_row "+string(result_row)
					//	sprite_index=asset_get_index(global.DB[# result_row,0]);
	
	
	
					//	//view_.alpha=rotation_start//	sprite_index=asset_get_index("spr_circle_small"); // временно
	
					//	//sprite_index=spr_circle_small // временно
	
					//	for(var pool=3;pool<43;pool+=4){		
					//		if(global.DB[# result_row,pool]!=0){				
					//			object_loc=asset_get_index(global.DB[# result_row,pool])
			
					//			//object_loc=obj_solid// временно
			
					//			alpha_loc=global.DB[# result_row,pool+1]-90+rotation_start
					//			height_radius_loc=global.DB[# result_row,pool+2]
					//			sprite_id_loc=asset_get_index(global.DB[# result_row,pool+3])	
			
					//			//sprite_id_loc=spr_solid3_5	// временно
					//			/*
					//			new_solid=instance_create_layer(0, // временно
					//				0,"Instances",
					//				object_loc);
					//			new_solid.sprite_index=sprite_id_loc
					//			new_solid.alpha=alpha_loc
					//			new_solid.height_radius=height_radius_loc
					//			new_solid.start_alpha=alpha_loc
					//			new_solid.image_angle=alpha_loc-90
					//			*/
			
			
					//			new_solid=instance_create_layer(global.x_+lengthdir_x(global.radius_+height_radius_loc,alpha_loc),
					//				global.y_+lengthdir_y(global.radius_+height_radius_loc,alpha_loc),"Instances",
					//				object_loc);
				
					//			new_solid.sprite_index=sprite_id_loc
					//			new_solid.alpha=alpha_loc-360
					//			new_solid.height_radius=height_radius_loc
					//			new_solid.start_alpha=alpha_loc-360
					//			new_solid.image_angle=alpha_loc-90
			
					//			//show_debug_message(" string_end "+string(global.string_end)+" result_row "+string(result_row)+" !! "+string(new_solid.sprite_index))
					//		}
		
		
		
					//		if(propusk){
					//			view_=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
					//			view_.height_radius=0
					//			view_.alpha=var_view
					//			var_view-=9
					//			view_.depth=depth_waves
					//			view_.sprite_index=spr_up_front_wave
					//			depth_waves-=1
					//			if pool<39 {
					//				view_3=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
					//				view_3.height_radius=0
					//				view_3.alpha=var_view_3
					//				var_view_3-=9
					//				view_3.sprite_index=spr_up_back_wave
					//				view_3.depth=-depth_waves
					//				view_3.image_index=3
					//			}
					//		}else{		
					//			view_2=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
					//			view_2.height_radius=0
					//			view_2.alpha=var_view
					//			//view_2.sprite_index=sprite581
					//			var_view-=9
					//			view_2.sprite_index=spr_up_front_wave
					//			view_2.depth=depth_waves
					//			view_2.image_index=6		
					//			depth_waves-=1
					//			if pool<39 {
					//				view_3=instance_create_layer(global.x_,global.y_,"Instances",obj_view); // нижняя точка
					//				view_3.height_radius=0
					//				view_3.alpha=var_view_3
					//				var_view_3-=9
					//				view_3.sprite_index=spr_up_back_wave
					//				view_3.depth=-depth_waves
					//				view_3.image_index=9
					//			}
					//		}		
					//		propusk=!propusk
					//		j--
					//	}
					//	//global.string_end="0"  // временно
					//}

with (obj_enemy){	
	depth=depth-10
}
obj_eath_view.depth=-500
show_debug_message("GLOBALCOUNTER  "+string(global_counter))
return result_row

/// @description global step
// You can write your code in this editor
//show_debug_message("wall1  "+string(wall1.enable))
//show_debug_message("wall2222  "+string(wall2.enable))
//global.speed_=lerp(global.speed_,0.0,0.0025)



// при взятии лута разгон и замедление мира
if(!global.pause){
	if(obj_pl.bad_active>0){
		global.speed_=lerp(global.speed_,obj_pl.bad_active,0.01);	
	}else if(obj_pl.bad_active<0){
		global.speed_=lerp(global.speed_,0.3,0.05)
		if(global.speed_==0.3){
			obj_pl.bad_active=0
			obj_pl.super_power=false
			//global.testing=""
		}
		
	}
	
}


// постепенное возвращение к сектору при рестаре
if(!global.pause_game){
	if(global.shift!=0){
		global.first_after_shift=false
		if(global.shift_count!=0){	
			global.shift_count-=global.speed_*sign(global.speed_)
			global.speed_+=sign(global.speed_)*0.1
	
			if(global.shift_count<=global.shift/2){
				global.speed_-=sign(global.speed_)*0.1
			}
			if(global.shift_count-global.speed_*sign(global.speed_)<0){		
					global.speed_=sign(global.speed_)*global.shift_count	
					//global.score_-=global.speed_
			}
		}else{
			global.score_-=0.3
			global.shift=0
			alarm[0]=50		
			
		
			
		}
	}

}
global.score_+=global.speed_

obj_sprite.depth=obj_eath.depth-1



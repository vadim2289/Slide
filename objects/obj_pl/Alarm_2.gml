/// @description Pause when bad or good start
// You can write your code in this editor
global.speed_=global.max_speed_
if(loot=="good"){
		super_power=true	
		global.testing="goood"
		alarm[1]=random_range(400,700)
		bad_active=0.8
}else if(loot=="bad"){
		super_power=false	
		global.testing="baaaad"
		var ran=round(irandom(2))
		if(ran==2){
			alarm[1]=random_range(400,700)
			bad_active=0.5
		}else{
			if(obj_ufo.x==obj_ufo.x_start){
				obj_ufo.alarm[0]=5
				count_stop=5
				bad_active=0
			}else{
				alarm[1]=random_range(400,700)
				bad_active=0.5
			}
		}
}
global.pause=false
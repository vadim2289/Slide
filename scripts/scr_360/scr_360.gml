
if(variable_instance_exists(id,"rotation_start")){
	if(rotation_start>=720){
		rotation_start-=720
	}else if(rotation_start<0){
		rotation_start=720+rotation_start
	}	
}
if(variable_instance_exists(id,"alpha")){
	if(alpha>=720){
		alpha-=720
		start_alpha-=720
	}else if(alpha<0){
		alpha=720+alpha
		start_alpha=720+start_alpha
	}
}
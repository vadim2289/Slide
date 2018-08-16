var i=0
var string_write=""
//show_debug_message(object_get_name(id))
repeat 4000 {
	
	if(global.string_end!="-1"){ // если не первый проход
			
		var result_row=irandom_range(int64(global.string_end)*10,int64(global.string_end)*10+9) // рандомный выбор из выбранного десятка секторов базы
		//global.string_write+=string(result_row)+" X "
		global.string_end= scr_random_range(global.DB[# result_row,2])	// выбираем вид сектора из допустимых для следующего прохода
		string_write+=string(result_row)+" X "
		//show_debug_message(i)
		i++
			
	}else{ // если первый проход в самом начале игры
		//show_debug_message("!!!!!!!!!!!")
		var result_row=0 // 0 для первого прохода
		//var result_row=irandom_range(5,9)
		global.string_end= scr_random_range(global.DB[# result_row,2])	 // выбираем вид сектора из допустимых для следующего прохода
		string_write+=string(result_row)+" X "
		//global.string_write+=string(result_row)+" X "
/*if(int64(result_number)>max_-1){
	result_number="1"
}*/
		
		

	}
}
if (file_exists(working_directory +"log.txt")){
	var file=file_text_open_write(working_directory+"log.txt") 
	//file_text_write_string(file,global.string_write)
	file_text_write_string(file,string_write)
	file_text_close(file)
}
// рандомный выбор типа сектора из возможных взятых из таблицы
var string_=argument0

//var max_=string_length(string_letters(string_))+1;
var max_=1
var i=max_;

repeat(i) { 
	var stop=string_pos("X",string_)
	if(stop==0){
		array_int[i-1]=string_copy(string_,0,string_length(string_))
	}else{
		array_int[i-1]=string_copy(string_,0,stop-1)
		string_=string_copy(string_,stop+1,string_length(string_))
	}
	i-=1;	
}
var result_number=array_int[irandom(max_-1)];
if(result_number>1){
	result_number=1
}

return result_number





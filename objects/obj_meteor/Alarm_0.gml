/// @description Insert description here
// You can write your code in this editor
x_start=irandom_range(0,room_width);
y_start=-10;

if(x_start>=room_width/2){
	x_end=irandom_range(0,x_start)
}else{
	x_end=irandom_range(x_start,room_width)
}
y_end=room_height;
x=x_start
y=y_start
//meteor_start=true;
speed=5
direction=point_direction(x,y,x_end,y_end)
show_debug_message(y_end)

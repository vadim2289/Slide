var vec=argument0
var sector=argument1

global.speed_=vec*sign(global.speed_)*0.1
global.shift=abs(sector.rotation_start-90)+0.1
global.shift_count=global.shift
global.first_after_shift=true
show_debug_message(global.pause)
// постепенное возвращение к сектору при рестаре

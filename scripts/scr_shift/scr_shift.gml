var vec=argument0
var sector=argument1

global.speed_=vec*sign(global.speed_)*0.1
global.shift=abs(sector.rotation_start-90)
global.shift_count=global.shift
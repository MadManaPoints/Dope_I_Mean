extends TileMap

var num = 0.00
var num_add = 0.01


func _process(_delta):
	show_glow()
	
func show_glow():
	modulate.a = num
	num += num_add
	if num > 1.00 or num < 0.00:
		num_add *= -1
	

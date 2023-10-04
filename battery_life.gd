extends TextureProgressBar


func _ready():
	pass

func _process(_delta):
	value = round_two.battery_percent

	if value >= 7:
		if round_two.dark_battery == true:
			tint_progress = Color(0, 0, 0, 1)
		else:
			tint_progress = Color(1, 1, 1, 1)
	elif value == 5:
		tint_progress = Color(1, 1, 0, 1)
	elif value == 3:
		tint_progress = Color(1, 0, 0, 1)
	else:
		get_tree().change_scene_to_file("res://game_over.tscn")

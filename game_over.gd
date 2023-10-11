extends Node2D


var buffer = false


func _process(_delta):
	var timer = get_tree().create_timer(1)
	await timer.timeout
	round_two.battery_percent = 11
	
	if Input.is_action_just_pressed("mouse_left"):
		get_tree().change_scene_to_file("res://title_screen.tscn")

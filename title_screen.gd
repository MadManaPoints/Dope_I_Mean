extends Node2D


func _process(_delta):
	if Input.is_action_just_pressed("mouse_left") and get_global_mouse_position().y > 150:
		get_tree().change_scene_to_file("res://alarm_clock.tscn")


func _on_quit_pressed():
	get_tree().quit()

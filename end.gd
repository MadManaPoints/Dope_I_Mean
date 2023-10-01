extends Node2D


var fin = false


func _process(_delta):
	if fin == true:
		get_tree().quit()


func _on_done_pressed():
	fin = true

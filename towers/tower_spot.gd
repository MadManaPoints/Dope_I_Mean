extends Area2D


func _on_mouse_entered():
	round_two.tower_spot_entered = true


func _on_mouse_exited():
	round_two.tower_spot_entered = false

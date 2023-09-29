extends Node2D


@onready var path = preload("res://towers/td_path.tscn")

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)

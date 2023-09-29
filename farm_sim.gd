extends Node2D

@onready var player := get_tree().get_first_node_in_group("rpg_guy")

func _process(_delta):
	if round_two.black_screen == false:
		$black_screen_two.modulate.a = 0
		$weed.modulate.a = 0
	else:
		$black_screen_two.modulate.a = 1
		$weed.modulate.a = 1


func _on_weed_detection_body_entered(body):
	if body.name == "rpg_guy":
		round_two.gather_zone = true

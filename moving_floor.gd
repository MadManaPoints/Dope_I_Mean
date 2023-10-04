extends Sprite2D


var velocity
@onready var player := get_tree().get_first_node_in_group("cart_player")

func _ready():
	velocity = Vector2(-600, 0)


func _process(delta):
	position += velocity * delta


func _on_area_2d_body_entered(body):
	if body.name == "cart_player":
		round_two.battery_percent -= 2
		round_two.shopping_fail = true
		if round_two.no_snooze == true:
			get_tree().change_scene_to_file("res://catch_game.tscn")

		if round_two.no_snooze == false:
			round_two.dark_battery = false
			if round_two.mental_muscle == true:
				get_tree().change_scene_to_file("res://bumblebee.tscn")
			elif round_two.chip_fail_2 == true:
				get_tree().change_scene_to_file("res://end.tscn")
			else:
				get_tree().change_scene_to_file("res://card_game.tscn")


func _on_end_body_entered(body):
	if body.name == "cart_player":
		if round_two.no_snooze == true:
			get_tree().change_scene_to_file("res://tinder.tscn")

		if round_two.no_snooze == false:
			round_two.dark_battery = false
			if round_two.mental_muscle == true:
				get_tree().change_scene_to_file("res://slot_machine.tscn")
			elif round_two.chip_fail_2 == true:
				get_tree().change_scene_to_file("res://end.tscn")
			else:
				get_tree().change_scene_to_file("res://doctor_visit.tscn")

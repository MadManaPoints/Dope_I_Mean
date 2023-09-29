extends Node2D


@onready var drops_scene = preload("res://coin.tscn")
@onready var spawn : Marker2D = $spawn
@onready var coins = $catch_player
var score_count


func _ready():
	pass


func _process(_delta):
	if coins.score > 9:
		tears()

	if coins.score > 210:
		change_scene()
	elif coins.score < -10:
		change_scene()


func tears():
	var drops = drops_scene.instantiate()
	drops.position = Vector2(randf_range(spawn.position.x, spawn.position.x + 730), spawn.position.y)
	drops.direction = Vector2.DOWN
	add_child(drops)


func _on_timer_timeout():
	tears()

func change_scene():
	if round_two.no_snooze == true:
		if round_two.tinder_match == true:
			get_tree().change_scene_to_file("res://towers/tower_defense.tscn")
		else:
			get_tree().change_scene_to_file("res://slot_machine.tscn")
	elif round_two.no_snooze == false:
		if round_two.mental_muscle == true:
			if round_two.chip_fail == true:
				get_tree().change_scene_to_file("res://shopping_game.tscn")
			else:
				get_tree().change_scene_to_file("res://end.tscn")
		elif round_two.chip_fail_2 == false and round_two.shopping_fail == false:
			get_tree().change_scene_to_file("res://end.tscn")
		else:
			get_tree().change_scene_to_file("res://slot_machine.tscn")

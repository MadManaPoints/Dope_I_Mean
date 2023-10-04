extends Node2D


var convo_one = false
var convo_two = false
var convo_three = false 


var leaving = false
@onready var leave = $Area2D/leave
@onready var button_one = $Area2D/yes
@onready var button_two = $Area2D/no


@onready var cycle_text = $CanvasLayer/rpg_dialogue_box/text
@onready var dialogue_box = $CanvasLayer/rpg_dialogue_box
@onready var bartender = $bartender
@onready var bartender_anim = $bartender/AnimatedSprite2D
@onready var hunter = $hunter
@onready var hunter_anim = $hunter/AnimatedSprite2D
@onready var gravedigger = $gravedigger
@onready var gravedigger_anim = $gravedigger/AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("rpg_guy_2")
@onready var move_player = $rpg_guy_2
var end = false
var end_sentence = false


var show_text = false
var dialogue_index = 0


var hunter_text = false
var hunter_array = ["I never intended it to go down like that.",
					"I had no choice. But I'm sorry. I'm so, so sorry.",
					".............................................................................................................................................................................................................................................................................",
					"..................................................",
					".................................he..................................................................................................................................................................brother-in-arms ....................................................... miss him dearly.",
					".................................stupid son of a ...............",
					"..................flee .............................. grave ................................................................................... leave.",
					"................................................................................................................................................................................. the pub to my left and up the road.",]

var bartender_text = false
var bartender_array = ["My son .......................................... my son .....................................",
						"....................... hard-headded .........................................................",
						"........................................................................................................................................................................................................................................................................................................ now what?",
						".............................................. but I had to close the pub. ........................................ to ...................................................",
						".................................... not until ......................................................................cemetary."]

var gravedigger_text = false
var gravedigger_array = ["Traveler, you're here for information, are you not?",
						"I can help you, but first .........................................................................................................................",
						".......................................................................................................................................................................................................................................................................................",
						"........................",
						".....................!!......................................................................................................................................................................................",
						".... head north .................................... reward ...............................................",]


func _ready():
	leave.hide()
	button_one.hide()
	button_two.hide()
	bartender_anim.play("Front")
	hunter_anim.play("Back")
	gravedigger_anim.play("Front")
	dialogue_box.hide()


func _process(_delta):
	if cycle_text.visible_ratio <= 1:
		end_sentence = true
	else:
		end_sentence = false

	if Input.is_action_just_pressed("mouse_left") and end_sentence == true:
		dialogue_index += 1
		load_dialogue()

	if show_text == true:
		load_dialogue()
	else:
		dialogue_box.hide()
		dialogue_index = 0


	if show_text == true or leaving == true:
		move_player.can_move = false
	else:
		move_player.can_move = true

func load_dialogue():
	cycle_text.visible_ratio= 0
	if hunter_text == true:
		if dialogue_index < hunter_array.size():
			cycle_text.bbcode_text = hunter_array[dialogue_index]
		else:
			convo_one = true
			show_text = false
	elif bartender_text == true:
		if dialogue_index < bartender_array.size():
			cycle_text.bbcode_text = bartender_array[dialogue_index]
		else:
			convo_two = true
			show_text = false
	elif gravedigger_text == true:
		if dialogue_index < gravedigger_array.size():
			cycle_text.bbcode_text = gravedigger_array[dialogue_index]
		else:
			convo_three = true
			show_text = false
	
	dialogue_box.show()
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(cycle_text, "visible_ratio", 1.1, 1)
	await tween.finished


func _on_digger_detection_body_entered(body):
	if body.name == "rpg_guy_2":
		show_text = true
		gravedigger_text = true

func change_scene():
	if convo_one == true and convo_two == true and convo_three == true:
		get_tree().change_scene_to_file("res://potato_chip_game.tscn")
	else:
		round_two.battery_percent -= 2
		get_tree().change_scene_to_file("res://potato_chip_game.tscn")


func _on_bartender_detection_body_entered(body):
	if body.name == "rpg_guy_2":
		show_text = true
		bartender_text = true


func _on_hunter_detection_body_entered(body):
	if body.name == "rpg_guy_2":
		show_text = true
		hunter_text = true
		hunter_anim.play("Front")


func _on_digger_detection_body_exited(body):
	if body.name == "rpg_guy_2":
		show_text = false
		gravedigger_text = false


func _on_bartender_detection_body_exited(body):
	if body.name == "rpg_guy_2":
		show_text = false
		bartender_text = false


func _on_hunter_detection_body_exited(body):
	if body.name == "rpg_guy_2":
		show_text = false
		hunter_text = false


func _on_area_2d_body_entered(body):
	if body.name == "rpg_guy_2":
		leaving = true
		leave.show()
		button_one.show()
		button_two.show()


func _on_yes_pressed():
	change_scene()


func _on_no_pressed():
	leaving = false
	leave.hide()
	button_one.hide()
	button_two.hide()

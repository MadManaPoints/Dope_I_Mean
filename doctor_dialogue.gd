extends Control


#player responses
var yes = "Yes, please."
var no = "Not really."
var thanks = "Thanks!"
var is_that_all = "That's it?"
var seriously = "Seriously?"

var answers = [
	"You already need a refill on your prescription?",
	"Okie dokie. Here you go.",
	"I'll send it to the pharmacy anyway, just in case.",
	"Sure is! See you next time.",
	"Take care."
]

var dialogue_index = 0
var end_sentence = false

var end_dialogue = false

func _ready():
	$yes.hide()
	$no.hide()
	load_dialogue()
	
func _process(_delta):
	$NextBtnPressed.visible = end_sentence
	if $text.visible_ratio == 1.0:
		end_sentence = true
	else:
		end_sentence = false
	load_responses()
	
	if end_dialogue == true:
		end()
	
func load_dialogue():
	$text.bbcode_text = answers[dialogue_index]
	$text.visible_ratio = 0
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($text, "visible_ratio", 1.0, 1.0)
	await tween.finished
	if dialogue_index < 3:
		$yes.show()
		$no.show()

func load_responses():
	if dialogue_index == 0:
		$yes.text = yes
		$no.text = no
	if dialogue_index == 1:
		$yes.text = thanks
		$no.text = is_that_all
	if dialogue_index == 2:
		$yes.text = thanks
		$no.text = seriously

func _on_yes_pressed():
	if dialogue_index == 0:
		dialogue_index += 1
		$yes.hide()
		$no.hide()
		load_dialogue()
	elif dialogue_index == 1:
		dialogue_index += 3
		$yes.hide()
		$no.hide()
		end_dialogue = true
		load_dialogue()
	else:
		dialogue_index = 4
		$yes.hide()
		$no.hide()
		end_dialogue = true
		load_dialogue()


func _on_no_pressed():
	if dialogue_index == 0:
		dialogue_index += 2
		$yes.hide()
		$no.hide()
		load_dialogue()
	elif dialogue_index == 1:
		dialogue_index += 2
		$yes.hide()
		$no.hide()
		end_dialogue = true
		load_dialogue()
	else:
		dialogue_index = 4
		$yes.hide()
		$no.hide()
		end_dialogue = true
		load_dialogue()
		
		
func end():
	if $text.visible_ratio >= 1 and Input.is_action_just_pressed("mouse_left"):
		if round_two.no_snooze == true:
			if round_two.shopping_fail == true:
				get_tree().change_scene_to_file("res://towers/tower_defense.tscn")
			else:
				get_tree().change_scene_to_file("res://potato_chip_game.tscn")
		elif round_two.no_snooze == false:
			if round_two.mental_muscle == true:
				if round_two.chip_fail == true:
					get_tree().change_scene_to_file("res://tinder.tscn")
				else:
					get_tree().change_scene_to_file("res://card_game.tscn")
			else:
				get_tree().change_scene_to_file("res://bumblebee.tscn")


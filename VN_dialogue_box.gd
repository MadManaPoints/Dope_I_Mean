extends Control

var yes = true
var question = false
var branch_a = false
var branch_b = false

var hello = [
	"Hey there ;)",
	"It's time for gym class. Are you coming?"
]

var go_to_gym = [
	"Too bad, loser!"
]

var silly_goose = [
	"Oh, you're so silly ;p"
]

var dialogue_index = 0
var end_sentence = false

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
		

	if Input.is_action_just_pressed("mouse_left") and end_sentence == true:
		load_dialogue()
	
func load_dialogue():
	if branch_a == false:
		if dialogue_index < hello.size():
			$text.bbcode_text = hello[dialogue_index]
			$text.visible_ratio = 0
			var tween = get_tree().create_tween()
			tween.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($text, "visible_ratio", 1.0, 1.0)
		
			if dialogue_index == 1:
				question = true
				await tween.finished
				$yes.show()
				$no.show()
			else:
				question = false
		dialogue_index += 1
	
	
	elif branch_a == true:
		$yes.hide()
		$no.hide()
		if dialogue_index < go_to_gym.size():
			$text.bbcode_text = go_to_gym[dialogue_index]
			$text.visible_ratio = 0
			var tween = get_tree().create_tween()
			tween.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($text, "visible_ratio", 1.0, 1.0)
			
			if dialogue_index == 1:
				question = true
				await tween.finished
				$yes.show()
				$no.show()
			else:
				question = false


		elif Input.is_action_just_pressed("mouse_left") and round_two.no_snooze == true:
				if round_two.tinder_match == true:
					get_tree().change_scene_to_file("res://potato_chip_game.tscn")
				elif round_two.mental_muscle == true:
					get_tree().change_scene_to_file("res://role_playing_game.tscn")
				else:
					get_tree().change_scene_to_file("res://end.tscn")
					
		elif Input.is_action_just_pressed("mouse_left") and round_two.no_snooze == false:
			if round_two.triple_snooze == true:
				get_tree().change_scene_to_file("res://towers/tower_defense.tscn")
			else:
				get_tree().change_scene_to_file("res://typing_game.tscn")


		dialogue_index += 1
			
		
	elif branch_b == true:
		$yes.hide()
		$no.hide()
		if dialogue_index < silly_goose.size():
			$text.bbcode_text = silly_goose[dialogue_index]
			$text.visible_ratio = 0
			var tween = get_tree().create_tween()
			tween.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($text, "visible_ratio", 1.0, 1.0)
		
			if dialogue_index == 1:
				question = true
				await tween.finished
				$yes.show()
				$no.show()
			else:
				question = false
		else:
			queue_free()
		dialogue_index += 1

func _on_yes_pressed():
	dialogue_index = 0
	if branch_a == false:
		branch_a = true
		load_dialogue()
		


func _on_no_pressed():
	dialogue_index = 0
	branch_b = true

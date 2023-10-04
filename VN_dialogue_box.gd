extends Control


var scene = 0
var first_scene = true
var question = false
var forgot = false
var see_you = false
var to_gym = false
var blush = false
var mad = false
var end = false
var take_home = false
var frown = false
var bye = false


var hallway = [
	"Hey there. ;)", #0
	"Are we still on for tonight?", #1
	"Yay! ^_^", #2
	"Meet me on the roof at 9PM.", #3
	"Don't you dare be late!", #4
	"Don't tell me you forgot!", #5
	"Whatever. Let's just get to gym class.", #6
]

var date = [
	"I had so much fun tonight.", #0
	"Sooo...", #1
	"What should we do now?", #2
	"*kiss*", #3
	"!!", #4
	"Th........ I ..........y- you ...... just......", #5
	"O - Oh. OK." #6
]

var gym = [
	"I'm all sweaty.", #0
	"I need to go home and take a bath.", #1
	"See you! ^___^", #2
	"!!", #3
	"You perv!!!", #4
	"I'm just an object to you, aren't I?", #5
	"You still don't have to be a creep.", #6
	"Does teasing me like this make you feel good?", #7
	"Do you play with yourself while you play with me?", #8
	"Pathetic.", #9
	"Have fun with your dumb game." #10
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
	
	if question == true and end_sentence == true:
		$yes.show()
		if see_you == false and to_gym == false:
			$no.show()
	else:
		$yes.hide()
		$no.hide()

	if end_sentence == true and question == false and Input.is_action_just_pressed("mouse_left") and end == false:
		dialogue_index += 1
		load_dialogue()

	
	if end == true and end_sentence == true:
		if Input.is_action_just_pressed("mouse_left"):
			change_scene()


func load_dialogue():	
	if scene == 0:
		$text.bbcode_text = hallway[dialogue_index]
	elif scene == 1:
		$text.bbcode_text = date[dialogue_index] 
	elif scene == 2:
		$text.bbcode_text = gym[dialogue_index]
	
	$text.visible_ratio = 0
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($text, "visible_ratio", 1.0, 1.0)
	await tween.finished


func load_responses():
	if scene == 0:
		if dialogue_index == 1:
			question = true
			$yes.text = "Of course!"
			$no.text = "What's happening?"
		if dialogue_index == 4:
			see_you = true
			question = true
			$yes.text = "I won't."
		if dialogue_index == 6:
			to_gym = true
			question = true
			$yes.text = "Let's go."
	elif scene == 1:
		if dialogue_index == 2:
			question = true
			$yes.text = "Kiss them."
			$no.text = "Take them home."
		if dialogue_index == 5:
			if Input.is_action_just_pressed("mouse_left") and end_sentence == true:
				$TextureRect.hide()
				$text.hide()
				dialogue_index = 5
				var timer = get_tree().create_timer(1)
				await timer.timeout
				blush = true
				end = true
		if take_home == true:
			frown = true
			end = true
	elif scene == 2:
		if dialogue_index == 1:
			question = true
			$yes.text = "Can I join you?"
			$no.text = "OK. See you later!"
		if dialogue_index == 3:
			mad = true
		if dialogue_index == 10:
			end = true
			
			

func _on_yes_pressed():
	if scene == 0:
		if dialogue_index == 1:
			dialogue_index = 2
			question = false
			load_dialogue()


	if scene == 1:
		if dialogue_index == 2:
			dialogue_index = 3
			question = false
			load_dialogue()
	
	if scene == 2:
		if dialogue_index == 1:
			question = false
			dialogue_index = 3
			load_dialogue()


	if see_you == true:
		scene = 1
		question = false
		dialogue_index = 0
		var timer = get_tree().create_timer(1)
		await timer.timeout
		load_dialogue()
		see_you = false
		

	if to_gym == true:
		scene = 2
		question = false
		dialogue_index = 0
		var timer = get_tree().create_timer(1)
		await timer.timeout
		load_dialogue()
		to_gym = false


func _on_no_pressed():
	if scene == 0:
		if dialogue_index == 1:
			dialogue_index = 5
			forgot = true
			question = false
			load_dialogue()

	if scene == 1:
		if dialogue_index == 2:
			dialogue_index = 6
			take_home = true
			question = false
			load_dialogue()

	if scene == 2:
		if dialogue_index == 1:
			dialogue_index = 2
			bye = true
			question = false
			load_dialogue()
			end = true

func change_scene():
		if mad == true:
			round_two.battery_percent -= 2
		if Input.is_action_just_pressed("mouse_left") and round_two.no_snooze == true:
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

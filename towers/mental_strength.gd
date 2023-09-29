extends Label


func _process(_delta):
	if round_two.num_alive > 7:
		self.text = "Mental Strength: STRONG"
	elif round_two.num_alive > 4 and round_two.num_alive < 8 :
		self.text = "Mental Strength: MEDIUM"
	else:
		self.text = "Mental Strength: WEAK"

	change_scene()

func change_scene():
	if round_two.num_alive > 9:
		round_two.mental_muscle = true
		if round_two.no_snooze == false:
			get_tree().change_scene_to_file("res://farm_sim.tscn")
		if round_two.no_snooze == true and round_two.shopping_fail == false:
			if round_two.tinder_match == true:
				get_tree().change_scene_to_file("res://end.tscn")
			else:
				get_tree().change_scene_to_file("res://farm_sim.tscn")
		elif round_two.no_snooze == true and round_two.shopping_fail == true:
			get_tree().change_scene_to_file("res://visual_novel.tscn")
	
	elif round_two.num_alive <= 0:
		if round_two.no_snooze == false:
			get_tree().change_scene_to_file("res://role_playing_game.tscn")
		if round_two.no_snooze == true and round_two.shopping_fail == false:
			if round_two.tinder_match == true:
				get_tree().change_scene_to_file("res://end.tscn")
			else:
				get_tree().change_scene_to_file("res://doctor_visit.tscn")
		elif round_two.no_snooze == true and round_two.shopping_fail == true:
			get_tree().change_scene_to_file("res://farm_sim.tscn")

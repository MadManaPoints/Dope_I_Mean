extends Node2D


var countdown = 5
var final_count = false


func _ready():
	$Timer.start()
	$get_up.hide()
	$dont_get_up.hide()


func _process(_delta):
	clock_timer()
	show_text()


func clock_timer():
	if round_two.second_visit == false:
		$count.set_text(str(countdown))
		$count.get_text()
		if countdown == 0:
			$count.visible_ratio = 0.0 

func show_text():
	if final_count == true or round_two.second_visit == true:
		$text.visible_ratio = 1.0
		$get_up.show()
		$dont_get_up.show()		

func _on_timer_timeout():
	countdown -= 1
	if countdown == 0:
		final_count = true
		$Timer.stop()



func _on_get_up_pressed():
	if round_two.no_snooze == true:
		get_tree().change_scene_to_file("res://bumblebee.tscn")
	else:
		if round_two.triple_snooze == true:
			round_two.battery_percent -= 2
		get_tree().change_scene_to_file("res://visual_novel.tscn")


func _on_dont_get_up_pressed():
	if round_two.double_snooze == true:
		round_two.triple_snooze = true
	elif round_two.no_snooze == false:
		round_two.double_snooze = true
	else:
		round_two.no_snooze = false
	
	get_tree().change_scene_to_file("res://counting_sheep.tscn")

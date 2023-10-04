extends Node2D


@onready var right_button = $right
@onready var left_button = $left
@onready var swipe_right_text = $swipe_right_text
@onready var swipe_left_text = $swipe_left_text

var photo_num = 0
var left = false
var right = false
var can_swipe_right = false
var can_swipe_left = false


func _ready():
	$kenya.hide()
	$naveah.hide()
	$alex.hide()
	$pinki.hide()
	round_two.dark_battery = true


func _process(delta):
	cycle_photos(delta)
	
	
func cycle_photos(delta):
	if photo_num == 0: 
		$danielle.show()
	if photo_num  == 1:
		if left == true:
			$danielle.position.x -= 2000 * delta
		if right == true:
			$danielle.position.x += 2000 * delta
		$kenya.show()
	if photo_num == 2:
		if left == true:
			$kenya.position.x -= 2000 * delta
		if right == true:
			$kenya.position.x += 2000 * delta
		$naveah.show()
	if photo_num == 3:
		if left == true:
			$naveah.position.x -= 2000 * delta
		if right == true:
			$naveah.position.x += 2000 * delta
		$alex.show()
	if photo_num == 4:
		if left == true:
			$alex.position.x -= 2000 * delta
		if right == true:
			$alex.position.x += 2000 * delta
		$pinki.show()
	if photo_num == 5:
		if left == true:
			$pinki.position.x -= 2000 * delta
		if right == true:
			$pinki.position.x += 2000 * delta
		$danielle.hide()
		$kenya.hide()
		$naveah.hide()
		$alex.hide()
		
		if round_two.no_snooze == true:
			$swipe_left_text.text = "I know"
			$swipe_right_text.text = "No, I won't"
		else:
			$swipe_left_text.text = "Probably"
			$swipe_right_text.text = "Maybe"
			
	if can_swipe_left == true:
		if Input.is_action_pressed("mouse_left"):
			left_button.play("clicked")
		
	if Input.is_action_just_released("mouse_left"):
		left_button.play("unclicked")
		
	if can_swipe_right == true:
		if Input.is_action_pressed("mouse_left"):
			right_button.play("clicked")
		
	if Input.is_action_just_released("mouse_left"):
		right_button.play("unclicked")

	if can_swipe_left == true and Input.is_action_just_released("mouse_left"):
		swipe_left()
	
	if can_swipe_right == true and Input.is_action_just_released("mouse_left"):
		swipe_right()
	
func swipe_left():
	right = false
	left = true
	photo_num += 1
	if photo_num > 5:
		round_two.battery_percent -= 2
		round_two.dark_battery = false
		get_tree().change_scene_to_file("res://card_game.tscn")
	

func swipe_right():
	if round_two.no_snooze == true:
		round_two.tinder_match = true
		round_two.dark_battery = false
		get_tree().change_scene_to_file("res://visual_novel.tscn")
	elif photo_num < 5:
		left = false
		right = true
		photo_num += 1
	else:
		round_two.battery_percent -= 2
		round_two.dark_battery = false
		get_tree().change_scene_to_file("res://card_game.tscn")

func _on_swipe_right_detection_mouse_entered():
	can_swipe_right = true


func _on_swipe_right_detection_mouse_exited():
	can_swipe_right = false


func _on_swipe_left_detection_mouse_entered():
	can_swipe_left = true


func _on_swipe_left_detection_mouse_exited():
	can_swipe_left = false

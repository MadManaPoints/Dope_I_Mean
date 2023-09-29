extends Node2D

@onready var score = $score
@onready var arm = $arm
@onready var may = $may
var velocity = Vector2.ZERO
var take_chip = false
var num_left = 25
var start


var clicks_up = Vector2(-80, -400)
var clicks_down = Vector2(80, 400)

var turbo_speed = Vector2(-160, -800)
var turbo_switch = Vector2(-1, -1)

var sub_speed
var sub_speed_reverse = Vector2.ZERO

var turbo_mode = false
var eat = false
var done = false


func _ready():
	may.play("High")
	arm.play("Open")
	arm.position = Vector2(1003, 1465)
	
	if round_two.no_snooze == false and round_two.mental_muscle == false:
		sub_speed = Vector2(.8, 4)
	else:
		sub_speed = Vector2(.4, 2)


func _process(delta):
	score.text = "Chips Left: " + str(num_left)
	arm.position += velocity * delta
	if turbo_mode == false:
		eat_chips()
	else:
		resist_chips()

	if num_left <= 0:
		lose()


func eat_chips():
	if take_chip == false and eat == true:
		velocity = clicks_up
	elif take_chip == true:
		arm.play("Closed")
		velocity = clicks_down
	else:
		velocity = Vector2.ZERO


	if take_chip == true and arm.position.y > 1465:
		num_left -= 1
		take_chip = false
		eat = false
		arm.play("Open")
		may.play("Chew")
		await may.animation_finished
		may.play("High")


	if take_chip == false and Input.is_action_just_pressed("mouse_left"):
		eat = true
	
	if num_left < 21:
		turbo_mode = true

	if Input.is_action_just_pressed("mouse_right"):
		print(arm.position)


func resist_chips():
	if take_chip == false:
		velocity = turbo_speed
		sub_speed_reverse = turbo_speed * turbo_switch
		if Input.is_action_just_pressed("mouse_left") and done == false:
			turbo_speed += sub_speed
	elif take_chip == true:
		arm.play("Closed")
		velocity = sub_speed_reverse
		turbo_speed = sub_speed_reverse * turbo_switch
		if Input.is_action_just_pressed("mouse_left") and done == false:
			sub_speed_reverse -= sub_speed
			
	if velocity.y > -8 and velocity.y < 8:
		done = true
		velocity = Vector2.ZERO
		var timer = get_tree().create_timer(2)
		await timer.timeout
		win()
			

	if take_chip == true and arm.position.y > 1465:
		num_left -= 1
		take_chip = false
		arm.play("Open")
		may.play("Chew")
		await may.animation_finished
		may.play("High")
		

	if Input.is_action_just_pressed("mouse_right"):
		print(arm.position)


func win():
	if round_two.no_snooze == true:
		if round_two.mental_muscle == true and round_two.tinder_match == true:
			get_tree().change_scene_to_file("res://end.tscn")
		elif round_two.shopping_fail == true and round_two.mental_muscle == false:
			get_tree().change_scene_to_file("res://visual_novel.tscn")
		else:
			get_tree().change_scene_to_file("res://farm_sim.tscn")
	elif round_two.no_snooze == false:
		if round_two.mental_muscle == true:
			round_two.make_a_wish = true
			get_tree().change_scene_to_file("res://shopping_game.tscn")
		else:
			get_tree().change_scene_to_file("res://shopping_game.tscn")


func lose():
	if round_two.no_snooze == true:
		if round_two.mental_muscle == true:
			get_tree().change_scene_to_file("res://end.tscn")
		elif round_two.shopping_fail == true and round_two.mental_muscle == false:
			get_tree().change_scene_to_file("res://visual_novel.tscn")
		else:
			get_tree().change_scene_to_file("res://farm_sim.tscn")
	elif round_two.no_snooze == false:
		if round_two.mental_muscle == true:
			round_two.chip_fail = true
			get_tree().change_scene_to_file("res://doctor_visit.tscn")
		else:
			round_two.chip_fail_2 = true
			get_tree().change_scene_to_file("res://bumblebee.tscn")


func _on_grab_area_entered(area):
	if area.name == "hand":
		take_chip = true

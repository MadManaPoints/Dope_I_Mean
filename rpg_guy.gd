extends CharacterBody2D


@onready var anim = $AnimatedSprite2D
@onready var camera = $Camera2D
var speed = 150
var new_position = Vector2(0, 0)
var zoom_in_max = Vector2(3, 3)


func _ready():
	anim.play("Idle")
	new_position = Vector2(position.x, position.y)
	velocity = Vector2(0, 0)
	
	
func _physics_process(_delta):
	if not anim.animation == "Done":
		walking_animations()
		move()
	else:
		round_two.black_screen = true
		var tween = get_tree().create_tween().set_parallel()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(camera, "zoom", zoom_in_max, 4)
		tween.tween_property(camera, "limit_left", -2500, 6)
		tween.tween_property(camera, "limit_right", 2500, 6)
		tween.tween_property(camera, "limit_top", -2500, 6)
		tween.tween_property(camera, "limit_bottom", 2500, 6)
		await tween.finished
		change_scene()
	borders()
	
	
func move():
	if Input.is_action_just_pressed("mouse_left"):
		new_position = get_global_mouse_position()
		
	var target_position = (new_position - self.position).normalized()
	
	if position.distance_to(new_position) > 3:
		velocity = target_position * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO


func borders():
	if position.x < 572:
		position.x = 572
	if position.x > 1350:
		position.x = 1350
	if position.y < 21:
		position.y = 21
	if position.y > 1050:
		position.y = 1050


func walking_animations():
	if round_two.gather_zone == true:
		anim.play("Gather2")
		await anim.animation_finished
		anim.play("Done")
	elif velocity.y < -50:
		anim.play("Walk_Up")
	elif velocity.y > 50:
		anim.play("Walk_Down")
	elif velocity.y > -50 and velocity.y < 50:
		if velocity.x > 0:
			anim.set_flip_h(false)
			anim.play("Walk_Side")
		elif velocity.x < 0:
			anim.set_flip_h(true)
			anim.play("Walk_Side")
		else:
			anim.play("Idle")
	else:
		anim.play("Idle")

func change_scene():
	if round_two.no_snooze == true:
		if round_two.shopping_fail == false:
			if round_two.tinder_match == true:
				get_tree().change_scene_to_file("res://slot_machine.tscn")
			elif round_two.mental_muscle ==  true:
				get_tree().change_scene_to_file("res://role_playing_game.tscn")
			else:
				get_tree().change_scene_to_file("res://end.tscn")
		else:
			get_tree().change_scene_to_file("res://potato_chip_game.tscn")
	else:
		get_tree().change_scene_to_file("res://potato_chip_game.tscn")

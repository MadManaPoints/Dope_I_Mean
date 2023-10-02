extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var speed = 150
var new_position = Vector2(0, 0)
var can_move = true

func _ready():
	anim.play("Idle")
	new_position = Vector2(position.x, position.y)
	velocity = Vector2(0, 0)



func _process(_delta):
	if can_move == true:
		move()
		walking_animations()
	else:
		anim.play("Idle")
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
	if velocity.y < -50:
		anim.play("Walk_Up")
	elif velocity.y > 50:
		anim.play("Walk_Down")
	elif velocity.y > -50 and velocity.y < 50:
		if velocity.x > 0:
			anim.set_flip_h(false)
			anim.play("Walk")
		elif velocity.x < 0:
			anim.set_flip_h(true)
			anim.play("Walk")
		else:
			anim.play("Idle")
	else:
		anim.play("Idle")

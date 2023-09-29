extends CharacterBody2D


var gravity


func _ready():
	velocity = Vector2(0, 0)
	
	if round_two.items_in_cart > 11:
		gravity = Vector2(0, 1700)
	elif round_two.items_in_cart > 8:
		gravity = Vector2(0, 1400)
	elif round_two.items_in_cart > 5:
		gravity = Vector2(0, 1300)
	elif round_two.items_in_cart > 2:
		gravity = Vector2(0, 1200)
	else:
		gravity = Vector2(0, 1100)


func _process(delta):
	position += velocity * delta
	velocity += gravity * delta

	
	if is_on_floor() and Input.is_action_just_pressed("mouse_left"):
		velocity.y -= 500
		
	if velocity.y < 0:
		self.rotation = -0.3
	else:
		self.rotation = 0
	move_and_slide()

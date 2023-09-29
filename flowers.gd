extends CharacterBody2D

var green = false


func _ready():
	pass 


func _process(delta):
	position += velocity * delta
	if Input.is_action_pressed("mouse_left"):
		velocity = Vector2(-15, -50)
		green = true
	else:
		velocity = Vector2.ZERO
		green = false

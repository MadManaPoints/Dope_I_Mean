extends CharacterBody2D


@onready var tap = $tap_controls
@onready var tap_text = $tap_controls/text
var green = false


func _ready():
	tap_text.text = "HOLD"


func _process(delta):
	position += velocity * delta
	if Input.is_action_pressed("mouse_left") and tap.inside == true:
		velocity = Vector2(-15, -50)
		green = true
	else:
		velocity = Vector2.ZERO
		green = false

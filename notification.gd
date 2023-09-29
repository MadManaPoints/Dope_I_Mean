extends Node2D

var start
var velocity = Vector2(0, 200)
var can_click = false
var surprise = false

func _ready():
	start = get_global_position()


func _process(delta):
	if round_two.notification == true:
		position += velocity * delta
		if position.y > 80:
			velocity = Vector2.ZERO
	
	if can_click == true and Input.is_action_just_pressed("mouse_left"):
		surprise = true

func _on_area_2d_mouse_entered():
	can_click = true


func _on_area_2d_mouse_exited():
	can_click = false

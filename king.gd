extends CharacterBody2D


var can_grab = false
var holding = false
var new_spot = false
var up_next = false
@onready var start = get_global_position()

func _ready():
	pass


func _process(_delta):
	controls()
	#grab()


func _on_area_2d_mouse_entered():
	can_grab = true


func _on_area_2d_mouse_exited():
	can_grab = false


func controls():
	if Input.is_action_pressed("mouse_left"):
		holding = true
	if Input.is_action_just_released("mouse_left"):
		holding = false


func grab():
	if can_grab == true and holding == true and up_next == true: 
		position = get_global_mouse_position()
	elif new_spot == false:
		position = start

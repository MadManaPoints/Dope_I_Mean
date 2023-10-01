extends Node2D


@onready var anim = $AnimatedSprite2D
var inside = false
var pressed = false


func _ready():
	anim.play("off")


func _process(_delta):
	if inside == true and pressed == false and Input.is_action_just_pressed("mouse_left"):
		pressed = true
		anim.play("on")
	elif inside == true and pressed == true and Input.is_action_just_pressed("mouse_left"):
		pressed = false
		anim.play("off")

func _on_area_2d_mouse_entered():
	inside = true

func _on_area_2d_mouse_exited():
	inside = false

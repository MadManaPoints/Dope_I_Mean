extends CanvasLayer


@onready var button = $button
var inside = false


func _ready():
	button.play("default")


func _process(_delta):
	if inside == true:
		if Input.is_action_pressed("mouse_left"):
			button.play("clicked")
		if Input.is_action_just_released("mouse_left"):
			button.play("hover")


func _on_detection_mouse_entered():
	inside = true
	button.play("hover")


func _on_detection_mouse_exited():
	inside = false
	button.play("default")

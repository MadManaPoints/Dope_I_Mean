extends CanvasLayer


var inside = false


func _ready():
	pass


func _process(_delta):
	pass


func _on_detection_mouse_entered():
	inside = true


func _on_detection_mouse_exited():
	inside = false

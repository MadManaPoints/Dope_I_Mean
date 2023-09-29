extends Node2D



func _ready():
	pass


func _process(_delta):
	if Input.is_action_just_pressed("mouse_right"):
		delete_children(self)


func delete_children(node: Node) -> void:
	for n in node.get_child_count():
		node.get_child(n).queue_free()

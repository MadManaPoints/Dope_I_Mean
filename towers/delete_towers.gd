extends Node2D



func _ready():
	pass


func _process(_delta):
	if round_two.tower_destroy == true:
		delete_children(self)


func delete_children(node: Node) -> void:
	for n in node.get_child_count():
		node.get_child(n).queue_free()

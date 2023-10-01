extends Sprite2D

var fall = false
var velocity = Vector2(0, 0)
var acceleration = Vector2(0, 2)

func _ready():
	pass # Replace with function body.


func _process(delta):
	cry(delta)
	
func cry(delta):
	visible = false
	scale = Vector2(0, 0)
	if fall == true:
		visible = true
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scale", Vector2(0.071, 0.081), 1)
		await tween.finished
		position += velocity * delta
		velocity += acceleration
		change_scene()
		
		
func change_scene():
	if position.y > 1100:
		get_tree().change_scene_to_file("res://catch_game.tscn")

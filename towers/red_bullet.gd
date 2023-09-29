extends CharacterBody2D

class_name Bullet

var target
var speed = 1000
var path_name = ""
var bullet_damage

func _physics_process(_delta):
	var path_spawner_node = get_tree().get_root().get_node("tower_defense/path_spawner")
	for i in path_spawner_node.get_child_count():
		if path_spawner_node.get_child(i).name == path_name:
			target = path_spawner_node.get_child(i).get_child(0).get_child(0).global_position
	
	velocity = global_position.direction_to(target) * speed
	
	look_at(target)
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if "intrusive_thought" in body.name:
		body.health -= bullet_damage
		queue_free()

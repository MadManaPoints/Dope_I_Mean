extends StaticBody2D


@onready var bullet = preload("res://towers/red_bullet.tscn")
var bullet_damage = 4
var path_name
var current_targets = []
var current


func _process(_delta):
	if is_instance_valid(current):
		self.look_at(current.global_position)
	else:
		for i in $bullet_container.get_child_count():
			$bullet_countainer.get_child(i).queue_free()


func _on_tower_body_entered(body):
	if "intrusive_thought" in body.name:
		var temp_array = []
		current_targets = $tower.get_overlapping_bodies()

		for i in current_targets:
			if "intrusive_thought" in i.name:
				temp_array.append(i)

		var current_target = null

		for i in temp_array:
			if current_target == null:
				current_target = i.get_node("../")
			else:
				if i.get_parent().get_progress() > current_target.get_progress():
					current_target = i.get_node("../")

		current = current_target
		path_name = current_target.get_parent().name
		
		var temp_bullet = bullet.instantiate()
		temp_bullet.path_name = path_name
		temp_bullet.bullet_damage = bullet_damage
		get_node("bullet_container").call_deferred("add_child", temp_bullet)
		temp_bullet.global_position = $aim.global_position


func _on_tower_body_exited(_body):
	current_targets = $tower.get_overlapping_bodies()

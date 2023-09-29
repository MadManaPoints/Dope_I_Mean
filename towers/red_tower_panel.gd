extends Panel

@onready var tower = preload("res://towers/red_tower.tscn")
var current_tile


#checks to see if the mouse is in the panel 
func _on_gui_input(event):
	var temp_tower = tower.instantiate()

	if event is InputEventMouseButton and event.button_mask == 1:
		#left click down
		add_child(temp_tower)
		temp_tower.process_mode = Node.PROCESS_MODE_DISABLED

	elif event is InputEventMouseMotion and event.button_mask == 1:
		#left click down drag
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position 

	elif event is InputEventMouseButton and event.button_mask == 0:
		#left click up
		if round_two.tower_spot_entered == true:
			if get_child_count() > 1:
				get_child(1).queue_free()
				self.hide()

			var path = get_tree().get_root().get_node("tower_defense/towers")
			path.add_child(temp_tower)
			temp_tower.global_position = event.global_position

		else:
			if get_child_count() > 1:
				get_child(1).queue_free()

	else:
		if get_child_count() > 1:
			get_child(1).queue_free()

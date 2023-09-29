extends CharacterBody2D


@export var speed = 200
var health = 10

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		round_two.num_alive += 1
		#print(round_two.num_alive)
		queue_free()

	if health <= 0:
		round_two.num_alive -= 1
		#print(round_two.num_alive)
		get_parent().get_parent().queue_free()

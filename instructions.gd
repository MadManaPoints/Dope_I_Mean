extends Control


var grow = Vector2(.5, .5)

func _ready():
	self.scale = Vector2(0, 0)

func _process(delta):
	scale += grow * delta
	if scale >= Vector2(1, 1):
		scale = Vector2(1, 1)
		var timer = get_tree().create_timer(2)
		await timer.timeout
		queue_free()
	

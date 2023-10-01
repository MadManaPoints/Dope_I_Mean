extends Sprite2D


var velocity

func _ready():
	velocity = Vector2(-600, 0)


func _process(delta):
	position += velocity * delta

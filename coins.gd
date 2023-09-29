extends Node2D

var start
var velocity = Vector2(0, 700)


func _ready():
	start = get_global_position()


func _process(delta):
	fall(delta)


func fall(delta):
	position.y += velocity.y * delta

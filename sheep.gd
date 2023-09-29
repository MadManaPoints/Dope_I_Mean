extends Node2D

class_name Sheep
@export var speed := 400
var velocity := Vector2(0, 0)
var acceleration := Vector2(0, 0)

func _ready():
	pass


func _process(delta):
	position += velocity * speed * delta
	velocity += acceleration

extends CharacterBody2D


var left_boundary = 635
var right_boundary = 1290
var top_boundary = 75
var bottom_boundary = 1005
var score = -5 

func _ready():
	pass 


func _process(_delta):
	position = Vector2(get_global_mouse_position())
	
	#keeps the catcher on the phone screen
	if position.x < left_boundary:
		position.x = left_boundary
	if position.x > right_boundary:
		position.x = right_boundary
	if position.y < top_boundary:
		position.y = top_boundary
	if position.y > bottom_boundary:
		position.y = bottom_boundary



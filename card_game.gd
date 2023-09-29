extends Node2D


@onready var drops_scene = preload("res://coin.tscn")
@onready var six_stop : Marker2D = $new_six
@onready var king_stop : Marker2D = $new_king

var sad = false


func _ready():
	pass


func _process(_delta):
	new_six_pos()
	new_king_pos()
	crying()


func _on_six_move_body_entered(body):
	if body.name == "six":
		var six_pos = $six
		six_pos.new_spot = true


func _on_six_move_body_exited(body):
	if body.name == "six":
		var six_pos = $six
		six_pos.new_spot = false


func new_six_pos():
	var six_pos = $six
	var king_pos = $king
	if six_pos.new_spot == true and six_pos.holding == false:
		six_pos.position = six_stop.position
		six_pos.can_grab = false
		king_pos.up_next = true


func new_king_pos():
	var king_pos = $king
	if king_pos.up_next == true and Input.is_action_pressed("mouse_left") and king_pos.can_grab == true:
		king_pos.position = king_stop.position
		sad = true
		
func crying():
	var tear = $king/tear_drop
	if sad == true:
		tear.fall = true

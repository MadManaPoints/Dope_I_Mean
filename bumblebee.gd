extends Node2D


@onready var rec = $rec
@onready var player = $flowers
@onready var rect = $rect
var red = true
var win = false
var alpha = true
var buffer = false


func _ready():
	$timer_1.start()
	rec.play("Idle")
	var timer = get_tree().create_timer(.5)
	await timer.timeout
	buffer = true
	

func _process(_delta):
	if alpha == false:
		rect.modulate.a -= 0.01
		if rect.modulate.a <= .5:
			rect.modulate.a = .5

	if alpha == true:
		rect.modulate.a += 0.01
		if rect.modulate.a >= 1:
			rect.modulate.a = 1

	if red == true and player.green == true:
		if buffer == true:
			change_scene()
		
func change_scene():
	if round_two.no_snooze == true:
		get_tree().change_scene_to_file("res://typing_game.tscn")

	elif round_two.mental_muscle == true:
		if round_two.chip_fail == true:
			get_tree().change_scene_to_file("res://end.tscn")
		else:
			get_tree().change_scene_to_file("res://doctor_visit.tscn")
	elif round_two.chip_fail_2 == true:
			get_tree().change_scene_to_file("res://card_game.tscn")
	elif round_two.shopping_fail == true:
		get_tree().change_scene_to_file("res://end.tscn")
	else:
		get_tree().change_scene_to_file("res://catch_game.tscn")


func _on_timer_1_timeout():
	rec.play("Record")
	alpha = false
	red = false
	$timer_1.stop()
	$timer_2.wait_time = randf_range(2, 5)
	$timer_2.start()


func _on_timer_2_timeout():
	rec.play("Stop")
	alpha = true
	await rec.animation_finished
	red = true
	rec.play("Idle")
	$timer_2.stop()
	$timer_1.wait_time = randf_range(3, 5)
	$timer_1.start()


func _on_detection_body_entered(body):
	if body.name == "flowers":
		change_scene()

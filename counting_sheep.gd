extends Node2D

@onready var sheep_scene = preload("res://sheep.tscn")
@onready var spawn : Marker2D = $spawn
@onready var right_spawn : Marker2D = $right_spawn
@onready var all_spawn : Marker2D = $spawn_everywhere
@onready var sheep_timer = get_tree().create_timer(0.0)
@onready var new_sheep_timer = get_tree().create_timer(0.0)
@onready var final_sheep_timer = get_tree().create_timer(0.0)

@onready var big_sheep = $big_sheep
@onready var sheep_1 = $r_sheep_1
@onready var sheep_2 = $r_sheep_2
@onready var sheep_3 = $r_sheep_3


var score = 0 
var sheep_num = 0
var seconds = 3.0
var new_seconds = 1
var final_seconds = 1


func _ready():
	sheep_1.hide()
	sheep_2.hide()
	sheep_3.hide()


func _process(delta):
	wake_up()
	score_tally()
	
	if round_two.triple_snooze == true:
		third_time()
	elif round_two.double_snooze == true:
		second_time(delta)
	else:
		first_time()
	
func third_time():
	sheep_1.show()
	sheep_2.show()
	sheep_3.show()
	
	sheep_1.rotation += 0.02
	sheep_2.rotation += 0.01
	sheep_3.rotation -= 0.01
	
	var timer = get_tree().create_timer(3)
	await timer.timeout
	get_tree().change_scene_to_file("res://alarm_clock.tscn")
	
func second_time(delta):
	big_sheep.position.x += 200 * delta
	
	if big_sheep.position.x > 1800:
		get_tree().change_scene_to_file("res://alarm_clock.tscn")

func first_time():
	if sheep_timer.time_left <= 0:
		counting_sheep()
		sheep_num += 1
		sheep_timer = get_tree().create_timer(seconds)
		
	if sheep_num > 10:
		if new_sheep_timer.time_left <= 0:
			counting_new_sheep()
			round_two.second_visit = true
			sheep_num += 1
			new_sheep_timer = get_tree().create_timer(new_seconds)
			
	if sheep_num > 25:
		final_seconds -= 0.002
		if final_seconds < 0.01:
			final_seconds = 0.01
		if final_sheep_timer.time_left <= 0:
			counting_all_sheep()
			sheep_num += 1
			final_sheep_timer = get_tree().create_timer(final_seconds)

func score_tally():
	$score_total.set_text("Sheep: " + str(score))
	$score_total.get_text()
	
	if Input.is_action_just_pressed("mouse_left"):
		score += 1
	if Input.is_action_just_pressed("mouse_right"):
		score -= 1
	if score < 0:
		score = 0


func counting_sheep():
	var sheep = sheep_scene.instantiate()
	sheep.position = spawn.position
	sheep.velocity = Vector2(1, -1)
	
	if sheep.position.y < 1000:
		sheep.acceleration = Vector2(0, 0.007)
	elif sheep.position.y > 1200:
		queue_free()
	add_child(sheep)
	
	if sheep_num > 2 and sheep_num < 5: 
		sheep.speed = 800
	if sheep_num > 4:
		sheep.speed = 1000
		seconds = .5
	
func counting_new_sheep():
	var more_sheep = sheep_scene.instantiate()
	more_sheep.position = right_spawn.position
	more_sheep.velocity = Vector2(-1, -2)
		
	if more_sheep.position.y < 1000:
		more_sheep.acceleration = Vector2(0, 0.03)
	elif more_sheep.position.y > 1200:
		queue_free()
	add_child(more_sheep)
	
func counting_all_sheep():
	var all_sheep = sheep_scene.instantiate()
	all_sheep.position = Vector2(randf_range(all_spawn.position.x, all_spawn.position.x + 750),
	randf_range(all_spawn.position.y, all_spawn.position.y + 1000))
	add_child(all_sheep)

func wake_up():
	if sheep_num > 250:
		get_tree().change_scene_to_file("res://alarm_clock.tscn")

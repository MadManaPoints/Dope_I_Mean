extends Sprite2D


var can_score = false
@onready var total = $score_total
@onready var overlay = $overlay
var score = 0
var not_working = true


func _ready():
	overlay.modulate.a = .2


func _process(_delta):
	$score_total.set_text("Score: " + str(score))
	$score_total.get_text()
	#print($hour.rotation)
	
	if $hour.rotation > 2.7:
		can_score = true
		
	if score > 300:
		if round_two.no_snooze == true:
			get_tree().change_scene_to_file("res://shopping_game.tscn")
		else:
			get_tree().change_scene_to_file("res://towers/tower_defense.tscn")


func _input(event):
	if event is InputEventKey:
		if event.pressed:
			$hour.rotation += 0.01
			$minute.rotation += 0.12

		if can_score == true:
			score += 1

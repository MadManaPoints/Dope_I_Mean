extends Area2D

class_name Drop
var start
@export var speed := 800
var direction := Vector2.ZERO
@onready var player := get_tree().get_first_node_in_group("catch_player")
@onready var catcher = $"../catch_player"
var win = false


func _ready():
	start = get_global_position()
	#$CollisionShape2D/coin_anim.play("spin")


func _process(delta):
	fall(delta)
	tears_to_gold()
	score_decrease()
	
	#player score won't drop during coin freefall
	if catcher.score > 9:
		win = true


func fall(delta):
	position += direction * speed * delta
	if catcher.score > 4 and catcher.score < 10:
		speed = 1400


func _on_body_entered(body):
	if body.name == "catch_player":
		catcher.score += 1
		queue_free()
		
func score_decrease():
	if position.y > 1080 and win == false:
		catcher.score -= 1
		queue_free()
		
func tears_to_gold():
	if catcher.score < 0:
		$CollisionShape2D/coin_anim.hide()
		$CollisionShape2D/tear_anim.play("tear")
	elif catcher.score < 10:
		$CollisionShape2D/tear_anim.hide()
		$CollisionShape2D/coin_anim.play("spin")
	else:
		$CollisionShape2D/tear_anim.hide()
		$CollisionShape2D/coin_anim.play("Idle")
	

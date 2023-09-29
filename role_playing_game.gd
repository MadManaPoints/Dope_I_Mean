extends Node2D


@onready var cycle_text = $CanvasLayer/rpg_dialogue_box/text
@onready var dialogue_box = $CanvasLayer/rpg_dialogue_box
@onready var bartender = $bartender
@onready var bartender_anim = $bartender/AnimatedSprite2D
@onready var hunter = $hunter
@onready var hunter_anim = $hunter/AnimatedSprite2D
@onready var gravedigger = $gravedigger
@onready var gravedigger_anim = $gravedigger/AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("rpg_guy_2")

var show_text = false
var dialogue_index = 0
var text_array = ["I'm the hunter!", "I'm the bartender!", "I'm the gravedigger!"]

func _ready():
	bartender_anim.play("Front")
	hunter_anim.play("Back")
	gravedigger_anim.play("Front")
	dialogue_box.hide()


func _process(_delta):
	if show_text == true:
		load_dialogue()
	else:
		dialogue_box.hide()
		

func load_dialogue():
	dialogue_box.show()
	cycle_text.bbcode_text = text_array[dialogue_index]
	cycle_text.visible_ratio = 0
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(cycle_text, "visible_ratio", 1.1, 1.0)


func _on_digger_detection_body_entered(body):
	if body.name == "rpg_guy_2":
		show_text = true
		dialogue_index = 2
		var timer = get_tree().create_timer(2)
		await timer.timeout
		change_scene()

func change_scene():
	get_tree().change_scene_to_file("res://potato_chip_game.tscn")


func _on_bartender_detection_body_entered(body):
	if body.name == "rpg_guy_2":
		show_text = true
		dialogue_index = 1


func _on_hunter_detection_body_entered(body):
	if body.name == "rpg_guy_2":
		show_text = true
		dialogue_index = 0


func _on_digger_detection_body_exited(body):
	if body.name == "rpg_guy_2":
		show_text = false


func _on_bartender_detection_body_exited(body):
	if body.name == "rpg_guy_2":
		show_text = false


func _on_hunter_detection_body_exited(body):
	if body.name == "rpg_guy_2":
		show_text = false

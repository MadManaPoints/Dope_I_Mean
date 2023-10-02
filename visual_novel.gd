extends Node2D


@onready var hallway = $hallway
@onready var gym = $gym
@onready var roof = $roof
@onready var aiko = $aiko
@onready var dialogue = $Control/dialogue_box
@onready var fade = $fade
var switch = false

func _ready():
	gym.hide()
	roof.hide()
	aiko.play("full")


func _process(_delta):
	if dialogue.blush == true:
		aiko.play("blush")
	elif dialogue.frown == true:
		aiko.play("frown")
	elif dialogue.bye == true:
		aiko.play("bye")
	elif dialogue.mad == true:
		aiko.play("shout")
	elif dialogue.forgot == true:
		aiko.play("whatever")


	if dialogue.scene == 1 and switch == false:
		fade_out()
	
	if dialogue.scene == 2 and switch == false:
		fade_out()
		
	if dialogue.scene == 2 and switch == true:
		fade_in()
	
	if dialogue.scene == 1 and switch == true:
		fade_in()


func fade_out():
	fade.modulate.a += 0.01
	if fade.modulate.a >= 1:
		fade.modulate.a = 1
		if dialogue.scene == 1:
			roof.show()
			aiko.play("formal")
			switch = true
		else:
			dialogue.forgot = false
			roof.hide()
			gym.show()
			aiko.play("gym")
			switch = true


func fade_in():
	fade.modulate.a -= 0.005
	if fade.modulate.a <= 0:
		fade.modulate.a = 0
		

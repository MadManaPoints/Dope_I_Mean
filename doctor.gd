extends Control



func _ready():
	pass


func _physics_process(_delta):
	DialogueManager.show_example_dialogue_balloon(load("res://doctor_dialogue.dialogue"), "doctor")

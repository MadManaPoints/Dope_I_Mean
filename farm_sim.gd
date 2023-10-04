extends Node2D

@onready var player := get_tree().get_first_node_in_group("rpg_guy")
@onready var start_text = $instructions/text
@onready var show_battery = $battery_group/battery
@onready var show_bars = $battery_group/service_bar
@onready var five_g = $battery_group/five_g

func _ready():
	start_text.text = "Pull out the weed!"

func _process(_delta):
	if round_two.black_screen == false:
		$black_screen_two.modulate.a = 0
		$weed.modulate.a = 0
	else:
		show_battery.hide()
		show_bars.hide()
		five_g.hide()
		
		$black_screen_two.modulate.a = 1
		$weed.modulate.a = 1


func _on_weed_detection_body_entered(body):
	if body.name == "rpg_guy":
		round_two.gather_zone = true

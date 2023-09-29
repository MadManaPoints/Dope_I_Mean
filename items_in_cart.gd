extends CanvasLayer


var weight_text = ["Light", "Medium", "Heavy", "Very Heavy", "Too Heavy"]
var dialogue_index = 0


func _ready():
	if round_two.items_in_cart > 11:
		dialogue_index = 4
	elif round_two.items_in_cart > 8:
		dialogue_index = 3
	elif round_two.items_in_cart > 5:
		dialogue_index = 2
	elif round_two.items_in_cart > 2:
		dialogue_index = 1
	else:
		dialogue_index = 0

func _process(_delta):
	$items_in_cart.text = "Items in Cart: " + str(round_two.items_in_cart)
	$weight.text = "Weight: " + str(weight_text[dialogue_index])

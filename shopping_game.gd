extends Node2D


var up = false
var mid = true
var down = false
var top = false
var bottom = false  

var start
var item_num = 0

var press_1 = false
var press_2 = false
var press_3 = false
var press_4 = false
var press_5 = false
var press_6 = false
var press_7 = false
var press_8 = false
var press_9 = false
var press_10 = false
var press_11 = false
var press_12 = false


func _ready():
	start = get_global_position()


func _process(_delta):
	if round_two.make_a_wish == true:
		$Button.text = "Wishlist"
		add_or_delete_item()
	$items.text = str(round_two.items_in_cart)
	cart()
	scroll()
	if Input.is_action_just_pressed("mouse_right"):
		print(round_two.items)
	
func cart():	
	if round_two.items_in_cart > 0:
		round_two.first_item = true
	else:
		round_two.first_item = false
	
	if round_two.first_item == false:
		$cart_num.visible = 0
		$items.visible = 0
	else:
		$cart_num.visible = 1
		$items.visible = 1

func scroll():
	if top == true and Input.is_action_just_pressed("mouse_left"):
		if $white_phone_screen.position.y == -260:
			$white_phone_screen.position.y = 820
		else:
			$white_phone_screen.position.y = 1900
	if bottom == true and Input.is_action_just_pressed("mouse_left"):
		if $white_phone_screen.position.y == 1900:
			$white_phone_screen.position.y = 820
		else:
			$white_phone_screen.position.y = -260

func _on_top_mouse_entered():
	top = true


func _on_top_mouse_exited():
	top = false


func _on_bottom_mouse_entered():
	bottom = true


func _on_bottom_mouse_exited():
	bottom = false


func _on_button_pressed():
	if round_two.make_a_wish == true and item_num > 0:
		get_tree().change_scene_to_file("res://wishing_game.tscn")
	if round_two.make_a_wish == false:
		get_tree().change_scene_to_file("res://cart_game.tscn")


func add_or_delete_item():
	if press_1 == true and round_two.item_1 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_1 = true
	elif press_1 == true and round_two.item_1 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_1 = false

	if press_2 == true and round_two.item_2 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_2 = true
	elif press_2 == true and round_two.item_2 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_2 = false

	if press_3 == true and round_two.item_3 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_3 = true
	elif press_3 == true and round_two.item_3 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_3 = false

	if press_4 == true and round_two.item_4 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_4 = true
	elif press_4 == true and round_two.item_4 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_4 = false

	if press_5 == true and round_two.item_5 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_5 = true
	elif press_5 == true and round_two.item_5 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_5 = false
	
	if press_6 == true and round_two.item_6 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_6 = true
	elif press_6 == true and round_two.item_6 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_6 = false
	
	if press_7 == true and round_two.item_7 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_7 = true
	elif press_7 == true and round_two.item_7 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_7 = false
	
	if press_8 == true and round_two.item_8 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_8 = true
	elif press_8 == true and round_two.item_8 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_8 = false
	
	if press_9 == true and round_two.item_9 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_9 = true
	elif press_9 == true and round_two.item_9 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_9 = false
	
	if press_10 == true and round_two.item_10 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_10 = true
	elif press_10 == true and round_two.item_10 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_10 = false
	
	if press_11 == true and round_two.item_11 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_11 = true
	elif press_11 == true and round_two.item_11 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_11 = false
	
	if press_12 == true and round_two.item_12 == false and Input.is_action_just_pressed("mouse_left"):
		item_num += 1
		round_two.item_12 = true
	elif press_12 == true and round_two.item_12 == true and Input.is_action_just_pressed("mouse_left"):
		item_num -= 1
		round_two.item_12 = false


func _on_item_1_mouse_entered():
	press_1 = true


func _on_item_1_mouse_exited():
	press_1 = false


func _on_item_2_mouse_entered():
	press_2 = true


func _on_item_2_mouse_exited():
	press_2 = false


func _on_item_3_mouse_entered():
	press_3 = true


func _on_item_3_mouse_exited():
	press_3 = false


func _on_item_4_mouse_entered():
	press_4 = true


func _on_item_4_mouse_exited():
	press_4 = false


func _on_item_5_mouse_entered():
	press_5 = true


func _on_item_5_mouse_exited():
	press_5 = false 


func _on_item_6_mouse_entered():
	press_6 = true


func _on_item_6_mouse_exited():
	press_6 = false


func _on_item_7_mouse_entered():
	press_7 = true


func _on_item_7_mouse_exited():
	press_7 = false


func _on_item_8_mouse_entered():
	press_8 = true


func _on_item_8_mouse_exited():
	press_8 = false


func _on_item_9_mouse_entered():
	press_9 = true


func _on_item_9_mouse_exited():
	press_9 = false


func _on_item_10_mouse_entered():
	press_10 = true


func _on_item_10_mouse_exited():
	press_10 = false


func _on_item_11_mouse_entered():
	press_11 = true


func _on_item_11_mouse_exited():
	press_11 = false


func _on_item_12_mouse_entered():
	press_12 = true


func _on_item_12_mouse_exited():
	press_12 = false

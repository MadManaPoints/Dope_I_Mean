extends AnimatedSprite2D


var skull = false
var coin = false
var toilet = false

var skull_end = false 
var coin_end = false
var toilet_end = false 

var lever = false

@onready var outfits = $outfit_background
@onready var outfit_anim = $outfit_background/outfits
@onready var chest = $chest
@onready var coins = $coins
@onready var skin = $outfit_background/skin
var coins_left = 210
var new_amount = coins_left - 30
var subtract = false
var can_click = true
var outfit_reveal = false
var prize = false
var new_outfit = false


func _ready():
	play("Start")
	chest.play("Idle")
	chest.hide()
	outfits.hide()
	skin.visible_ratio = 0

func _process(_delta):
	skin.text = "New Skin Unlocked! "
	coins.text = str(coins_left)
	if Input.is_action_just_pressed("mouse_left") and coins_left > 0 and can_click == true and lever == true:
		can_click = false
		subtract = true
		skull = false
		coin = false 
		toilet = false 
		outfit_reveal = false
		if skull_end == false and coin_end == false and toilet_end == false:
			play("Start_Down")
		elif skull_end == true:
			play("Skull_Down")
		elif coin_end == true:
			play("Coin_Down")
		elif toilet_end == true:
			play("Toilet_Down")
		await animation_finished
		skull_end = false
		coin_end = false
		toilet_end = false
		play("Pull")
		var timer = get_tree().create_timer(randi_range(3, 5))
		await timer.timeout
		var winner = randi_range(1, 12)
		if winner == 12:
			skull = true
		elif winner < 12 and winner > 7:
			coin = true
		elif winner <= 7:
			toilet = true
		
		if skull == true: 
			play("Skull")
			await animation_finished
			play("Skull_2")
			skull_end = true
		elif coin == true:
			play("Coin")
			coin_end = true
			prize = true
		elif toilet == true:
			play("Toilet")
			await animation_finished
			toilet_end = true
			can_click = true

	if subtract == true:
		subtract_coins()


	if toilet_end == true and coins_left <= 0:
		if Input.is_action_just_pressed("mouse_left"):
			change_scene()
	else:
		win()
		show_outfit()
		lose()


	if new_outfit == false:
		if skin.visible_ratio == 1:
			skin.visible_ratio = 0


func subtract_coins():
	if coins_left > new_amount:
		coins_left -= 1
	else:
		coins_left = new_amount
		subtract = false
		if coins_left == new_amount:
			new_amount = coins_left - 30
			
func lose():
	if skull_end == true:
		can_click = false
		var timer = get_tree().create_timer(3)
		await timer.timeout
		change_scene()
		
func win():		
	if prize == true:	
		chest.show()
		var timer = get_tree().create_timer(1)
		await timer.timeout
		chest.play("Win")
		await chest.animation_finished
		chest.stop()
		chest.hide()
		prize = false
		outfit_reveal = true


func change_scene():
	if skull_end == true:
		round_two.battery_percent -= 2
	if round_two.no_snooze == true:
		if round_two.shopping_fail == true:
			get_tree().change_scene_to_file("res://doctor_visit.tscn")
		elif round_two.tinder_match == true:
			get_tree().change_scene_to_file("res://catch_game.tscn")
		else:
			get_tree().change_scene_to_file("res://towers/tower_defense.tscn")
	elif round_two.no_snooze == false:
		if round_two.mental_muscle == true:
			if round_two.chip_fail == true:
				get_tree().change_scene_to_file("res://end.tscn")
			else:
				get_tree().change_scene_to_file("res://bumblebee.tscn")
		elif round_two.chip_fail_2 == true:
			get_tree().change_scene_to_file("res://shopping_game.tscn")
		else:
			get_tree().change_scene_to_file("res://bumblebee.tscn")
			
			
			


func show_outfit():
	if outfit_reveal == true:
		outfits.show()
		new_outfit = true
		outfit_anim.stop()
		var tween = get_tree().create_tween()
		tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
		tween.tween_property(skin, "visible_ratio", 1.0, 0.5)
		var timer = get_tree().create_timer(4)
		await timer.timeout
		select_outfit()
		outfits.hide()
		new_outfit = false
		if coins_left <= 0:
			change_scene()

func select_outfit():
	if new_outfit == true:
		var winner = randi_range(1, 11)
		if winner == 11:
			outfit_anim.play("Outfit_11")
		elif winner == 10:
			outfit_anim.play("Outfit_10")
		elif winner == 9:
			outfit_anim.play("Outfit_9")
		elif winner == 8:
			outfit_anim.play("Outfit_8")
		elif winner == 7:
			outfit_anim.play("Outfit_7")
		elif winner == 6:
			outfit_anim.play("Outfit_6")
		elif winner == 5:
			outfit_anim.play("Outfit_5")
		elif winner == 4:
			outfit_anim.play("Outfit_4")
		elif winner == 3:
			outfit_anim.play("Outfit_3")
		elif winner == 2:
			outfit_anim.play("Outfit_2")
		elif winner == 1:
			outfit_anim.play("Outfit_1")
		await outfit_anim.animation
		can_click = true


func _on_area_2d_mouse_entered():
	lever = true


func _on_area_2d_mouse_exited():
	lever = false

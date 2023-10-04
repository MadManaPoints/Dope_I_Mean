extends Node2D


var headphones = load("res://assets/shopping/thumbnails/headphones.png")
var sex_toy = load("res://assets/shopping/thumbnails/sex_toy.png")
var crystal = load("res://assets/shopping/thumbnails/crystal.png")
var plant = load("res://assets/shopping/thumbnails/plant.png")
var controller = load("res://assets/shopping/thumbnails/controller.png")
var purse = load("res://assets/shopping/thumbnails/purse.png")
var camera = load("res://assets/shopping/thumbnails/camera.png")
var cbd = load("res://assets/shopping/thumbnails/cbd.png")
var tv = load("res://assets/shopping/thumbnails/tv.png")
var pineapple = load("res://assets/shopping/thumbnails/pineapple.png")
var astrology = load("res://assets/shopping/thumbnails/astrology.png")
var giftcard = load("res://assets/shopping/thumbnails/giftcard.png")

var flipped = false 
var speed = 200
var velocity = Vector2(125, -500)
var acceleration = Vector2(0, 600)
var decrease_size = Vector2(0.33, 0.33)
var new_coin = Vector2(0, 0)
@onready var anim = $coin
@onready var surprise_item = $notification_ui
@onready var button = $button

var item
var items = []


func _ready():
	round_two.wish_time = true
	anim.play("idle")
	if round_two.item_1 == true:
		items.insert(items.size(), headphones)
	if round_two.item_2 == true:
		items.insert(items.size(), sex_toy)
	if round_two.item_3 == true:
		items.insert(items.size(), crystal)
	if round_two.item_4 == true:
		items.insert(items.size(), plant)
	if round_two.item_5 == true:
		items.insert(items.size(), controller)
	if round_two.item_6 == true:
		items.insert(items.size(), purse)
	if round_two.item_7 == true:
		items.insert(items.size(), camera)
	if round_two.item_8 == true:
		items.insert(items.size(), cbd)
	if round_two.item_9 == true:
		items.insert(items.size(), tv)
	if round_two.item_10 == true:
		items.insert(items.size(), pineapple)
	if round_two.item_11 == true:
		items.insert(items.size(), astrology)
	if round_two.item_12 == true:
		items.insert(items.size(), giftcard)
	#loading images
	item = items[randi() % items.size()]


func _process(delta):
	flipped = true
	anim.play("flip")

	if flipped == true:
		$coin.position += velocity * delta
		velocity += acceleration * delta
		$coin.scale -= decrease_size * delta
		if $coin.scale <= new_coin:
			$coin.scale = new_coin
			velocity = Vector2.ZERO
			acceleration = Vector2.ZERO
			round_two.notification = true
		if surprise_item.surprise == true:
			surprise_item.hide()
			$wish.set_texture(item)
			$wish.get_texture()
			if Input.is_action_just_pressed("mouse_left"):
				round_two.dark_battery = false
				get_tree().change_scene_to_file("res://slot_machine.tscn")


func _on_button_pressed():
	button.hide()
	flipped = true

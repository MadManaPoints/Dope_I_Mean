extends AnimatedSprite2D


var inside = false
var pressed = false


func _ready():
	play("Unclicked")
	if round_two.make_a_wish == true:
		$buy.text =  "Add to Wishlist"
	else:	
		$buy.text = "Add to Cart"


func _process(_delta):
	if inside == true and pressed == false and Input.is_action_just_pressed("mouse_left"):
		pressed = true
		play("Clicked")
		round_two.items_in_cart += 1 
		if round_two.make_a_wish == true:
			$buy.text = "Wishlisted"
		else:
			$buy.text = "In Cart"
	elif inside == true and pressed == true and Input.is_action_just_pressed("mouse_left"):
		pressed = false
		play("Unclicked")
		round_two.items_in_cart -= 1 
		if round_two.make_a_wish == true:
			$buy.text = "Add to Wishlist"
		else:
			$buy.text = "Add to Cart"


func _on_area_2d_mouse_entered():
	inside = true


func _on_area_2d_mouse_exited():
	inside = false

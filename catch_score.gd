extends Label


@onready var player = $"../catch_player"


func _process(_delta):
	text = "Score: " + str(player.score)

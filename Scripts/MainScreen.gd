extends Node2D

func _ready():
	var score = get_node("PlayerData").load_data(null, "user://score.dat")
	print(score)
	$HighScore.set_text("High Score: " + str(score))


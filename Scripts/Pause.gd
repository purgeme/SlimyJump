extends Node2D

var pause = true

func _process(delta: float) -> void:
	if Input.is_action_just_released("pause"):
		pausing()

func pausing():
	#pause = not pause
	get_parent().get_node("PlayerData").save_data({"name":"Hello"}, "user://save_temp.dat")
	get_tree().paused = pause
	get_node(".").set_visible(pause)

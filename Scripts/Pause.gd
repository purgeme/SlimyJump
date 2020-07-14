extends Node2D

var pause = true

func _process(delta: float) -> void:
	if Input.is_action_just_released("pause"):
		pausing()

func pausing():
	#pause = not pause
	get_tree().paused = pause
	get_node(".").set_visible(pause)

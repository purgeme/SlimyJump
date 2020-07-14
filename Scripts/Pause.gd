extends Node2D

var pause = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		pausing()

func pausing():
	pause = not pause
	get_tree().paused = pause
	visible = pause

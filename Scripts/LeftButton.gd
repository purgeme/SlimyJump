extends Node2D

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.action_press("left")
	else:
		Input.action_release("left")

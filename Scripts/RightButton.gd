extends Node2D

func _unhandled_input(event):
	if event is InputEventMouseButton:
		print_debug("right")
		get_node("/root/Level/Player").g_right()

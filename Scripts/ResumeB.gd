extends Control



func _on_Button_pressed() -> void:
	#get_tree().change_scene("res://Scenes/Level.tscn")
	get_tree().paused = false
	get_node("../../../.").set_visible(false)

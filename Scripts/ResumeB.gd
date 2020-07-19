extends Control


func _on_Button_pressed() -> void:
	#get_tree().change_scene("res://Scenes/Level.tscn")
	var dt = get_parent().get_parent().get_parent().get_parent().get_node("PlayerData").load_data(null, "user://save_temp.dat")
	print(dt)
	get_tree().paused = false
	get_node("../../../.").set_visible(false)

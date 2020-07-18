extends Control

var play = false

func _on_Button_pressed():
	get_parent().get_parent().get_parent().get_node("Select").play()
	play = true



func _on_Select_finished() -> void:
	if play:
		get_tree().change_scene("res://Scenes/Level.tscn")

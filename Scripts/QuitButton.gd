extends Control

var quit = false

func _on_Button_pressed():
	get_parent().get_parent().get_parent().get_node("Select").play()
	quit = true


func _on_Select_finished() -> void:
	if quit:
		get_tree().quit()

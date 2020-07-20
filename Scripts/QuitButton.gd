extends Control

var quit = false

func _on_Button_pressed():
	get_tree().quit()

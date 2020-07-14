extends Node2D

var dirt_block = preload("res://Scenes/Dirt.tscn")
onready var spawned = get_node("/root/Level/CanvasLayer/DirtBlocks")


func _spawn():
	var x = dirt_block.instance()
	add_child_below_node(spawned, x)

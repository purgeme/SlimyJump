extends Node2D

var dirt_block1 = preload("res://Scenes/Dirt1.tscn")
var dirt_block2 = preload("res://Scenes/Dirt2.tscn")
onready var spawned = get_node("/root/Level/CanvasLayer/DirtBlocks")
var random = RandomNumberGenerator.new()

func _spawn():
	var r = random.randi_range(0,3)
	var x = dirt_block1.instance()
	if r==1:
		x = dirt_block1.instance()
	elif r==2:
		x = dirt_block2.instance()
	add_child_below_node(spawned, x)

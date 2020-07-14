extends StaticBody2D

var stop = false
var ground_found
onready var remove_timer = get_node("/root/Level/RemoveBlocks")

func _ready():
	remove_timer.connect("timeout", self, "del_this")

func _physics_process(delta):
	overflow_check()
	stop = $RayCast2D.is_colliding()
	if !stop:
		translate(Vector2(0, 10))
	ground_found = $GroundDetector.is_colliding()

func del_this():
	if ground_found:
		print_debug("foundGround")
		remove_timer.start(7)
		queue_free()

func overflow_check():
	if $RayCast2D.is_colliding() and $RayCast2D2.is_colliding():
		queue_free()

extends Node2D

var spawning = false
var random_number = 0
var random = RandomNumberGenerator.new()
export var score = 0

var pause = false

func _ready(): 
	$RemoveBlocks.start(2) 
	random.randomize()
	$SummonTimer.get_physics_process_delta_time()

func spawner_function(t):
	var x = sqrt(abs((t - 1)/4))
	return x

func spawn_location(current_pos):
	var y = random.randi_range(-65, 65)
	var x = spawner_function(y) + 3
	if y<0 : 
		x = (7 - x)
	var spawn_pos = int(x)
	return spawn_pos

func _on_SummonTimer_timeout():
	# random_number = random.randi_range(1, 7)
	# random_number = spawn_location(get_node("/root/Level/Player"))
	random_number = spawn_location(540)
	if random_number in [0, 1, 2, 3, 4, 5, 6]:
		get_node("SummonBlocks/SummonBlock" + str(random_number))._spawn()

# show fps
func _process(delta):
	var fps = Engine.get_frames_per_second()
	$FPS_meter/RichTextLabel.set_text(str(fps))
	if Input.is_action_just_pressed("quit") :
		get_tree().quit()

func _on_RemoveBlocks_timeout():
	pass

func _on_Timer_timeout() -> void:
	score += 1
	$ScoreCounter/RichTextLabel.set_text('Score : '+str(score))



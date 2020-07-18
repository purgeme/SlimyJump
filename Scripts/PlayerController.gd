extends KinematicBody2D

const MAX_SPEED = 700
const GRAVITY = 20
const JUMPING_SPEED = 800

var velocityx = 0
var velocityy = 0
var angle = 0
var on_ground = true

onready var emitter = get_node("CollisionShape2D/Sprite/CPUParticles2D")

var jumping = false

signal player_is_dead

func get_input(): # Implement Input
	velocityx = 0
	jumping = false
	if Input.is_action_pressed("right"):
		velocityx = 1
	if Input.is_action_pressed("left"):
		velocityx = -1
	if Input.is_action_pressed("jump"):
		jumping = true

func playdead():
	get_tree().change_scene("res://MainScreen.tscn")

func _process(delta):
	if $RayCast2D.is_colliding() and $RayCast2D2.is_colliding():
		emit_signal("player_is_dead")
		playdead()
	elif $RayCast2D3.is_colliding() and $RayCast2D4.is_colliding():
		emit_signal("player_is_dead")
		playdead()
	elif $RayCast2D5.is_colliding() and $RayCast2D6.is_colliding():
		emit_signal("player_is_dead")
		playdead()


func _physics_process(delta):
	# velocityx = 0
	get_input()
	# Implement Gravity
	if !self.is_on_floor():
		if velocityy < 0 :
			velocityy += GRAVITY
		else :
			velocityy += GRAVITY * 3
	else :
		velocityy = 0
		on_ground = true
	# Implement jumping
	if jumping :
		if self.is_on_floor() and ($Bouncers/LeftBouncer.is_colliding() and $Bouncers/RightBouncer.is_colliding()):
			velocityy -= JUMPING_SPEED
			$Jump.play()
		elif on_ground and ($Bouncers/LeftBouncer.is_colliding() or $Bouncers/RightBouncer.is_colliding()):
			on_ground = false
			velocityy -= JUMPING_SPEED
			$Jump.play()
		elif self.is_on_floor():
			velocityy -= JUMPING_SPEED
			$Jump.play()
	# Execute movement
	move_and_slide(Vector2(velocityx * MAX_SPEED, velocityy), Vector2(0, -1), false, 4, PI/4, false)
	
	emitter.set_gravity(Vector2(-velocityx * 10000, -velocityy  * 30))
	
	#if velocityx != 0 or velocityy != 0:
	#	yield(get_tree().create_timer(0.5), "timeout")
	#	emitter.emitting = true
	#	emitter.visible = true
	#	
	#else :
	#	emitter.emitting = false
	#	emitter.visible = false

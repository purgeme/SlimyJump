extends KinematicBody2D

const MAX_SPEED = 700
const GRAVITY = 20
const JUMPING_SPEED = 800

var velocityx = 0
var velocityy = 0
var angle = 0
var not_on_ground = true

# The particle system for the trailing effect
onready var emitter = get_node("CollisionShape2D/Sprite/CPUParticles2D")

var jumping = false

signal player_is_dead


# Get input for the player to move
func get_input():
	
	# Reset the values before getting input
	# To move the player only once if input comes only once
	velocityx = 0
	jumping = false

	if Input.is_action_pressed("right"):
		velocityx = 1
	if Input.is_action_pressed("left"):
		velocityx = -1
	if Input.is_action_pressed("jump"):
		jumping = true


# What to do when player is dead
func playdead():
	
	var score = get_parent().score
	#save the data
	get_parent().get_node("PlayerData").save_data(score, "user://score.dat")

	get_tree().change_scene("res://MainScreen.tscn") # Change scene to go back to main screen


# Main process
func _process(delta):

	# Check if player is to die
	# There are multiple conditions for player to die as there are many raycasts
	if $RayCast2D.is_colliding() and $RayCast2D2.is_colliding():
		emit_signal("player_is_dead")
		playdead()
	elif $RayCast2D3.is_colliding() and $RayCast2D4.is_colliding():
		emit_signal("player_is_dead")
		playdead()
	elif $RayCast2D5.is_colliding() and $RayCast2D6.is_colliding():
		emit_signal("player_is_dead")
		playdead()


# The movement is controlled here to keep it consistant
func _physics_process(delta):
	
	get_input()

	# Implement Gravity
	if !self.is_on_floor():

		# There is different gravity for going up and down
		# to make the jump look a little more snappy
		if velocityy < 0 :
			velocityy += GRAVITY
		else :
			velocityy += GRAVITY * 3
	else :
		velocityy = 0
		not_on_ground = true
	
	# Implement jumping
	if jumping :

		#The first 2 conditions are there for wall jumping
		if self.is_on_floor() and ($Bouncers/LeftBouncer.is_colliding() and $Bouncers/RightBouncer.is_colliding()):
			not_on_ground = false
			velocityy = 0
			velocityy -= JUMPING_SPEED
			$Jump.play()
		elif not_on_ground and ($Bouncers/LeftBouncer.is_colliding() or $Bouncers/RightBouncer.is_colliding()):
			not_on_ground = false
			velocityy = 0
			velocityy -= JUMPING_SPEED
			$Jump.play()
		elif self.is_on_floor():
			velocityy = 0
			velocityy -= JUMPING_SPEED
			$Jump.play()
	
	# Execute all of the movement
	move_and_slide(Vector2(velocityx * MAX_SPEED, velocityy), Vector2(0, -1), false, 4, PI/4, false)
	
	emitter.set_gravity(Vector2(-velocityx * 10000, -velocityy  * 30))



func _on_FixWallJumping_timeout() -> void:
	pass # Replace with function body.

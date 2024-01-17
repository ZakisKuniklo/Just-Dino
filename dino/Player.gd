extends CharacterBody2D

var jump_buffer_time = 0.1
const SPEED = 300.0
var JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	# Handle Jump and Jump Buffer.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")):
		if is_on_floor():
			pulo()
		else:
			$JumpBuffer.start(jump_buffer_time)
	#Buffered Jump
	if is_on_floor() && !$JumpBuffer.is_stopped():
		$JumpBuffer.stop()
		pulo()
	#Crouching
	if Input.is_action_pressed("ui_down"):
		abaixar()
	else:
		levantar()
	move_and_slide()

func pulo():
	velocity.y = JUMP_VELOCITY
	
func abaixar():
	get_node("colisao2").set_process(true)
	get_node("colisao2").visible = true
	get_node("colisao1").set_process(false)
	get_node("colisao1").visible = false
	JUMP_VELOCITY = -300.0

func levantar():
	get_node("colisao2").set_process(false)
	get_node("colisao2").visible = false
	get_node("colisao1").set_process(true)
	get_node("colisao1").visible = true
	JUMP_VELOCITY = -400.0






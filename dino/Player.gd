extends CharacterBody2D

var jump_buffer_time = 0.1
const SPEED = 300.0
var JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up")): 
		velocity.y += (gravity*0.95) * delta
	else:
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
		velocity.y += gravity * 0.5 * delta
	else:
		levantar()
	move_and_slide()

func pulo():
	velocity.y = JUMP_VELOCITY
	
func abaixar():
	get_node("colisao2").set_deferred('disabled',false)
	get_node("colisao2").visible = true
	get_node("colisao1").set_deferred('disabled',true)
	get_node("colisao1").visible = false

func levantar():
	get_node("colisao2").set_deferred('disabled',true)
	get_node("colisao2").visible = false
	get_node("colisao1").set_deferred('disabled',false)
	get_node("colisao1").visible = true






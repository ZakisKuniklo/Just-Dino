extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/AnimationPlayer.play("Aerodactyl")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.start:
		position.x -= Global.obstacleSpeed
		#x = x *1.005
	
	if position.x < -10:
		queue_free()

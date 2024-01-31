extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")):
		zoom = Vector2(1,1)
		position = Vector2(280,-154)
		Global.start = true
		$"../Spawner".start()
		$"../ScoreIncreaser".start()
		

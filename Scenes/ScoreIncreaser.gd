extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	Global.score +=1
	if Global.score > Global.highScore:
		Global.highScore = Global.score
	if(Global.score % 20 == 0):
		Global.spawnSpeed -= 0.05
		Global.spawnSpeed = clamp(Global.spawnSpeed,0.5,3)
		Global.obstacleSpeed += 0.1
		Global.obstacleSpeed = clamp(Global.obstacleSpeed,3,20)
	print(Global.score)
	

func _on_player_death():
	stop()

func _on_menu_bar_restart():
	start()

func _on_corridor_start_game():
	start()

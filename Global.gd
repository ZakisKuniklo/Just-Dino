extends Node

signal startGame
var save_path = "user://savegame.save"
var start = false
var score = 0
var highScore = 0
var spawnSpeed = 3
var obstacleSpeed = 1.6


# Called when the node enters the scene tree for the first time.
func _ready():
	loadHighScore()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_death():
	#await get_tree().create_timer(0.1).timeout
	Global.saveHighScore()
	get_tree().paused = true
	$MenuBar.visible = true
	start = false
	


func _on_menu_bar_restart():
	get_tree().paused = false
	for nodes in get_tree().get_nodes_in_group("obstacle"):
		nodes.queue_free()
	score = 0
	Global.spawnSpeed = 3
	Global.obstacleSpeed = 1.6
	$MenuBar.visible = false


func _on_key_listener_key_pressed():
	if Global.start == false:
		Global.start = true
		
		startGame.emit()

func saveHighScore():
	var save_game = FileAccess.open(save_path, FileAccess.WRITE)
	save_game.store_var(highScore)

func loadHighScore():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path,FileAccess.READ)
		highScore = file.get_var(highScore)
	else:
		print("no data saved")
		highScore = 0

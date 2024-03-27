extends Node

var start = false
var score = 0
var spawnSpeed = 3
var obstacleSpeed = 1.6

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_death():
	#await get_tree().create_timer(0.1).timeout
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

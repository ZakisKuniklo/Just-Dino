extends MenuBar

signal restart

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up"):
		Global.score = 0
		restart.emit()
		

func _on_Sair_pressed():
	get_tree().quit()

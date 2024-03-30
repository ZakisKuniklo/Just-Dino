extends Node

signal up
signal down
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up"):
		up.emit()
	if Input.is_action_pressed("ui_down"):
		down.emit()

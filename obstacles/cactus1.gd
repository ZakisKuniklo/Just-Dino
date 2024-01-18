extends StaticBody2D

var x = 1.6
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.start:
		position.x -= x
		x = x *1.005
	
	if position.x < -10:
		queue_free()
	pass

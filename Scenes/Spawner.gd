extends Timer

var waitTime = 1

var cactus1 = preload("res://obstacles/cactus1.tscn")

func _on_timeout():
	var obstaculo = cactus1.instantiate()
	obstaculo.position = Vector2(592,-23)
	add_child(obstaculo)


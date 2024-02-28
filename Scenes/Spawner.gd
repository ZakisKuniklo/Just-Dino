extends Timer


var rng = RandomNumberGenerator.new()
var cactus1 = preload("res://obstacles/cactus1.tscn")
var cactus2 = preload("res://obstacles/2catus1.tscn")
var aerodactyl = preload("res://obstacles/aerodactyl.tscn")
var randomObstacle = 0
var obstaculo

func _on_timeout():
	randomObstacle = rng.randi_range(1, 3)
	print(randomObstacle)
	match randomObstacle:
		1:
			obstaculo = cactus1.instantiate()
			obstaculo.position = Vector2(592,-20)
		2:
			obstaculo = aerodactyl.instantiate()
			obstaculo.position = Vector2(592,-45)
		3:
			obstaculo = cactus2.instantiate()
			obstaculo.position = Vector2(592,-20)
	add_child(obstaculo)
	wait_time = Global.spawnSpeed



func _on_camera_2d_start():
	start()
	

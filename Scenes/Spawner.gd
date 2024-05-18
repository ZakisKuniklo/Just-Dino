extends Timer


var rng = RandomNumberGenerator.new()
var cactus1 = preload("res://obstacles/cactus1.tscn")
var cactus2 = preload("res://obstacles/2catus1.tscn")
var cactus3 = preload("res://obstacles/3cactus1.tscn")
var cactus4 = preload("res://obstacles/cactus2.tscn")
var cactus5 = preload("res://obstacles/2cactus2.tscn")
var cactus6 = preload("res://obstacles/1g2p1g.tscn")
var aerodactyl = preload("res://obstacles/aerodactyl.tscn")
var randomObstacle = 0
var obstaculo

func _on_timeout():
	randomObstacle = rng.randi_range(1, 8)
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
		4:
			obstaculo = aerodactyl.instantiate()
			obstaculo.position = Vector2(592,-30)
		5:
			obstaculo = cactus3.instantiate()
			obstaculo.position = Vector2(592,-20)
		6:
			obstaculo = cactus4.instantiate()
			obstaculo.position = Vector2(592,-20)
		7:
			obstaculo = cactus5.instantiate()
			obstaculo.position = Vector2(592,-20)
		8:
			obstaculo = cactus6.instantiate()
			obstaculo.position = Vector2(592,-20)
	add_child(obstaculo)
	wait_time = Global.spawnSpeed



func _on_player_death():
	stop()

func _on_menu_bar_restart():
	start()

func _on_corridor_start_game():
	start()

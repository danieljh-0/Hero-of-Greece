extends Node

var enemyScene = preload("res://Scenes/enemy1.tscn")
const MINI_BOSS = preload("res://Scenes/miniBoss.tscn")

func _ready() -> void:
	var enemySpawns
	if Globals.level == 1:
		enemySpawns = [Vector2(100, -75), Vector2(475, -70), Vector2(850, -50)]
	elif Globals.level == 2:
		enemySpawns = [Vector2(100, -75), Vector2(475, -70), Vector2(1200, -100)]
		spawnMiniBoss(Vector2(1900, -100))
	for i in range(len(enemySpawns)):
		spawnEnemy(enemySpawns[i])
		
func spawnEnemy(spawn: Vector2) -> void:
	var enemy = enemyScene.instantiate()
	enemy.add_to_group("enemies")
	enemy.position = spawn
	add_child(enemy)
	
func spawnMiniBoss(spawn: Vector2) -> void:
	var boss = MINI_BOSS.instantiate()
	boss.add_to_group("enemies")
	boss.position = spawn
	add_child(boss)
	

	

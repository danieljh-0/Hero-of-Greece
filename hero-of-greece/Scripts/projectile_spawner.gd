extends Node

var projectileScene = preload("res://Scenes/projectile.tscn")

func spawnProjectile(spawn: Vector2, gradient: float, direction: int) -> void:
	var projectile = projectileScene.instantiate()
	projectile.add_to_group("projectiles")
	projectile.position = spawn
	projectile.gradient = gradient
	projectile.direction = direction
	add_child(projectile)

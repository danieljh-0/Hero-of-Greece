extends Area2D

@export var weaponDamage = 30
@onready var area: Area2D = $"."
@onready var hero: Hero = get_tree().get_root().get_node("Game/Hero")
@onready var projectileSpawner: Node = get_tree().get_root().get_node("Game/ProjectileSpawner")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collisionRight: CollisionShape2D = $CollisionShape2D
@onready var collisionLeft: CollisionShape2D = $CollisionShapeLeft
@onready var horizontalCollision: CollisionShape2D = $HorizontalCollision
@onready var horizontalCollisionLeft: CollisionShape2D = $HorizontalCollisionLeft
var weaponReady = true
var weapon = "Sword"
var left = false
var melee = true

func _ready() -> void:
	weapon = Globals.weapon
	weaponDamage = 30
	
func _process(delta: float) -> void:
	weapon = Globals.weapon
	
	match weapon:
		"Sword":
			weaponDamage = 30
		"Axe":
			weaponDamage = 35
		"Hammer":
			weaponDamage = 25
		"Short Sword":
			weaponDamage = 20
		
	if weapon == "Bow" || weapon == "BowArrow":
		melee = false
	else: 
		melee = true
		
	if hero.get_child(0).animation == "right":
		if weapon == "Hammer" || weapon == "Axe":
			collisionLeft.visible = false
			collisionRight.visible = false
			horizontalCollision.visible = true
			horizontalCollisionLeft.visible = false
		elif weapon != "Bow" && weapon != "BowArrow":
			collisionRight.visible = true
			collisionLeft.visible = false
			horizontalCollision.visible = false
			horizontalCollisionLeft.visible = false
		else:
			collisionRight.visible = false
			collisionLeft.visible = false
			horizontalCollision.visible = false
			horizontalCollisionLeft.visible = false
		left = false
		sprite.animation = weapon
		position.x = 8
		position.y = 6
	elif hero.get_child(0).animation == "left":
		sprite.animation = weapon + "Left"
		position.x = -8
		left = true
		if weapon == "Hammer" || weapon == "Axe":
			collisionLeft.visible = false
			collisionRight.visible = false
			horizontalCollisionLeft.visible = true
			horizontalCollision.visible = false
		else:
			collisionLeft.visible = true
			collisionRight.visible = false
			horizontalCollisionLeft.visible = false
			horizontalCollision.visible = false
	if Input.is_action_just_pressed("attack") && weaponReady && melee:
		if !left:
			weaponReady = false
			for enemy in get_tree().get_nodes_in_group("enemies"):
				var enemyArea = enemy.get_child(3)
				if area.overlaps_area(enemyArea):
					enemy.enemyHealth -= weaponDamage
					enemy.damageReceived(global_position)
					if enemy.enemyHealth <= 0:
						pass
			for i in range(18):
				area.rotation_degrees += 5
				await get_tree().create_timer(0.01).timeout
			for i in range(18):
				area.rotation_degrees -= 5
				await get_tree().create_timer(0.01).timeout
			weaponReady = true
		else:
			weaponReady = false
			for enemy in get_tree().get_nodes_in_group("enemies"):
				var enemyArea = enemy.get_child(3)
				if area.overlaps_area(enemyArea):
					enemy.enemyHealth -= weaponDamage
					enemy.damageReceived(global_position)
					if enemy.enemyHealth <= 0:
						pass
			for i in range(18):
				area.rotation_degrees -= 5
				await get_tree().create_timer(0.01).timeout
			for i in range(18):
				area.rotation_degrees += 5
				await get_tree().create_timer(0.01).timeout
			weaponReady = true
	elif Input.is_action_just_pressed("attack") && weaponReady && !melee:
		weaponReady = false
		var gradient = 0
		var mousePos = get_global_mouse_position()
		var heroPos = hero.global_position

		gradient = (mousePos.y - heroPos.y) / (mousePos.x - heroPos.x)
		print(gradient)
		var spawnPos = 0
		if !left:
			spawnPos = Vector2(heroPos.x + 8, heroPos.y + 6)
		else:
			spawnPos = Vector2(heroPos.x - 8, heroPos.y + 6)
		var direction = spawnPos.direction_to(mousePos)
		print("direction" + str(direction))
		direction = direction.x
		if direction < 0:
			direction = -1
		else:
			direction = 1
		projectileSpawner.spawnProjectile(spawnPos, gradient, direction)
		await get_tree().create_timer(0.33).timeout #delay between shots in seconds
		weaponReady = true

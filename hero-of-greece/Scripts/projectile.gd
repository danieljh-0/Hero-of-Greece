extends Area2D

@export var gradient = 0
@export var direction = 1
@export var damage = 20
@onready var hero: Hero = get_tree().get_root().get_node("Game/Hero")
@onready var area: Area2D = $"."

var velocity = Vector2()

func _on_ready() -> void:
	area.look_at(get_global_mouse_position())
	if direction == 1:
		velocity = Vector2(2 * direction, 2 * gradient)
	else:
		velocity = Vector2(2 * direction, -2 * gradient)
	print("velocity" + str(velocity))

func _process(delta: float) -> void:
	global_position += velocity
	#velocity.y += 0.03 #gravity
	

func _on_body_entered(body: Node2D) -> void:
	print("entered")
	print(body)
	if body is TileMapLayer:
		area.queue_free()
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if body == enemy:
			enemy.enemyHealth -= damage
			enemy.damageReceived(hero.global_position)
			area.queue_free()

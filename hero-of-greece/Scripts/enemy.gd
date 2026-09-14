extends CharacterBody2D
@onready var enemy: Node2D = $"."
@onready var hero: Hero = get_tree().get_root().get_node("Game/Hero")

@export var enemyHealth: int = 50
@export var damage: int = 25

const JUMP_VELOCITY = -300.0
const SPEED = 50
var knockback = Vector2.ZERO
var knocked = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if enemyHealth <= 0:
		enemy.queue_free()
		
	
func _physics_process(delta: float) -> void:
	if position.distance_to(hero.position) < 300:
		var direction = global_position.direction_to(hero.global_position)
		var x = direction.x
		if knockback.length() < 0.1 && is_on_floor():
			if direction:
				velocity.x = x * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
		else:
			knockback = knockback.lerp(Vector2.ZERO, 0.1)
			
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()
	
func damageReceived(heroPosition: Vector2) -> void:
	var knockbackStrength = 5
	var direction = (heroPosition.direction_to(global_position))
	var force = direction * knockbackStrength
	knockback = force
	velocity = direction * SPEED + knockback
	velocity.y += JUMP_VELOCITY * 1
	knockback = knockback.lerp(Vector2.ZERO, 0.1)

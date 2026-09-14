extends CharacterBody2D
class_name Hero

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@export var health = 100

var knockback = Vector2.ZERO


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if knockback.length() < 1:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		knockback = knockback.lerp(Vector2.ZERO, 0.1)

	move_and_slide()
	if direction == 1.0:
		sprite.animation = "right"
	elif direction == -1.0:
		sprite.animation = "left"


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
	
	
func damageReceived(enemyPosition: Vector2) -> void:
	var knockbackStrength = 5
	var direction = (enemyPosition.direction_to(global_position))
	var force = direction * knockbackStrength
	knockback = force
	velocity = direction * SPEED + knockback
	velocity.y += JUMP_VELOCITY * 0.5
	knockback = knockback.lerp(Vector2.ZERO, 0.1)


func _on_ready() -> void:
	sprite.animation = "right"

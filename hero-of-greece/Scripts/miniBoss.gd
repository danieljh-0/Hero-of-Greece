extends CharacterBody2D

@onready var enemy: Node2D = $"."
@onready var hero: Hero = get_tree().get_root().get_node("Game/Hero")

@export var enemyHealth: int = 150
@export var damage: int = 35


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if enemyHealth <= 0:
		enemy.queue_free()

func _physics_process(delta: float) -> void:
	pass
	
func damageReceived(heroPosition: Vector2) -> void:
	pass

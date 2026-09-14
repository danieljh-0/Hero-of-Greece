extends Node2D
@onready var timer: Timer = $Timer
@onready var hp_label: Label = get_tree().get_root().get_node("Game/CanvasLayer/HP Label")
@onready var hero: Hero = get_tree().get_root().get_node("Game/Hero")

@export var damage: int = 25

func _on_body_entered(body) -> void:
	if body is Hero:
		Globals.health -= damage
		if damage != 100000:
			hero.damageReceived(global_position)
		hp_label.text = "HP: " + str(Globals.health)
		
		if Globals.health <= 0:
			hp_label.text = "HP: " + str(0)
			body.get_node("CollisionShape2D").queue_free()
			timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()

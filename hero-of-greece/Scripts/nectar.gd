extends Area2D

@onready var hp_label: Label = get_tree().get_root().get_node("Game/CanvasLayer/HP Label")
@onready var area_2d: Area2D = $"."


func _on_body_entered(body: Node2D) -> void:
	if Globals.health <= 70:
		Globals.health += 30
		area_2d.queue_free()
	elif Globals.health < 100:
		Globals.health = 100
		area_2d.queue_free()
		
		
	hp_label.text = "HP: " + str(Globals.health)
	
	

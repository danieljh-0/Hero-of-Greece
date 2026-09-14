extends Node

const nectarScene = preload("res://Scenes/nectar.tscn")

func _on_ready() -> void:
	if Globals.level == 2:
		var nectar = nectarScene.instantiate()
		nectar.add_to_group("nectar")
		nectar.position = Vector2(848, -74)
		add_child(nectar)

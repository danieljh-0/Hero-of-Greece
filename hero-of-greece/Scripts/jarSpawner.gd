extends Node

const jarScene = preload("res://Scenes/jar.tscn")

func _on_ready() -> void:
	var jar = jarScene.instantiate()
	if Globals.level == 1:
		jar.position = Vector2(1104, 23)
	if Globals.level == 2:
		jar.position = Vector2(1552, -104)
	jar.add_to_group("jar")
	add_child(jar)

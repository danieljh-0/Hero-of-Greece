extends Area2D

const HOME = preload("res://Scenes/home.tscn")

var opened = false

func _on_body_entered(body: Node2D) -> void:
	if body is Hero && !opened:
		opened = true
		Globals.drachmas += 20
		if Globals.level == 1:
			await get_tree().create_timer(3).timeout
			Globals.level = 2
			get_tree().change_scene_to_packed(HOME)

extends Button
const GAME = preload("res://Scenes/game.tscn")
const HOME = preload("res://Scenes/home.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(HOME)
	


func _on_btn_start_3_pressed() -> void:
	get_tree().quit()

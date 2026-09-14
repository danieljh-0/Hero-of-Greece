extends Area2D


const GAME = preload("res://Scenes/game.tscn")
@onready var hero: Hero = get_tree().get_root().get_node("TileMap/Hero")

var goTo = ""

func _on_body_entered(body: Node2D) -> void:
	if body is Hero:
		print("entered sign")
		goTo = "1"
		
func _on_body_exited(body: Node2D) -> void:
	if body is Hero:
		print("left sign")
		goTo = ""

	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		if goTo == "1":
			get_tree().change_scene_to_packed(GAME)
		

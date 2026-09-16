extends Area2D


var GAME = load("res://Scenes/game.tscn")
@onready var hero: Hero = get_tree().get_root().get_node("TileMap/Hero")

var goTo = ""

func _on_body_entered(body: Node2D) -> void:
	if body is Hero:
		print("entered sign")
		goTo = str(Globals.level)
		
func _on_body_exited(body: Node2D) -> void:
	if body is Hero:
		print("left sign")
		goTo = ""

	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		
		if goTo != "":
			get_tree().change_scene_to_packed(GAME)
		

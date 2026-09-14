extends Area2D

var opened = false

func _on_body_entered(body: Node2D) -> void:
	if body is Hero && !opened:
		opened = true
		Globals.drachmas += 20

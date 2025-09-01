extends Area2D

signal damaged

func _on_body_entered(body: Node2D) -> void:
	emit_signal("damaged")

extends Area2D

signal morreu

func _on_body_entered(_body: Node2D) -> void:
	emit_signal("morreu")
	print('entro')
	get_tree().reload_current_scene()

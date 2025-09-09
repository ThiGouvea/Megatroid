extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if _body.name == "Player":
		_body.dead.emit()
		#get_tree().reload_current_scene()

extends Area2D
signal MaisMoeda
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("MaisMoeda", 1)
		animated_sprite_2d.hide()
		collision_shape_2d.free()
		

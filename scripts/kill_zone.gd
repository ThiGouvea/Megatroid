extends Area2D

@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		timer.start()
		Auto.vivo = false

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	Auto.vivo = true
	get_tree().reload_current_scene()

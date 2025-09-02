extends Area2D

signal damaged
@onready var timer: Timer = $Timer

var tomandodano = false
		
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !tomandodano:
		emit_signal("damaged")
		tomandodano = true
		timer.start()
	
func _on_body_exited(body: Node2D) -> void:
	tomandodano = false


func _on_timer_timeout() -> void:
	if tomandodano:
		emit_signal("damaged")
		

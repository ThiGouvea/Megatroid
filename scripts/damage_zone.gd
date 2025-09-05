extends Area2D

@onready var timer: Timer = $Timer

var tomandodano = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !tomandodano:
		tomandodano = true
		timer.start()
	print(body.name)
func _on_timer_timeout() -> void:
	if tomandodano:
		tomandodano = false
		print('false')
		
		

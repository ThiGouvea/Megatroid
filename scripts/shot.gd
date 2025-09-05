extends CharacterBody2D

var _fliped = false
var travel_distance = 0
var distancia_maxima = 30
# Called when the node enters the scene tree for the first time.
func setup(_valor: bool) -> void:
	_fliped = _valor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _fliped:
		position.x += 300 * delta
		travel_distance += 1
	else:
		position.x -= 300 * delta
		travel_distance -= 1
	if travel_distance >= distancia_maxima or travel_distance <= -distancia_maxima:
		queue_free()

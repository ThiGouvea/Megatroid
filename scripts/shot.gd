extends RigidBody2D
@onready var shot_hit: AnimatedSprite2D = $ShotHit

var _fliped = false
var travel_distance = 0
var distancia_maxima = 20
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

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

func _on_hit() -> void:
	queue_free()

func _on_body_entered(body: Node) -> void:
	queue_free()


func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	queue_free()

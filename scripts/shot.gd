extends RigidBody2D
@onready var shot_hit: AnimatedSprite2D = $ShotHit
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


var distancia_maxima: int = 10
var damage_shot: int = 1

var _fliped = false
var travel_distance = 0

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

func _on_hit() -> int:
	queue_free()
	return damage_shot

func _on_body_entered(_body: Node) -> void:
	queue_free()


func _on_body_shape_entered(_body_rid: RID, _body: Node, _body_shape_index: int, _local_shape_index: int) -> void:
	queue_free()

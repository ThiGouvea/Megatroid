extends RigidBody2D

var distancia_maxima: int = 30
var damage_shot: int = 1
@onready var sprite_2d: Sprite2D = $Sprite2D

var velocidade = 200
var up
var down
var fliped = false
var travel_distance = 0

# Called when the node enters the scene tree for the first time.
func setup(_fliped: bool, _up: bool, _down: bool) -> void:
	fliped = _fliped
	up = _up
	down = _down
	if up:
		position.y -= 10
	elif down:
		position.y += 10
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fliped and up:
		position.x += velocidade * delta * 0.6
		position.y -= velocidade * delta * 0.6
		travel_distance += 1
	elif fliped and down:
		position.x += velocidade * delta * 0.69
		position.y += velocidade * delta * 0.69
		travel_distance += 1
	elif fliped and !down and !up:
		position.x += velocidade * delta
		travel_distance += 1
	elif !fliped and up:
		position.x -= velocidade * delta * 0.69
		position.y -= velocidade * delta * 0.69
		travel_distance -= 1
	elif !fliped and down:
		position.x -= velocidade * delta * 0.69
		position.y += velocidade * delta * 0.69
		travel_distance -= 1
	else:
		position.x -= velocidade * delta
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

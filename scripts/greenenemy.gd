extends Node2D
@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var direction = 1
@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft
@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_castright.is_colliding() or !ray_cast_down_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_castleft.is_colliding() or !ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += 30 * delta * direction

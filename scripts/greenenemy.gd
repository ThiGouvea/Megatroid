extends Node2D
@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft
@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var direction = 1
var HP = 2
var damage_to_player = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if HP > 0:
		if ray_castright.is_colliding() or !ray_cast_down_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
		if ray_castleft.is_colliding() or !ray_cast_down_left.is_colliding():
			direction = 1
			animated_sprite.flip_h = false
		position.x += 30 * delta * direction

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Shot":
		body._on_hit()
		HP -= 1
		if HP > 0:
			$AnimatedSprite2D.play("damaged")
		elif HP <= 0:
			collision_shape_2d.set_deferred("disabled", true)
			$AnimatedSprite2D.play("death")
		else:
			$AnimatedSprite2D.play("default")
	if body.name == "Player":
		body._damaged(damage_to_player)

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "death":
		queue_free()
	elif $AnimatedSprite2D.animation == "damaged":
		$AnimatedSprite2D.play("default")

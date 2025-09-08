extends Node2D
@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft
@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight

var direction = 1
var HP = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_castright.is_colliding() or !ray_cast_down_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_castleft.is_colliding() or !ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += 30 * delta * direction

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Shot":
		body.queue_free()
		$AnimatedSprite2D.play("damaged")
		$Timer.start()
		HP -= 1
	if body.name == "Player":
		print("enemy")
		body._damaged()
	

func _on_timer_timeout() -> void:
	if HP <= 0:
		$AnimatedSprite2D.play("death")
	else:
		$AnimatedSprite2D.play("default")


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "death":
		queue_free()

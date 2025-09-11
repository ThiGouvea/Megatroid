extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var point_light_2d: PointLight2D = $PointLight2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.energy += 1
		print(body.energy)
		body.can_slide = true
		queue_free()
		
func _process(delta: float) -> void:
	if animated_sprite_2d.frame == 1:
		point_light_2d.visible = false
	else:
		point_light_2d.visible = true

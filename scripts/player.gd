extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if Auto.vivo:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		var direction := Input.get_axis("move_left", "move_right")
			
		
		if direction > 0:
			animated_sprite_2d.flip_h = true
		elif direction < 0:
			animated_sprite_2d.flip_h = false
		
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("Iddle")
			else:
				animated_sprite_2d.play("run")
		else:
			velocity += get_gravity() * delta
			animated_sprite_2d.play("Jump")
		
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	
	else:
		animated_sprite_2d.play("morte")

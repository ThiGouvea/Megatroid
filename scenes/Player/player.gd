class_name Player
extends CharacterBody2D

@onready var animations = $animations
@onready var state_machine = $state_machine

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

#class_name Player extends CharacterBody2D
#
#const SPEED = 100.0
#const JUMP_VELOCITY = -300.0
#@onready var animated_sprite_2d: AnimatedSprite2D = $animations
#
#func _physics_process(delta: float) -> void:
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	#
	#var direction := Input.get_axis("move_left", "move_right")
		#
	#
	#if direction > 0:
		#animated_sprite_2d.flip_h = true
	#elif direction < 0:
		#animated_sprite_2d.flip_h = false
	#
	#if is_on_floor():
		#if direction == 0:
			#animated_sprite_2d.play("Iddle")
		#else:
			#animated_sprite_2d.play("run")
	#else:
		#velocity += get_gravity() * delta
		#animated_sprite_2d.play("Jump")
	#
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

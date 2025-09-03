class_name move
extends State

@export var moveshooting_state: State
@export var fall_state: State
@export var idle_state: State
@export var jump_state: State
@export var slide_state: State


func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	elif Input.is_action_just_pressed('slide') and parent.is_on_floor():
		return slide_state
	return null

func process_physics(delta: float) -> State:
	if parent.shooting:
		parent.animations.play('moveshooting')
		
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null

class_name jumpshooting
extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@export var jump_shooting: State
@export var fall_shooting: State

func enter() -> void:
	super()

func process_input(_event: InputEvent) -> State:
	if !parent.is_on_floor() and Input.is_action_just_released('jump'):
		parent.velocity.y = 0
		return fall_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	if movement != 0:
		parent.animations.flip_h = movement > 0
	parent.velocity.x = movement

	
	if parent.shooting:
		return jump_shooting
		
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
		
	
	return null

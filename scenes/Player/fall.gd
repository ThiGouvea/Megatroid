class_name fall
extends State

@export var idle_state: State
@export var move_state: State
@export var fall_shooting: State
@export var fall_shootingup: State
@export var fall_shootingdown: State

func enter():
	super()

func process_physics(delta: float) -> State:
	
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement != 0:
		parent.animations.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.shooting:
		if parent.shooting_up:
			return fall_shootingup
		elif parent.shooting_down:
			return fall_shootingdown
		else:
			return fall_shooting
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	return null

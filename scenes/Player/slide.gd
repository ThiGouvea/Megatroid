extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State

var slide_force

func enter() -> void:
	super()
	slide_force = 100
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_released('slide') and parent.is_on_floor():
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis('move_left', 'move_right') * slide_force
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	slide_force -= 1
	
	if !parent.is_on_floor():
		return fall_state
	return null
	
	return null

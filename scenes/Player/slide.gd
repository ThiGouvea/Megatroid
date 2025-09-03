extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@onready var timer: Timer = $Timer

var slide_force
var justslided = false

func enter() -> void:
	super()
	parent.shooting = false
	if !justslided:
		slide_force = 120
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_released('slide') and parent.is_on_floor():
		justslided = true
		slide_force = 120
		timer.start()
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if timer.time_left > 0 or slide_force <= 0:
		return move_state
	
	var movement = Input.get_axis('move_left', 'move_right') * slide_force
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	slide_force -= 2
	
	if !parent.is_on_floor():
		return fall_state
	return null


func _on_timer_timeout() -> void:
	justslided = false

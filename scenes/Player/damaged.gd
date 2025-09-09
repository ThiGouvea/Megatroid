extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@onready var timer: Timer = $Timer
var outtime = false

func enter() -> void:
	super()
	outtime = false
	timer.start()
	
func process_physics(_delta: float) -> State:
	if outtime:
		if !parent.is_on_floor():
			return fall_state
		elif Input.is_action_just_pressed('move_left') or Input.is_action_just_pressed('move_right'):
			return move_state
		else:
			return idle_state
	#parent.move_and_slide()
	return null

func _on_timer_timeout() -> void:
	outtime = true

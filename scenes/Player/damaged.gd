extends State

@onready var invulneravelt: Timer = $invulneravel
@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@onready var timer: Timer = $Timer
var outtime = false
var invulneravel = false

func enter() -> void:
	super()
	outtime = false
	if !invulneravel:
		timer.start()
		invulneravel = true
		parent.animations.play("damaged")
		Engine.time_scale = 0.5
		invulneravelt.start()
	
func process_physics(delta: float) -> State:
	if outtime:
		if !parent.is_on_floor():
			return fall_state
		elif Input.is_action_just_pressed('move_left') or Input.is_action_just_pressed('move_right'):
			return move_state
		else:
			return idle_state
		parent.move_and_slide()
	return null


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	outtime = true

func _on_invulneravel_timeout() -> void:
	invulneravel = false
	print('vulneravel')

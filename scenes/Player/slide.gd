extends State
@onready var collision: CollisionShape2D = $"../../collision"

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@export var jump_state: State
@onready var timer: Timer = $Timer

var slide_force
var justslided = false

func enter() -> void:
	super()
	if parent.can_slide:
		parent.can_shoot = false
		if !justslided:
			slide_force = 150
			collision.scale.y = 0.4
			collision.position.y = -5
	
func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_released('slide') and parent.is_on_floor():
		justslided = true
		slide_force = 120
		timer.start()
		on_exiting()
		return move_state
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		on_exiting()
		return jump_state
	return null

func process_physics(delta: float) -> State:
	if !parent.can_slide:
		on_exiting()
		return move_state
		
	parent.velocity.y += gravity * delta
	
	if timer.time_left > 0 or slide_force <= 0:
		on_exiting()
		return move_state
	
	var movement = Input.get_axis('move_left', 'move_right') * slide_force
	if movement == 0:
		on_exiting()
		return idle_state
	
	parent.animations.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	slide_force -= 2
	
	if !parent.is_on_floor():
		on_exiting()
		return fall_state
	return null


func _on_timer_timeout() -> void:
	justslided = false
	
func on_exiting() -> void:
	collision.scale.y = 1
	collision.position.y = -10.75
	parent.can_shoot = true

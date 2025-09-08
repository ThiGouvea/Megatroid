class_name Player
extends CharacterBody2D

@onready var animations = $animations
@onready var state_machine = $state_machine
@export var shooting: bool = false
var vulneravel = true
@onready var timer: Timer = $Timer

signal taken_damage
signal shoted(pos, fliped)

func _ready() -> void:
	
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		shooting = true
		if animations.flip_h:			
			shoted.emit($Marker2D.global_position, true)
		else:
			shoted.emit($Marker2D.global_position, false)
	else:
		shooting = false
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _damaged() -> void:
	if vulneravel:
		taken_damage.emit()
		timer.start()
		vulneravel = false
		
	
func _on_timer_timeout() -> void:
	vulneravel = true

class_name Player
extends CharacterBody2D

signal quantDano

@onready var animations = $animations
@onready var state_machine = $state_machine
@export var shooting: bool = false

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		shooting = true
	elif Input.is_action_just_released("shoot"):
		shooting = false
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func _on_damage_zone_damaged() -> void:
	emit_signal("quantDano")

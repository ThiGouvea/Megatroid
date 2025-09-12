class_name Player
extends CharacterBody2D

@export var HP: int
@export var can_slide: bool = false
@export var energy: int
@export var can_shoot: bool = true

@onready var animations = $animations
@onready var state_machine = $state_machine
@onready var timer: Timer = $Timer


var shooting: bool = false
var vulneravel = true


signal taken_damage
signal shoted(pos, fliped, up, down)
signal dead

func _ready() -> void:
	
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	if can_shoot:
		if Input.is_action_just_pressed("shoot"):
			shooting = true
			if animations.flip_h:
				if Input.is_action_pressed("up"):
					shoted.emit($MarkerDireita.global_position, true, true, false)
				elif Input.is_action_pressed("down"):
					shoted.emit($MarkerDireita.global_position, true, false, true)
				else:
					shoted.emit($MarkerDireita.global_position, true, false, false)
			else:
				if Input.is_action_pressed("up"):
					shoted.emit($MarkerEsquerda.global_position, false, true, false)
				elif Input.is_action_pressed("down"):
					shoted.emit($MarkerEsquerda.global_position, false, false, true)
				else:
					shoted.emit($MarkerEsquerda.global_position, false, false, false)
		else:
			shooting = false
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _damaged(_dano: int) -> void:
	if vulneravel:
		HP -= _dano
		if HP <= 0:
			dead.emit()
			return
		taken_damage.emit()
		timer.start()
		vulneravel = false
	
func _on_timer_timeout() -> void:
	vulneravel = true

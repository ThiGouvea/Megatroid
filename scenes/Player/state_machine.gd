class_name state_machine extends Node

@export var inicial_state: State

var current_state: State
var states: Dictionary[String, State] = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.state_machine = self
			states[child.name.to_lower()] = child
	if inicial_state :
		inicial_state.enter()
		current_state = inicial_state
			
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.phisics_update(delta)

func change_state(new_state_name: String) -> void:
	var new_state: State = states.get(new_state_name.to_lower())
	
	assert(new_state, "State not found: " + new_state_name)
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	
	current_state = new_state

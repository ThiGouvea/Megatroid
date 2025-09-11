extends State

@export var idle_state: State

func enter() -> void:
	super()

func process_physics(_delta: float) -> State:
	print('respawn')
	return idle_state

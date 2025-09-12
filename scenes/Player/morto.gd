class_name playerdead extends State

@export var respawning: State
var dead = true


func enter() -> void:
	super()

func process_physics(_delta: float) -> State:
	
	print('morto')
	return respawning
	

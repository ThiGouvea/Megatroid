class_name playerdead extends State

@onready var player: Player = $"../.."
@export var respawning: State
var dead = true


func enter() -> void:
	super()

func process_physics(_delta: float) -> State:
	
	print('morto')
	return respawning
	

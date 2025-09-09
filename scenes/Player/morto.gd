class_name playerdead extends State

@onready var player: Player = $"../.."
@export var respawning: State
var dead = true


func enter() -> void:
	super()

func process_physics(_delta: float) -> State:
	player.HP = 10
	player.position.x = 0
	player.position.y = 0
	print('morto')
	return respawning
	

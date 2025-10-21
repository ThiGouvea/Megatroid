class_name playerdead extends State

@onready var animations: AnimatedSprite2D = $"../../animations"
@export var respawning: State
var dead = true


func enter() -> void:
	super()

func process_physics(_delta: float) -> State:
	if !animations.is_playing():
		return respawning
	return null
	

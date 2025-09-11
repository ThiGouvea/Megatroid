extends State
@onready var player: Player = $"../.."

@export var idle_state: State
@onready var animations: AnimatedSprite2D = $"../../animations"

func enter() -> void:
	super()
	player.position.y = 0
	player.position.x = -120
	animations.play("landing")

func process_physics(_delta: float) -> State:
	player.HP = 1
	if !animations.is_playing():
		return idle_state
	return null

class_name standart_enemy extends Area2D

@export var velocidade_movimento: int
@export var hp_enemy: int
@export var damage_to_player: int
@export var current_state : STATE

var direction = 1

enum STATE {}

func _ready() -> void:
	pass

func _set_state(new_state: STATE) -> void:
	if current_state == new_state:
		return
	
	_exit_state()
	current_state = new_state
	_enter_state()

func _enter_state() -> void:
	pass
			
func _exit_state() -> void:
	pass
			
func _update_state(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	_update_state(delta)

func _on_body_entered(body: Node2D) -> void:
		if body.name == "Shot":
			var dano = body._on_hit()
			hp_enemy -= dano
			if hp_enemy > 0:
				pass
			elif hp_enemy <= 0:
				pass
		if body.name == "Player":
			body._damaged(damage_to_player)

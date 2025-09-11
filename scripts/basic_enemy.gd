class_name basic_enemy extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down_right: RayCast2D = $RayCastDownRight
@onready var ray_cast_down_left: RayCast2D = $RayCastDownLeft

@export var velocidade_movimento: int
@export var hp_enemy: int
@export var damage_to_player: int
@export var current_state : STATE

var direction = 1

enum STATE {WALKING, TAKINGDAMAGE, DYING}

func _ready() -> void:
	_set_state(STATE.WALKING)
	animated_sprite.play("walking")

func _set_state(new_state: STATE) -> void:
	if current_state == new_state:
		return
	
	_exit_state()
	current_state = new_state
	_enter_state()

func _enter_state() -> void:
	match current_state:
		STATE.WALKING: 
			animated_sprite.play("walking")
			
		STATE.TAKINGDAMAGE: 
			animated_sprite.play("takingdamage")
			
		STATE.DYING:
			animated_sprite.play("dying")
			
func _exit_state() -> void:
	match current_state:
		STATE.WALKING:
			pass
			
		STATE.TAKINGDAMAGE:
			pass
		
		STATE.DYING:
			queue_free()
			
func _update_state(delta: float) -> void:
	match current_state:
		STATE.WALKING: 
			if ray_cast_right.is_colliding() or !ray_cast_down_right.is_colliding():
				direction = -1
				animated_sprite.flip_h = true
			if ray_cast_left.is_colliding() or !ray_cast_down_left.is_colliding():
				direction = 1
				animated_sprite.flip_h = false
			position.x += velocidade_movimento * delta * direction
			
		STATE.TAKINGDAMAGE:
			if !animated_sprite.is_playing():
				_set_state(STATE.WALKING)
		
		STATE.DYING:
			if animated_sprite.frame >= 3:
				_exit_state()

func _physics_process(delta: float) -> void:
	_update_state(delta)


func _on_body_entered(body: Node2D) -> void:
		if body.name == "Shot":
			var dano = body._on_hit()
			hp_enemy -= dano
			if hp_enemy > 0:
				_set_state(STATE.TAKINGDAMAGE)
			elif hp_enemy <= 0:
				_set_state(STATE.DYING)
		if body.name == "Player":
			body._damaged(damage_to_player)

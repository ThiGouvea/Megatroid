extends Node2D

var shot_scene: PackedScene = preload("res://scenes/shot.tscn")

var numeroMoedas = 0

func _on_coin_mais_moeda(quantidade) -> void:
	numeroMoedas += quantidade

func _on_player_shoted(pos, fliped, up, down) -> void:
	var shot = shot_scene.instantiate()
	if fliped:
		shot.position = pos
		$shots.add_child(shot)
		shot.setup(true, up, down)
	else:
		shot.position = pos
		$shots.add_child(shot)
		shot.setup(false, up, down)

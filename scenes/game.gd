extends Node2D

var shot_scene: PackedScene = preload("res://scenes/shot.tscn")

var numeroMoedas = 0

func _on_coin_mais_moeda(quantidade) -> void:
	numeroMoedas += quantidade
	print(numeroMoedas)

func _on_player_shoted(pos, fliped) -> void:
	var shot = shot_scene.instantiate()
	if fliped:
		shot.position = pos
		shot.position.x += 30
		$levels/level1/shots.add_child(shot)
		shot.setup(true)
	else:
		shot.position = pos
		$levels/level1/shots.add_child(shot)

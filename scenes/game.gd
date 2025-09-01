extends Node2D

var numeroMoedas = 0

func _on_coin_mais_moeda(quantidade) -> void:
	numeroMoedas += quantidade
	print(numeroMoedas)
